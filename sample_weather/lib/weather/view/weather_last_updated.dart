import 'package:flutter/material.dart';

class WeatherLastUpdated extends StatelessWidget {
  final DateTime lastDateTime;

  const WeatherLastUpdated(this.lastDateTime);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(lastDateTime).format(context)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
