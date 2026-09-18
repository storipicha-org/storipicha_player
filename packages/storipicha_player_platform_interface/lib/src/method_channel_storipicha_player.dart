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

      // 💡 Convert integer milliseconds into Duration maps or construct manually
      return PlayerStateSnapshot(
        state: PlaybackState.values.byName(map['state'] as String? ?? 'idle'),
        isPlaying: map['isPlaying'] as bool? ?? false,
        position: Duration(milliseconds: map['position'] as int? ?? 0),
        bufferedPosition: Duration(
          milliseconds: map['bufferedPosition'] as int? ?? 0,
        ),
        duration: Duration(milliseconds: map['duration'] as int? ?? 0),
        errorMessage: map['errorMessage'] as String?,
      );
    });
  }

  @override
  Future<void> dispose(int textureId) async {
    await _channel.invokeMethod('dispose', {'textureId': textureId});
  }
}
