import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storipicha_player/storipicha_player.dart';

import 'storipicha_default_controls.dart';

/// 📺 Flutter widget rendering native video with modular controls configuration.
class StoriPichaPlayer extends StatelessWidget {
  const StoriPichaPlayer({
    super.key,
    required this.controller,
    this.controlsBuilder,
  });

  final StoripichaPlayerController controller;

  /// 🛠️ Custom builder for rendering player controls UI overlay.
  final Widget Function(
    BuildContext context,
    StoripichaPlayerController controller,
    StoripichaPlayerControlsConfig controlsConfig,
    // bool controlsVisible,
  )?
  controlsBuilder;

  @override
  Widget build(BuildContext context) {
    // Read centralized config from controller
    final config = controller.config;

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, _) {
        final textureId = controller.textureId;

        if (textureId == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // 1. Build video surface using controller's viewType
        Widget videoSurface;
        if (controller.viewType == PlayerViewType.texture) {
          videoSurface = Texture(textureId: textureId);
        } else if (defaultTargetPlatform == TargetPlatform.android) {
          videoSurface = AndroidView(
            viewType: 'io.storipicha.player/surface_view',
            creationParams: {'textureId': textureId},
            creationParamsCodec: const StandardMessageCodec(),
          );
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          videoSurface = UiKitView(
            viewType: 'io.storipicha.player/uikit_view',
            creationParams: {'textureId': textureId},
            creationParamsCodec: const StandardMessageCodec(),
          );
        } else {
          videoSurface = const Center(
            child: Text('Platform view rendering not supported.'),
          );
        }

        // 2. Determine controls overlay widget
        Widget? controlsOverlay;
        if (config.controlsConfig.enableControls) {
          controlsOverlay = controlsBuilder != null
              ? controlsBuilder!(context, controller, config.controlsConfig)
              // 👇 Our new default controls take over here!
              : StoripichaDefaultControls(
                  controller: controller,
                  config: config.controlsConfig,
                );
        }

        // 3. Apply configurable aspect ratio from controller.config
        return AspectRatio(
          aspectRatio: config.aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [videoSurface, ?controlsOverlay],
          ),
        );
      },
    );
  }
}
