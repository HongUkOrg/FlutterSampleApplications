import 'package:flutter/material.dart';

import 'screens/bike_main_screen.dart';
import 'screens/car/car_main_screen.dart';
import 'screens/train/train_main_screen.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter navigation sample'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Car',
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Train',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Bike',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Car(),
            Train(),
            Bike(),
          ],
        )
      ),
    );
  }

}