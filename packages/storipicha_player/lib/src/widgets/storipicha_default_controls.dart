import 'dart:async';
import 'package:flutter/material.dart';
import '../storipicha_player_config.dart';
import '../storipicha_player_controller.dart';

/// 🎛️ Default player controls overlay featuring animated visibility,
/// play/pause state toggle, interactive progress scrubbing, and timestamp display.
class StoripichaDefaultControls extends StatefulWidget {
  const StoripichaDefaultControls({
    super.key,
    required this.controller,
    required this.config,
    this.customControlsBuilder,
  });

  final StoripichaPlayerController controller;
  final StoripichaPlayerControlsConfig config;

  /// 🛠️ Optional developer-provided custom controls widget
  final Widget Function(
    BuildContext context,
    StoripichaPlayerController controller,
    StoripichaPlayerControlsConfig controlsConfig,
  )?
  customControlsBuilder;

  @override
  State<StoripichaDefaultControls> createState() =>
      _StoripichaDefaultControlsState();
}

class _StoripichaDefaultControlsState extends State<StoripichaDefaultControls> {
  Timer? _hideTimer;
  double? _dragValue; // 🎚️ Holds the slider value while actively scrubbing

  @override
  void initState() {
    super.initState();
    _startHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  /// ⏱️ Resets or starts the auto-hide timer for controls overlay
  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(widget.config.autoHideDuration, () {
      // Keep controls visible if user is currently scrubbing or if playback is paused
      if (mounted && widget.controller.value.isPlaying && _dragValue == null) {
        widget.controller.controlsVisible = false;
      }
    });
  }

  /// 👆 Toggles control visibility on background tap
  void _toggleVisibility() {
    widget.controller.controlsVisible = !widget.controller.controlsVisible;
    if (widget.controller.controlsVisible) {
      _startHideTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        final controlsVisible = widget.controller.controlsVisible;

        final controlsContent = widget.customControlsBuilder != null
            ? widget.customControlsBuilder!(
                context,
                widget.controller,
                widget.config,
              )
            : _buildDefaultControlsOverlay();

        return GestureDetector(
          onTap: _toggleVisibility,
          behavior: HitTestBehavior.opaque,
          child: AnimatedOpacity(
            opacity: controlsVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IgnorePointer(
              ignoring: !controlsVisible,
              child: Container(color: Colors.black38, child: controlsContent),
            ),
          ),
        );
      },
    );
  }

  /// ⏯️ Default UI: Center Play/Pause button + Bottom timeline slider
  Widget _buildDefaultControlsOverlay() {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, state, _) {
        // Calculate raw progress ratio (0.0 to 1.0)
        final currentProgress = _calculateProgress(
          state.position,
          state.duration,
        );
        // Use local scrub value while dragging, otherwise default to stream position
        final sliderValue = _dragValue ?? currentProgress;

        return Stack(
          children: [
            // 1. Center Action Button (Play / Pause / Buffering)
            Center(
              child: state.state.name == 'buffering'
                  ? const CircularProgressIndicator(color: Colors.white)
                  : IconButton(
                      iconSize: 56.0,
                      icon: Icon(
                        state.isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        color: widget.config.accentColor,
                      ),
                      onPressed: () {
                        if (state.isPlaying) {
                          widget.controller.pause();
                        } else {
                          widget.controller.play();
                        }
                        _startHideTimer();
                      },
                    ),
            ),

            // 2. Bottom Timeline Bar (Timestamps + Seek Slider) 📊
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                color: Colors.black45,
                child: Row(
                  children: [
                    // Elapsed Time Label
                    Text(
                      _formatDuration(
                        _dragValue != null
                            ? Duration(
                                milliseconds:
                                    (_dragValue! *
                                            state.duration.inMilliseconds)
                                        .round(),
                              )
                            : state.position,
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),

                    // Progress Slider 🎚️
                    Expanded(
                      child: Slider(
                        value: sliderValue,
                        activeColor: widget.config.accentColor,
                        inactiveColor: Colors.white24,
                        onChangeStart: (_) {
                          _hideTimer?.cancel(); // Freeze timer while scrubbing
                        },
                        onChanged: (double value) {
                          setState(() {
                            _dragValue = value; // Update UI locally
                          });
                        },
                        onChangeEnd: (double value) {
                          final totalMs = state.duration.inMilliseconds;
                          final targetMs = (value * totalMs).round();

                          widget.controller.seekTo(
                            Duration(milliseconds: targetMs),
                          );

                          setState(() {
                            _dragValue = null; // Release scrubbing override
                          });

                          _startHideTimer(); // Restart auto-hide timer
                        },
                      ),
                    ),

                    // Total Duration Label
                    Text(
                      _formatDuration(state.duration),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Calculates normalized progress ratio safely
  double _calculateProgress(Duration position, Duration duration) {
    final totalMs = duration.inMilliseconds;
    if (totalMs <= 0) return 0.0;
    return (position.inMilliseconds / totalMs).clamp(0.0, 1.0);
  }

  /// Formats Duration into "MM:SS" or "HH:MM:SS"
  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }
}
