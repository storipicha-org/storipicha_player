import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'storipicha_player_ios_method_channel.dart';

abstract class StoripichaPlayerIosPlatform extends PlatformInterface {
  /// Constructs a StoripichaPlayerIosPlatform.
  StoripichaPlayerIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static StoripichaPlayerIosPlatform _instance = MethodChannelStoripichaPlayerIos();

  /// The default instance of [StoripichaPlayerIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoripichaPlayerIos].
  static StoripichaPlayerIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoripichaPlayerIosPlatform] when
  /// they register themselves.
  static set instance(StoripichaPlayerIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
