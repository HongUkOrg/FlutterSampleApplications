
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sampleweather/weather/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState { }

class WeatherLoadInProgress extends WeatherState { }

class WeatherLoadSuccess extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherLoadSuccess({@required this.weatherModel}) : assert(weatherModel != null);

  @override
  List<Object> get props => [weatherModel];
}

class WeatherLoadFailure extends WeatherState { }