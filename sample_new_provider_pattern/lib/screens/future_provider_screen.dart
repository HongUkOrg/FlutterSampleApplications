import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future provider'),
      ),
      body: Consumer<Map<String, int>>(
        builder: (_, futureProvider, __) {
          return Center(
            child: Text(
                'Counter ${futureProvider['value']}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
        }
      ),
    );
  }
}