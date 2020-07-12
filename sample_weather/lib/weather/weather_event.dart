
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String cityName;

  const WeatherRequested({@required this.cityName}) : assert(cityName != null);

  @override
  List<Object> get props => [cityName];
}
