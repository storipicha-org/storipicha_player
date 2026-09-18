package io.storipicha.storipicha_player_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry

/** Android platform implementation of the StoripichaPlayer plugin. */
class StoripichaPlayerAndroidPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private var textureRegistry: TextureRegistry? = null
  private val players = mutableMapOf<Long, NativePlayerInstance>()

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "io.storipicha.player/methods")
    channel.setMethodCallHandler(this)
    textureRegistry = flutterPluginBinding.textureRegistry
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "create" -> handleCreate(result)
      "dispose" -> handleDispose(call, result)
      else -> result.notImplemented()
    }
  }

  private fun handleCreate(result: Result) {
    val registry = textureRegistry ?: run {
      result.error("NO_TEXTURE_REGISTRY", "TextureRegistry is null", null)
      return
    }

    // 1. Reserve a surface in Flutter's rendering pipeline 🎨
    val entry = registry.createSurfaceTexture()
    val textureId = entry.id()

    // 2. We will instantiate our native Media3 player wrapper here 🎬
    // val playerInstance = NativePlayerInstance(context, entry)
    // players[textureId] = playerInstance

    result.success(textureId)
  }

  private fun handleDispose(call: MethodCall, result: Result) {
    val textureId = (call.argument<Number>("textureId"))?.toLong()
    if (textureId != null) {
      players.remove(textureId)?.dispose()
      result.success(null)
    } else {
      result.error("INVALID_ARGUMENT", "Texture ID is missing", null)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    players.values.forEach { it.dispose() }
    players.clear()
  }
}