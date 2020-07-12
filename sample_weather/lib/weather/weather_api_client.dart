
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sampleweather/weather/weather_model.dart';

class WeatherApiClient {

  static const baseUrl = 'https://www.metaweather.com';
  final Client httpClient;

  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<int> getLocationId(String cityName) async {
    final locationUrl = baseUrl + '/api/location/search/?query=$cityName';
    final locationResponse = await httpClient.get(locationUrl);

    if(locationResponse.statusCode != 200) {
      print('bleo: Failed to get locationId... statusCode : ${locationResponse.statusCode}');
      throw Exception('Error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<WeatherModel> fetchWeather(int locationId) async {

    final weatherUrl = baseUrl + '/api/location/$locationId';
    final weatherResponse = await httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      print('bleo: Failed to get weather information... statusCoed ${weatherResponse.statusCode}');
      throw Exception('error getting weather information');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return WeatherModel.fromJson(weatherJson);
  }
}