import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'states/weather_state.dart';
part 'events/weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository}) : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }

  }

  Stream<WeatherState> _mapWeatherRequestedToState(WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final WeatherModel weatherModel = await weatherRepository.getWeather(event.cityName);
      yield WeatherLoadSuccess(weatherModel: weatherModel);
    } catch (exception) {
      print('bleo: error ${exception.toString()}');
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(WeatherRefreshRequested event) async* {
    try {
      final WeatherModel weatherModel = await weatherRepository.getWeather(event.cityName);
      yield WeatherLoadSuccess(weatherModel: weatherModel);
    } catch (_) {
      yield state;
    }
  }
}
