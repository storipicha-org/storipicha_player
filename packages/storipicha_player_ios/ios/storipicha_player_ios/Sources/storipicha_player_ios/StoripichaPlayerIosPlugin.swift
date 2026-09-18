import Flutter
import UIKit

public class StoripichaPlayerIosPlugin: NSObject, FlutterPlugin {
  private var registry: FlutterTextureRegistry
  private var messenger: FlutterBinaryMessenger

  private var players: [Int64: NativeIosPlayerInstance] = [:]
  private var eventChannels: [Int64: FlutterEventChannel] = [:]

  init(registrar: FlutterPluginRegistrar) {
    self.registry = registrar.textures()
    self.messenger = registrar.messenger()
    super.init()
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "io.storipicha.player/methods",
      binaryMessenger: registrar.messenger()
    )
    let instance = StoripichaPlayerIosPlugin(registrar: registrar)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    let textureId = (args?["textureId"] as? NSNumber)?.int64Value
    let player = textureId != nil ? players[textureId!] : nil

    switch call.method {
    case "create":
      handleCreate(result: result)

    case "setMediaItem":
      if let mediaMap = args?["mediaItem"] as? [String: Any],
        let uri = mediaMap["url"] as? String ?? mediaMap["uri"] as? String,
        let player = player
      {
        player.setMediaItem(url: uri)
        result(nil)
      } else {
        result(
          FlutterError(
            code: "INVALID_ARGUMENT",
            message: "Player or URI missing for textureId (\(String(describing: textureId)))",
            details: nil
          ))
      }

    case "play":
      player?.play()
      result(nil)

    case "pause":
      player?.pause()
      result(nil)

    case "seekTo":
      if let position = (args?["position"] as? NSNumber)?.int64Value,
        let player = player
      {
        player.seekTo(positionMs: position)
        result(nil)
      } else {
        result(
          FlutterError(code: "INVALID_ARGUMENT", message: "Invalid seek position", details: nil))
      }

    case "dispose":
      if let textureId = textureId {
        players.removeValue(forKey: textureId)?.dispose()

        // Clear stream handler explicitly on teardown
        if let channel = eventChannels.removeValue(forKey: textureId) {
          channel.setStreamHandler(nil)
        }
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Texture ID missing", details: nil))
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func handleCreate(result: @escaping FlutterResult) {
    // 1. Generate a temporary ID for initial instance configuration
    let tempId: Int64 = Int64(Date().timeIntervalSince1970 * 1000)

    // 2. Instantiate NativeIosPlayerInstance (conforms directly to FlutterTexture)
    let playerInstance = NativeIosPlayerInstance(textureRegistry: registry, textureId: tempId)

    // 3. Register playerInstance into Flutter GPU texture registry to get actual texture ID
    let actualTextureId = registry.register(playerInstance)

    // 4. Track active player instance
    players[actualTextureId] = playerInstance

    // 5. Register EventChannel for real-time state updates using actualTextureId
    let eventChannel = FlutterEventChannel(
      name: "io.storipicha.player/events/\(actualTextureId)",
      binaryMessenger: messenger
    )
    eventChannel.setStreamHandler(playerInstance)
    eventChannels[actualTextureId] = eventChannel

    // 6. Return actual textureId back to Dart
    result(actualTextureId)
  }
}