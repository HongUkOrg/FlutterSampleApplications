
import 'package:flutter/material.dart';

import 'burger_sub_screen_01.dart';
import 'burger_sub_screen_02.dart';
import 'burger_sub_screen_03.dart';

class Burger extends StatefulWidget {

  Burger({Key key}) : super(key: key);

  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  int _selectedIndex = 0;
  final List<Widget> _widgets = [BurgerOne(), BurgerTwo(), BurgerThree(),];
  
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
            title: Text('Burger 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            title: Text('Burger 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            title: Text('Burger 3'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.amber[100],
      ),
    );
  }

}