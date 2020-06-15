import 'package:flutter/material.dart';
import 'package:sampleflutternavigation/food_screen.dart';
import 'package:sampleflutternavigation/login_screen.dart';
import 'transportation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/transportation': (context) => TransportationScreen(),
        '/food': (context) => FoodScreen(),
      },
    );
  }
}