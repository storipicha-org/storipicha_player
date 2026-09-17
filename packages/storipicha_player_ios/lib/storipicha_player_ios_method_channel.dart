import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'storipicha_player_ios_platform_interface.dart';

/// An implementation of [StoripichaPlayerIosPlatform] that uses method channels.
class MethodChannelStoripichaPlayerIos extends StoripichaPlayerIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('storipicha_player_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
