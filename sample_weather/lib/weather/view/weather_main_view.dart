import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleweather/blocs/blocs.dart';
import 'package:sampleweather/blocs/weather_bloc.dart';
import 'package:sampleweather/theme/theme_bloc.dart';
import 'package:sampleweather/weather/view/gradient_container.dart';
import 'package:sampleweather/weather/view/weather_city_selection.dart';
import 'package:sampleweather/weather/view/weather_combined_temperature.dart';
import 'package:sampleweather/weather/view/weather_last_updated.dart';
import 'package:sampleweather/weather/view/weather_location.dart';

class WeatherMainView extends StatefulWidget {
  @override
  _WeatherMainViewState createState() => _WeatherMainViewState();
}

class _WeatherMainViewState extends State<WeatherMainView> {

  Completer<Void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<Void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Today\'s weather',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                  Icons.search,
              ),
              onPressed: () async {
                final cityName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: false,
                      builder: (context) => WeatherCitySelection(),
                    )
                );
                if (cityName != null) {
                  BlocProvider.of<WeatherBloc>(context).add(
                      WeatherRequested(cityName: cityName));
                }
              },
            ),
          )
        ],
      ),
      body: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, weatherState) {
              if (weatherState is WeatherLoadSuccess) {
                _refreshCompleter.complete();
                _refreshCompleter = Completer();
              }
            },
            builder: (context, state) {
              if (state is WeatherInitial) {
                return Center(child: Text(
                    'Please search city which you want know',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueGrey
                  ),
                ));
              }
              if (state is WeatherLoadInProgress) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is WeatherLoadSuccess) {
                final weatherModel = state.weatherModel;

                BlocProvider.of<ThemeBloc>(context).add(WeatherChanged(weatherModel.weatherCondition));

                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, themeState) {
                    return GradientContainer(
                      color: themeState.color,
                      child: RefreshIndicator(
                        onRefresh: () {
                          BlocProvider.of<WeatherBloc>(context).add(WeatherRefreshRequested(state.weatherModel.location));
                          return _refreshCompleter.future;
                        },
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 100.0),
                              child: Center(
                                child: WeatherLocation(weatherModel.location),
                              ),
                            ),
                            Center(child: WeatherLastUpdated(weatherModel.lastUpdated)),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50.0),
                              child: WeatherCombinedTemperature(weatherModel),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              }
              if (state is WeatherLoadFailure) {
                return Text('Something went wrong',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[200]),
                );
              }
              return Center(
                child: Text('can not come here'),
              );
            },
          )
      ),
    );
  }
}
