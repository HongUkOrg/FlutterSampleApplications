
import 'package:flutter/material.dart';
import 'package:sampleflutternavigation/main_drawer.dart';

import 'screens/transportation/bike/bike_main_screen.dart';
import 'screens/transportation/car/car_main_screen.dart';
import 'screens/transportation/train/train_main_screen.dart';

class TransportationScreen extends StatelessWidget {
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
          ),
          drawer: MainDrawer(),
      ),
    );
  }
}