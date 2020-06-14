
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleflutternavigation/screens/train/train_sub_screen_01.dart';
import 'package:sampleflutternavigation/screens/train/train_sub_screen_02.dart';
import 'package:sampleflutternavigation/screens/train/train_sub_screen_03.dart';
import 'package:sampleflutternavigation/screens/train/train_sub_screen_04.dart';

class Train extends StatefulWidget {

  Train({Key key}) : super(key: key);

  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {

  int _selectedIndex = 0;
  final List<Widget> _trainWidget = [TrainOne(), TrainTwo(), TrainThree(), TrainFour(),];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _trainWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            title: Text('Train 1'),
            backgroundColor: Colors.amber[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            title: Text('Train 2'),
            backgroundColor: Colors.red[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            title: Text('Train 3'),
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_4),
            title: Text('Train 4'),
            backgroundColor: Colors.greenAccent[100]
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
      ),
    );
  }

}