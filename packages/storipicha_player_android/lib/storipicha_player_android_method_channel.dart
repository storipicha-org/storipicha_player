import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'storipicha_player_android_platform_interface.dart';

/// An implementation of [StoripichaPlayerAndroidPlatform] that uses method channels.
class MethodChannelStoripichaPlayerAndroid extends StoripichaPlayerAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('storipicha_player_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
