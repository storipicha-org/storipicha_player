import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'storipicha_player_android_method_channel.dart';

abstract class StoripichaPlayerAndroidPlatform extends PlatformInterface {
  /// Constructs a StoripichaPlayerAndroidPlatform.
  StoripichaPlayerAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static StoripichaPlayerAndroidPlatform _instance = MethodChannelStoripichaPlayerAndroid();

  /// The default instance of [StoripichaPlayerAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoripichaPlayerAndroid].
  static StoripichaPlayerAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoripichaPlayerAndroidPlatform] when
  /// they register themselves.
  static set instance(StoripichaPlayerAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
