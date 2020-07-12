
import 'package:flutter/material.dart';

class WeatherCitySelection extends StatefulWidget {
  @override
  _WeatherCitySelectionState createState() => _WeatherCitySelectionState();
}

class _WeatherCitySelectionState extends State<WeatherCitySelection> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
      ),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    hintText: 'Seoul',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textEditingController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
