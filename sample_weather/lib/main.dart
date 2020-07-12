import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:sampleweather/blocs/weather_bloc.dart';
import 'package:sampleweather/simple_bloc_delegate.dart';
import 'package:sampleweather/weather/weather_api_client.dart';
import 'package:sampleweather/weather/weather_repository.dart';
import 'package:sampleweather/weather/view/weather_view.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  WeatherRepository weatherRepository = WeatherRepository(weatherApiClient: WeatherApiClient(httpClient: Client()));
  runApp(MyApp(weatherRepository: weatherRepository,));
}

class MyApp extends StatelessWidget {

  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository}) : assert(weatherRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Weather Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: weatherRepository),
          child: WeatherView(),
      )
    );
  }
}