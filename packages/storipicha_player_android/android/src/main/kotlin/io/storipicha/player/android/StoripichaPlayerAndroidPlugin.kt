package io.storipicha.player.android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry

/** Android platform implementation of the StoripichaPlayer plugin. */
class StoripichaPlayerAndroidPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var binding: FlutterPluginBinding? = null
    private var textureRegistry: TextureRegistry? = null
    private var bindingContext: android.content.Context? = null
    
    private val players = mutableMapOf<Long, NativePlayerInstance>()
    private val eventChannels = mutableMapOf<Long, EventChannel>()

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        this.binding = binding
        textureRegistry = binding.textureRegistry
        bindingContext = binding.applicationContext

        // 1️⃣ MethodChannel Setup
        channel = MethodChannel(binding.binaryMessenger, "io.storipicha.player/methods")
        channel.setMethodCallHandler(this)

        // 2️⃣ PlatformView Setup for Native SurfaceView
        binding.platformViewRegistry.registerViewFactory(
            "io.storipicha.player/surface_view",
            StoripichaSurfaceViewFactory(players)
        )
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val textureId = call.argument<Number>("textureId")?.toLong()
        val player = players[textureId]

        when (call.method) {
            "create" -> handleCreate(result)
            "setMediaItem" -> {
                val mediaMap = call.argument<Map<String, Any>>("mediaItem")
                val uri = mediaMap?.get("url") as? String
                
                // 💡 Check that both the valid player instance and uri are present
                if (player != null && uri != null) {
                    player.setMediaItem(uri)
                    result.success(null)
                } else {
                    result.error(
                        "INVALID_ARGUMENT", 
                        "Player instance not found for textureId ($textureId) or URI missing", 
                        null
                    )
                }
            }
            "play" -> {
                player?.play()
                result.success(null)
            }
            "pause" -> {
                player?.pause()
                result.success(null)
            }
            "seekTo" -> {
                val position = call.argument<Number>("position")?.toLong()
                if (player != null && position != null) {
                    player.seekTo(position)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Invalid seek position", null)
                }
            }
            "dispose" -> handleDispose(call, result)
            else -> result.notImplemented()
        }
    }

    private fun handleCreate(result: Result) {
        val registry = textureRegistry
        val context = bindingContext
        val engineBinding = binding

        if (registry == null || context == null || engineBinding == null) {
            result.error("NOT_INITIALIZED", "Plugin engine context not ready", null)
            return
        }

        // 1. Reserve a surface texture entry in Flutter's rendering pipeline
        val entry = registry.createSurfaceTexture()
        val textureId = entry.id()

        // 2. Instantiate and register native player
        val playerInstance = NativePlayerInstance(context, entry)
        players[textureId] = playerInstance

        // 3. 📡 Register the EventChannel to handle real-time playback state updates
        val eventChannel = EventChannel(
            engineBinding.binaryMessenger, 
            "io.storipicha.player/events/$textureId"
        )
        
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                // Connection established from Dart side
                // 📡 Forward the sink to our player instance
                players[textureId]?.setEventSink(events)
            }

            override fun onCancel(arguments: Any?) {
                // Listener cancelled
                players[textureId]?.setEventSink(null)
            }
        })
        
        eventChannels[textureId] = eventChannel

        result.success(textureId)
    }

    private fun handleDispose(call: MethodCall, result: Result) {
        val textureId = (call.argument<Number>("textureId"))?.toLong()
        if (textureId != null) {
            // Clean up player and event channel
            players.remove(textureId)?.dispose()
            eventChannels.remove(textureId)?.setStreamHandler(null)
            result.success(null)
        } else {
            result.error("INVALID_ARGUMENT", "Texture ID is missing", null)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        players.values.forEach { it.dispose() }
        players.clear()
        
        eventChannels.values.forEach { it.setStreamHandler(null) }
        eventChannels.clear()
        
        textureRegistry = null
        bindingContext = null
        this.binding = null
    }
}