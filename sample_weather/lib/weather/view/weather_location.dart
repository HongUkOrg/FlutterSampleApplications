
import 'package:flutter/material.dart';

class WeatherLocation extends StatelessWidget {

  final String location;

  WeatherLocation(this.location);

  @override
  Widget build(BuildContext context) {

    return Text(
      location,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
