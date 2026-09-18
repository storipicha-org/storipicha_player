package io.storipicha.player.android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry

/** 🎬 Native Android platform implementation of the StoriPichaPlayer plugin. */
class StoriPichaPlayerPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private var textureRegistry: TextureRegistry? = null
  private val players = mutableMapOf<Long, NativePlayerInstance>()

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "io.storipicha.player/methods")
    channel.setMethodCallHandler(this)
    textureRegistry = binding.textureRegistry
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

    // 🎨 Reserve a GPU surface in Flutter's rendering pipeline
    val entry = registry.createSurfaceTexture()
    val textureId = entry.id()

    // 🤖 Instantiate native player wrapper (bound to this texture entry)
    // val playerInstance = NativePlayerInstance(entry)
    // players[textureId] = playerInstance

    result.success(textureId)
  }

  private fun handleDispose(call: MethodCall, result: Result) {
    val textureId = call.argument<Number>("textureId")?.toLong()
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