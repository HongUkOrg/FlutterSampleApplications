import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_adbrix_remaster/flutter_adbrix_remaster.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_adbrix_remaster');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterAdbrixRemaster.platformVersion, '42');
  });
}
