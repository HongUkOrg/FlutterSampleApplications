import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueListenableProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableProviderScreen'),
      ),
      body: Consumer<double>(
        builder: (_, doubleCounter, __) {
          return Center(
          child: Text(
              'Counter $doubleCounter',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          );
        },
      )
    );
  }
}