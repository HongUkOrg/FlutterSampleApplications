import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'simple_bloc_delegate.dart';
import 'blocs/blocs.dart';
import 'repositories/repositories.dart';
import 'widgets/weather/weather_widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  WeatherRepository weatherRepository = WeatherRepository(weatherApiClient: WeatherApiClient(httpClient: Client()));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
      ),
      BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(),
      )
    ],
    child: MyApp(
      weatherRepository: weatherRepository,
    )
  ));
}

class MyApp extends StatelessWidget {

  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository}) : assert(weatherRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
            title: 'Sample Weather Application',
            theme: themeState.themeData,
            home: BlocProvider(
              create: (context) => WeatherBloc(weatherRepository: weatherRepository),
              child: WeatherMainView(),
            )
        );
      }
    );
  }
}