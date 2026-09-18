import 'package:flutter/services.dart';

import 'storipicha_player_platform_interface.dart';
import 'types/media_item.dart';
import 'types/player_state.dart';

class MethodChannelStoripichaPlayer extends StoripichaPlayerPlatform {
  final MethodChannel _channel = const MethodChannel(
    'io.storipicha.player/methods',
  );

  @override
  Future<int?> create() async {
    final textureId = await _channel.invokeMethod<int>('create');
    return textureId;
  }

  @override
  Future<void> setMediaItem(int textureId, MediaItem item) async {
    await _channel.invokeMethod('setMediaItem', {
      'textureId': textureId,
      'mediaItem': item.toJson(), // 👈 Using freezed's generated toJson()
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
      return PlayerStateSnapshot.fromJson(
        map,
      ); // 👈 Deserializing using freezed's fromJson
    });
  }

  @override
  Future<void> dispose(int textureId) async {
    await _channel.invokeMethod('dispose', {'textureId': textureId});
  }
}
