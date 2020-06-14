
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/change_notifier_model.dart';
import 'package:samplenewproviderpattern/providers/provider_model.dart';

class ChangeNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier Model'),
      ),
      body: Center(
        child: Consumer2<ProviderModel, ChangeNotifierModel>(
          builder: (context, providerModel, changeNotifierModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter: ${changeNotifierModel.counter}',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Counter: ${providerModel.baseUrl}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final changeNotifierModel = Provider.of<ChangeNotifierModel>(context, listen: false);
          changeNotifierModel.incrementCounter();
        },
      ),
    );
  }

}