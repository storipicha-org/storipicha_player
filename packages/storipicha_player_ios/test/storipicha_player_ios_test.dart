import 'package:flutter_test/flutter_test.dart';
import 'package:storipicha_player_ios/storipicha_player_ios.dart';
import 'package:storipicha_player_ios/storipicha_player_ios_platform_interface.dart';
import 'package:storipicha_player_ios/storipicha_player_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStoripichaPlayerIosPlatform
    with MockPlatformInterfaceMixin
    implements StoripichaPlayerIosPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StoripichaPlayerIosPlatform initialPlatform = StoripichaPlayerIosPlatform.instance;

  test('$MethodChannelStoripichaPlayerIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStoripichaPlayerIos>());
  });

  test('getPlatformVersion', () async {
    StoripichaPlayerIos storipichaPlayerIosPlugin = StoripichaPlayerIos();
    MockStoripichaPlayerIosPlatform fakePlatform = MockStoripichaPlayerIosPlatform();
    StoripichaPlayerIosPlatform.instance = fakePlatform;

    expect(await storipichaPlayerIosPlugin.getPlatformVersion(), '42');
  });
}
