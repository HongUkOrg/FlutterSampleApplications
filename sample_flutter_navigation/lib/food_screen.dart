
import 'package:flutter/material.dart';
import 'package:sampleflutternavigation/main_drawer.dart';

import 'screens/food/burger/burger_main_screen.dart';
import 'screens/food/pizza/pizza_main_screen.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter navigation sample'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.fastfood),
                  text: 'Burger',
                ),
                Tab(
                  icon: Icon(Icons.local_pizza),
                  text: 'Pizza',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Burger(),
              Pizza(),
            ],
          ),
          drawer: MainDrawer(),
      ),
    );
  }
}