import 'package:flutter/material.dart';

import '../storipicha_player.dart';

class StoripichaPlayerControlsConfig {
  const StoripichaPlayerControlsConfig({
    this.enableControls = true,
    this.autoHideDuration = const Duration(seconds: 3),
    this.showPlayPauseButton = true,
    this.showProgressBar = true,
    this.showDurationLabels = true,
    this.accentColor = Colors.white,
  });

  /// Whether the control overlay is enabled.
  final bool enableControls;

  /// Time before the controls overlay automatically fades out.
  final Duration autoHideDuration;

  /// Whether to display the central play/pause button.
  final bool showPlayPauseButton;

  /// Whether to display the bottom timeline seek bar.
  final bool showProgressBar;

  /// Whether to display elapsed and total duration text.
  final bool showDurationLabels;

  /// Main color accent for active controls (e.g., seek slider active track).
  final Color accentColor;
}

/// ⚙️ Top-level configuration options for the player widget.
class StoripichaPlayerConfig {
  const StoripichaPlayerConfig({
    this.aspectRatio = 16 / 9,
    this.viewType = PlayerViewType.texture,
    this.controlsConfig = const StoripichaPlayerControlsConfig(),
  });

  /// 📐 Aspect ratio of the video container (defaults to 16/9).
  final double aspectRatio;

  /// 🎨 Rendering strategy (texture vs. surface).
  final PlayerViewType viewType;

  /// 🎛️ Configuration settings for default controls.
  final StoripichaPlayerControlsConfig controlsConfig;
}
