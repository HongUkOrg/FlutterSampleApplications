
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleflutternavigation/screens/car/car_sub_screen_01.dart';
import 'package:sampleflutternavigation/screens/car/car_sub_screen_02.dart';
import 'package:sampleflutternavigation/screens/car/car_sub_screen_03.dart';

class Car extends StatefulWidget {

  Car({Key key}) : super(key: key);

  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  int _selectedIndex = 0;
  final List<Widget> _widgets = [CarOne(), CarTwo(), CarThree(),];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            title: Text('Car 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            title: Text('Car 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            title: Text('Car 3'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.amber[100],
      ),
    );
  }

}