import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_storipicha_player.dart';
import 'types/media_item.dart';
import 'types/player_state.dart';

abstract class StoripichaPlayerPlatform extends PlatformInterface {
  StoripichaPlayerPlatform() : super(token: _token);

  static final Object _token = Object();
  static StoripichaPlayerPlatform _instance = MethodChannelStoripichaPlayer();

  static StoripichaPlayerPlatform get instance => _instance;

  static set instance(StoripichaPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Creates a native player instance and returns a unique texture ID for rendering.
  Future<int?> create() {
    throw UnimplementedError('create() has not been implemented.');
  }

  /// Sets the media source to be loaded by the native player engine.
  Future<void> setMediaItem(int textureId, MediaItem item) {
    throw UnimplementedError('setMediaItem() has not been implemented.');
  }

  /// Starts or resumes video/audio playback.
  Future<void> play(int textureId) {
    throw UnimplementedError('play() has not been implemented.');
  }

  /// Pauses playback.
  Future<void> pause(int textureId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  /// Seeks to a specific timestamp in the media.
  Future<void> seekTo(int textureId, Duration position) {
    throw UnimplementedError('seekTo() has not been implemented.');
  }

  /// Listens to real-time playback state updates from the native player.
  Stream<PlayerStateSnapshot> playerStateStream(int textureId) {
    throw UnimplementedError('playerStateStream() has not been implemented.');
  }

  /// Releases native player resources (ExoPlayer/AVPlayer instance).
  Future<void> dispose(int textureId) {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
