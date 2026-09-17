
import 'storipicha_player_ios_platform_interface.dart';

class StoripichaPlayerIos {
  Future<String?> getPlatformVersion() {
    return StoripichaPlayerIosPlatform.instance.getPlatformVersion();
  }
}
