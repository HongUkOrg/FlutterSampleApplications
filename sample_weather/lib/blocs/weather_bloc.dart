import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sampleweather/weather/weather_model.dart';
import 'package:sampleweather/weather/weather_repository.dart';
import 'blocs.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository}) : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final WeatherModel weatherModel = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadSuccess(weatherModel: weatherModel);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
