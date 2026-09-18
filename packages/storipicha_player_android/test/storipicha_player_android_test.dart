// import 'package:flutter_test/flutter_test.dart';
// import 'package:storipicha_player_android/storipicha_player_android.dart';
// import 'package:storipicha_player_android/storipicha_player_android_platform_interface.dart';
// import 'package:storipicha_player_android/storipicha_player_android_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockStoripichaPlayerAndroidPlatform
//     with MockPlatformInterfaceMixin
//     implements StoripichaPlayerAndroidPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final StoripichaPlayerAndroidPlatform initialPlatform = StoripichaPlayerAndroidPlatform.instance;

//   test('$MethodChannelStoripichaPlayerAndroid is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelStoripichaPlayerAndroid>());
//   });

//   test('getPlatformVersion', () async {
//     StoripichaPlayerAndroid storipichaPlayerAndroidPlugin = StoripichaPlayerAndroid();
//     MockStoripichaPlayerAndroidPlatform fakePlatform = MockStoripichaPlayerAndroidPlatform();
//     StoripichaPlayerAndroidPlatform.instance = fakePlatform;

//     expect(await storipichaPlayerAndroidPlugin.getPlatformVersion(), '42');
//   });
// }
