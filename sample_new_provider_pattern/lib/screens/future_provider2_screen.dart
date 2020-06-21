import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/future_provider_model.dart';

class FutureProvider2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future provider2'),
      ),
      body: Consumer<FutureProviderModel>(
          builder: (_, futureProvider, __) {
            return Center(
              child: Text(
                'Counter ${futureProvider.counter}',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final providerModel = Provider.of<FutureProviderModel>(
            context,
            listen: false,
          );
          providerModel.incrementCounter();
        },
      ),
    );
  }
}