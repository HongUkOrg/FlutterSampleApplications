import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifier'),
      ),
      body: Consumer<ValueNotifier<int>>(
        builder: (context, valueNotifier, child) {
          return Center(
            child: Text(
              'Counter ${valueNotifier.value}',
              style: TextStyle(
                fontSize: 36
              ),
            ),
          );
        }
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final counter = Provider.of<ValueNotifier<int>>(
              context,
              listen: false,
            );
            counter.value++;
          },
        ),
      ),
    );
  }

}