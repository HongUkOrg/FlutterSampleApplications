import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/change_notifier_model.dart';
import 'package:samplenewproviderpattern/providers/future_provider_model.dart';
import 'package:samplenewproviderpattern/providers/provider_model.dart';
import 'package:samplenewproviderpattern/providers/stream_provider_model.dart';
import 'package:samplenewproviderpattern/providers/value_listenable_provider_model.dart';
import 'package:samplenewproviderpattern/screens/change_notifier_screen.dart';
import 'package:samplenewproviderpattern/screens/future_provider_screen.dart';
import 'package:samplenewproviderpattern/screens/provider_screen.dart';
import 'package:samplenewproviderpattern/screens/stream_provider_screen.dart';
import 'package:samplenewproviderpattern/screens/value_notifier_screen.dart';

import 'screens/future_provider2_screen.dart';
import 'screens/value_listenable_provider_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        Provider<ProviderModel>(
          create: (_) => ProviderModel(),
        ),
        FutureProvider<Map<String, int>>(
          initialData: {'value': 0},
          create: (_) async {
            await Future.delayed(Duration(seconds: 2));
            return {'value': 1};
          },
        ),
        StreamProvider<StreamProviderModel>(
          initialData: StreamProviderModel(counter: 0),
          create: (_) => streamProviderFunc(),
        ),
        FutureProvider<FutureProviderModel>(
          initialData: FutureProviderModel(counter: 0),
          create: (_) => futureProviderFunc(),
        ),
        ChangeNotifierProxyProvider3<ProviderModel, FutureProviderModel, StreamProviderModel, ChangeNotifierModel>(
          create: (_) => ChangeNotifierModel(),
          update: (context, providerModel, futureProviderModel, streamProviderModel, changeNotifierModel) {
            changeNotifierModel.providerModel = providerModel;
            changeNotifierModel.futureProviderModel = futureProviderModel;
            changeNotifierModel.streamProviderModel = streamProviderModel;
            return changeNotifierModel;
          },
        ),
        ChangeNotifierProvider<ValueNotifier<int>>(
          // don't need to create model for value notifier. cuz ValueNotifier class is a model
          create: (_) => ValueNotifier<int>(0),
        ),
        ValueListenableProvider<double>(
          create: (_) => ValueListenableProviderModel(0.0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Provider Pattern'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(40),
          children: <Widget>[
            RaisedButton(
              child: Text('Provider'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ProviderScreen();
                        }
                    )
                );
                print('Provider pattern onPressed');
              },
            ),
            RaisedButton(
              child: Text('Change Notifier'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ChangeNotifierScreen();
                        }
                    )
                );
                print('Change Notifier onPressed');
              },
            ),
            RaisedButton(
              child: Text('Value notifier'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ValueNotifierScreen();
                        }
                    )
                );
                print('Value notifier pattern onPressed');
              },
            ),
            RaisedButton(
              child: Text('Future provider'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return FutureProviderScreen();
                        }
                    )
                );
                print('Future provider pattern onPressed');
              },
            ),
            RaisedButton(
              child: Text('Future provider2'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return FutureProvider2Screen();
                        }
                    )
                );
                print('Future provider2 pattern onPressed');
              },
            ),
            RaisedButton(
              child: Text('Stream provider'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return StreamProviderScreen();
                        }
                    )
                );
                print('StreamProviderScreen pattern onPressed');
              },
            ),
            RaisedButton(
              child: Text('Value listenable provider'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ValueListenableProviderScreen();
                        }
                    )
                );
                print('Value listenable provider pattern onPressed');
              },
            ),
          ],
        ),
      ),
    );
  }

}