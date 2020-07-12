
import 'package:flutter/cupertino.dart';
import 'package:sampleweather/weather/weather_api_client.dart';
import 'package:sampleweather/weather/weather_model.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  const WeatherRepository({
    @required this.weatherApiClient
  }) : assert(weatherApiClient != null);

  Future<WeatherModel> getWeather(String cityName) async {
    final locationId = await weatherApiClient.getLocationId(cityName);
    final weatherModel = await weatherApiClient.fetchWeather(locationId);

    return weatherModel;
  }
}