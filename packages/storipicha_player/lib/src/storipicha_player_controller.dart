import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storipicha_player_platform_interface/storipicha_player_platform_interface.dart';

import 'player_view_type.dart';

class StoripichaPlayerController extends ValueNotifier<PlayerStateSnapshot> {
  StoripichaPlayerController({this.viewType = PlayerViewType.texture})
    : super(PlayerStateSnapshot.initial());

  /// 🎛️ Selected rendering view strategy
  PlayerViewType viewType;

  int? _textureId;
  StreamSubscription<PlayerStateSnapshot>? _subscription;

  /// 🆔 Unique texture ID returned by the native platform
  int? get textureId => _textureId;

  /// 🚀 Initializes native player resources and begins state streaming
  Future<void> initialize() async {
    _textureId = await StoripichaPlayerPlatform.instance.create();

    if (_textureId != null) {
      _subscription = StoripichaPlayerPlatform.instance
          .playerStateStream(_textureId!)
          .listen((state) {
            value = state;
          });
    }
  }

  /// 🎵 Sets the current media source
  Future<void> setMediaItem(MediaItem item) async {
    if (_textureId == null) return;
    await StoripichaPlayerPlatform.instance.setMediaItem(_textureId!, item);
  }

  /// ▶️ Resumes playback
  Future<void> play() async {
    if (_textureId == null) return;
    await StoripichaPlayerPlatform.instance.play(_textureId!);
  }

  /// ⏸️ Pauses playback
  Future<void> pause() async {
    if (_textureId == null) return;
    await StoripichaPlayerPlatform.instance.pause(_textureId!);
  }

  /// ⏩ Seeks to a specific timestamp
  Future<void> seekTo(Duration position) async {
    if (_textureId == null) return;
    await StoripichaPlayerPlatform.instance.seekTo(_textureId!, position);
  }

  /// 🧹 Releases native player resources
  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    if (_textureId != null) {
      await StoripichaPlayerPlatform.instance.dispose(_textureId!);
      _textureId = null;
    }
    super.dispose();
  }
}
