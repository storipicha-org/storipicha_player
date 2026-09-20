import 'dart:math';

import 'package:flutter/services.dart';
import 'package:storipicha_player_platform_interface/storipicha_player_platform_interface.dart';

/// The iOS implementation of [StoripichaPlayerPlatform].
class StoripichaPlayerIos extends StoripichaPlayerPlatform {
  /// The method channel used to send commands to native iOS.
  final MethodChannel _channel = const MethodChannel(
    'io.storipicha.player/methods',
  );

  /// Registers this class as the default instance of [StoripichaPlayerPlatform].
  static void registerWith() {
    StoripichaPlayerPlatform.instance = StoripichaPlayerIos();
  }

  @override
  Future<int?> create() async {
    final textureId = await _channel.invokeMethod<int>('create');
    return textureId;
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

      // 🛡️ Safely parse position and duration as num to handle both int and double values
      final rawPos = (map['position'] as num?)?.toInt() ?? 0;
      final rawDur = (map['duration'] as num?)?.toInt() ?? 0;

      return PlayerStateSnapshot(
        state: PlaybackState.values.byName(map['state'] as String? ?? 'idle'),
        isPlaying: map['isPlaying'] as bool? ?? false,
        position: Duration(milliseconds: max(0, rawPos)),
        bufferedPosition: Duration(
          milliseconds: (map['bufferedPosition'] as num?)?.toInt() ?? 0,
        ),
        duration: Duration(milliseconds: max(0, rawDur)),
        errorMessage: map['errorMessage'] as String?,
      );
    });
  }

  @override
  Future<void> dispose(int textureId) async {
    await _channel.invokeMethod('dispose', {'textureId': textureId});
  }
}
