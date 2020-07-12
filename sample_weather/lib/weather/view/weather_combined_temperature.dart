
import 'package:flutter/material.dart';
import 'package:sampleweather/weather/view/weather_temperature.dart';
import 'package:sampleweather/weather/weather_model.dart';

import 'weather_conditions.dart';

class WeatherCombinedTemperature extends StatelessWidget {

  final WeatherModel weatherModel;

  WeatherCombinedTemperature(this.weatherModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(weatherModel.weatherCondition),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherTemperature(temperature: weatherModel.temp, high: weatherModel.maxTemp, low: weatherModel.minTemp),
            ),
          ],
        ),
        Center(
          child: Text(
            '${weatherModel.formattedCondition}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
