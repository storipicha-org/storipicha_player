import 'package:flutter/services.dart';
import 'package:storipicha_player_platform_interface/storipicha_player_platform_interface.dart';

/// 🤖 Android implementation of [StoripichaPlayerPlatform]
class StoripichaPlayerAndroid extends StoripichaPlayerPlatform {
  static const MethodChannel _channel = MethodChannel(
    'io.storipicha.player/methods',
  );

  /// 3️⃣ Called automatically by Flutter's generated plugin registrant on Android boot
  static void registerWith() {
    StoripichaPlayerPlatform.instance = StoripichaPlayerAndroid();
  }

  @override
  Future<int?> create() async {
    return await _channel.invokeMethod<int>('create');
  }

  @override
  Future<void> setMediaItem(int textureId, MediaItem item) async {
    await _channel.invokeMethod('setMediaItem', {
      'textureId': textureId,
      'mediaItem': item.toJson(),
    });
  }

  @override
  Future<void> play(int textureId) async {
    await _channel.invokeMethod('play', {'textureId': textureId});
  }

  @override
  Future<void> pause(int textureId) async {
    await _channel.invokeMethod('pause', {'textureId': textureId});
  }

  @override
  Future<void> seekTo(int textureId, Duration position) async {
    await _channel.invokeMethod('seekTo', {
      'textureId': textureId,
      'position': position.inMilliseconds,
    });
  }

  @override
  Stream<PlayerStateSnapshot> playerStateStream(int textureId) {
    final eventChannel = EventChannel('io.storipicha.player/events/$textureId');
    return eventChannel.receiveBroadcastStream().map((dynamic event) {
      final Map<String, dynamic> map = Map<String, dynamic>.from(event as Map);
      return PlayerStateSnapshot.fromJson(map);
    });
  }

  @override
  Future<void> dispose(int textureId) async {
    await _channel.invokeMethod('dispose', {'textureId': textureId});
  }
}
