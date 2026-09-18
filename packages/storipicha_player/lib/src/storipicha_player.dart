import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'player_view_type.dart';
import 'storipicha_player_controller.dart';

/// 📺 Flutter widget that renders native video output.
class StoriPichaPlayer extends StatelessWidget {
  const StoriPichaPlayer({super.key, required this.controller});

  final StoripichaPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, _, _) {
        final textureId = controller.textureId;

        if (textureId == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // 🎨 1. Texture View Rendering
        if (controller.viewType == PlayerViewType.texture) {
          return Texture(textureId: textureId);
        }

        // 📱 2. Native Surface / Platform View Rendering
        if (defaultTargetPlatform == TargetPlatform.android) {
          return AndroidView(
            viewType: 'io.storipicha.player/surface_view',
            creationParams: {'textureId': textureId},
            creationParamsCodec: const StandardMessageCodec(),
          );
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          return UiKitView(
            viewType: 'io.storipicha.player/uikit_view',
            creationParams: {'textureId': textureId},
            creationParamsCodec: const StandardMessageCodec(),
          );
        }

        return const Center(
          child: Text(
            'Platform view rendering not supported on this platform.',
          ),
        );
      },
    );
  }
}
