
import 'storipicha_player_android_platform_interface.dart';

class StoripichaPlayerAndroid {
  Future<String?> getPlatformVersion() {
    return StoripichaPlayerAndroidPlatform.instance.getPlatformVersion();
  }
}
