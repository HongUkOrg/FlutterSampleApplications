import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderpattern/Weather.dart';

import 'Counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Counter()), // used 'value' method cuz we don't use context
        ChangeNotifierProvider.value(value: Weather()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter with provider patter"),
        ),
        body: ListView(
          children: <Widget>[
            CounterWidget(),
            ButtonsWidget(),
            Divider(thickness: 2,),
            WeatherWidget(),
          ],
        ),
      ),
    );
  }

}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 100, bottom: 50),
      child: Text('${counter.count}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 45,
        ),
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: ButtonBar(
        buttonPadding: EdgeInsets.only(left: 20, right: 20),
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Increment'),
            color: Theme
                .of(context)
                .primaryColor,
            onPressed: counter.increment,
          ),
          RaisedButton(
            child: Text('Decrement'),
            color: Theme
                .of(context)
                .accentColor,
            onPressed: counter.decrement,
          ),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherWidget> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  bool _autoValidate = false;

  void _submit(Weather weather) {
    final form = _formKey.currentState;

    if (form.validate()) {
      final cityName = _locationController.text;
      print('bleo: ${cityName}');
      weather.getWeather(cityName);
    } else {
      _autoValidate = true;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<Weather>(context);

    var mainWeatherDesc = weather.weatherInfo == null ?
    '' : weather.weatherInfo['weather'][0]['main'];

    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15, left: 10),
              alignment: Alignment.centerLeft,
                child: Text('Input cities you wanna know weather info!')),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                filled: true,
                prefixIcon: Icon(Icons.search),
                labelText: 'City',
                hintText: 'Enter city',
              ),
              validator: (text) {
                if(text.length < 1) {
                  return 'Too short for searching city';
                }
                return null;
              },
            ),
            mainWeatherDesc.length > 0 ?
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                mainWeatherDesc,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ) : Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
            ),
            Container(
              child: RaisedButton(
                child: weather.loading
                    ? SizedBox(width: 25, height: 25,
                    child: CircularProgressIndicator())
                    : Text('Get Weather'),
                textColor: Colors.white,
                color: Colors.pink[300],
                onPressed: () {
                  _submit(weather);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
