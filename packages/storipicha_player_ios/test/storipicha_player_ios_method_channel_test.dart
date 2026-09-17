import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storipicha_player_ios/storipicha_player_ios_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelStoripichaPlayerIos platform = MethodChannelStoripichaPlayerIos();
  const MethodChannel channel = MethodChannel('storipicha_player_ios');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
