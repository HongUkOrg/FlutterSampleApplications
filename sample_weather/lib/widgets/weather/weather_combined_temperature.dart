
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_conditions.dart';
import 'weather_widgets.dart';
import '../../blocs/blocs.dart';
import '../../models/models.dart';

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
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return WeatherTemperature(
                      temperature: weatherModel.temp,
                      high: weatherModel.maxTemp,
                      low: weatherModel.minTemp,
                      units: state.temperatureUnits);
                },
              )
              )
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
