import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Weather with ChangeNotifier {
  final String key = '875cd1f34db4d3bcf54a830e69434451';

  final String weatherAPI = 'api.openweathermap.org';
  final String endpoint = '/data/2.5/weather';

  // MARK: - Properties
  Map<String, dynamic> _weatherInfo;
  bool _loading = false;

  // MARK: - Getter
  Map<String, dynamic> get weatherInfo => _weatherInfo;
  bool get loading => _loading;

  // MARK: - Methods
  Future<bool> getWeather(String cityName) async {

    Map<String, String> parameters = {
      'q': cityName,
      'appid': key,
    };
    var url = Uri.https(weatherAPI, endpoint, parameters);

    _loading = true;
    notifyListeners();

    // Request Weather Information
    http.Response response = await http.get(url);
    _loading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      _weatherInfo = json.decode(response.body);
      print('Success ${response.body}');
      notifyListeners();
      return true;
    } else {
      print('Failed to get weather');
      return false;
    }
  }
}
