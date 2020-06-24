import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterAdbrixRemaster {
  static const MethodChannel _channel =
      const MethodChannel('flutter_adbrix_remaster');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<String> get startAdbrixSDK async {
    final String result = await _channel.invokeMethod('startAdbrixSDK');
    return result;
  }
  static Future<void> get onPause async {
    await _channel.invokeMethod('onPuase');
    return;
  }
  static Future<void> get onResume async {
    await _channel.invokeMethod('onResume');
    return;
  }
  static Future<void> login(userId) async {

    Map<String, dynamic> temp = {};
    dynamic myUserId = userId;
    assert(myUserId is String);
    temp['userId'] = myUserId;

    await _channel.invokeMethod('login', temp);
//    await _channel.invokeMapMethod('login', <String, dynamic> {
//      'userId': userId
//    });
    return;
  }

}
class AttrModel {
  var jsonData = {};
  setAttr(key,value){
    debugPrint('hongukk : '+key.runtimeType.toString());
    jsonData.putIfAbsent(key, value);
  }
}