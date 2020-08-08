part of '../weather_bloc.dart';

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