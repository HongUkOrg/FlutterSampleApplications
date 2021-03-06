part of '../weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String cityName;

  const WeatherRequested({@required this.cityName}) : assert(cityName != null);

  @override
  List<Object> get props => [cityName];
}

class WeatherRefreshRequested extends WeatherEvent {
  final String cityName;

  WeatherRefreshRequested(this.cityName);

  @override
  List<Object> get props => [cityName];
}