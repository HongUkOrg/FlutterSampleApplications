import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/CalculatorBloc.dart';
import 'widgets/NumberPadWidget.dart';
import 'widgets/ValueWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (context) => CalculatorBloc(),
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text("Simple Calculator"),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  ValueWidget(),
                  NumberPadWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
