import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_adbrix_remaster/flutter_adbrix_remaster.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  final FlutterAdbrixRemaster adbrix = FlutterAdbrixRemaster();

  @override
  void initState() {
    initPlatformState();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    String result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await adbrix.startAdbrixSDK;
    } on PlatformException {
      debugPrint('ERROR : Failed to initialize Adbrix SDK');
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Text('Adbrix Sample',
                style: TextStyle(fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500]),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(onPressed: () {
                        login('honguk');
                      }, child: Text('Login')),
                      FlatButton(onPressed: () {
                        var attr = new AttrModel();
                        attr.setAttr('honguk', 'hihi');
                        attr.setAttr(123123, 123123);
                        attr.setAttr(true, false);

                      }, child: Text('setUserProperty')),
                      FlatButton(onPressed: () {

                      }, child: Text('setLogLevel')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(onPressed: () {

                      }, child: Text('purchase')),
                      FlatButton(onPressed: () {

                      }, child: Text('viewHome')),
                      FlatButton(onPressed: () {

                      }, child: Text('setLogLevel')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(onPressed: () {

                      }, child: Text('Login')),
                      FlatButton(onPressed: () {

                      }, child: Text('setUserProperty')),
                      FlatButton(onPressed: () {

                      }, child: Text('setLogLevel')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(String userId) {
    adbrix.login('hello');
  }
}
