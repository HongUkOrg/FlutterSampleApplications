import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/future_provider_model.dart';
import 'package:samplenewproviderpattern/providers/stream_provider_model.dart';

class StreamProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream provider'),
      ),
      body: Consumer<StreamProviderModel>(
          builder: (_, streamProvider, __) {
            return Center(
              child: Text(
                'Counter ${streamProvider.counter}',
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
          final streamProviderModel = Provider.of<StreamProviderModel>(
            context,
            listen: false,
          );
          streamProviderModel.incrementCounter();
        },
      ),
    );
  }
}