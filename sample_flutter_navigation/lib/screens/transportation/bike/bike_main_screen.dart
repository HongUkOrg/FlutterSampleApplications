
import 'package:flutter/cupertino.dart';

class Bike extends StatefulWidget {

  Bike({Key key}) : super(key: key);

  _BikeState createState() => _BikeState();
}

class _BikeState extends State<Bike> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bike',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}