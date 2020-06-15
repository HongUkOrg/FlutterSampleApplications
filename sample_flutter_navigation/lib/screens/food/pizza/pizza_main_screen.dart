
import 'package:flutter/material.dart';
import 'pizza_sub_screen_01.dart';
import 'pizza_sub_screen_02.dart';
import 'pizza_sub_screen_03.dart';

class Pizza extends StatefulWidget {

  Pizza({Key key}) : super(key: key);

  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  int _selectedIndex = 0;
  final List<Widget> _widgets = [PizzaOne(), PizzaTwo(), PizzaThree(),];
  
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
            title: Text('Pizza 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            title: Text('Pizza 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            title: Text('Pizza 3'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.amber[100],
      ),
    );
  }

}