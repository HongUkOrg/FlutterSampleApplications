import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleweather/blocs/blocs.dart';
import 'package:sampleweather/blocs/weather_bloc.dart';
import 'package:sampleweather/weather/view/weather_city_selection.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Weather Application'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final cityName = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherCitySelection(),
                  )
              );
              if (cityName != null) {
                BlocProvider.of<WeatherBloc>(context).add(
                    WeatherRequested(cityName: cityName as String));
              }
            },
          )
        ],
      ),
      body: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return Center(child: Text('Please select city'));
              }
              if (state is WeatherLoadInProgress) {
                return Center(child: CircularProgressIndicator());
              }
//              if (state is WeatherLoadSuccess) {
//                final weatherModel = state.weatherModel;
//
//                return ListView(
//                  children: <Widget>[
//                    LastUpdated(),
//                    CombinedWeatherTemperature(),
//                  ],
//                )
//              }
              if (state is WeatherLoadFailure) {
                return Text('Something went wrong',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
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
