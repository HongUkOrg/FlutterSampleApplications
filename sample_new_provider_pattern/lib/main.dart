import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/change_notifier_model.dart';
import 'package:samplenewproviderpattern/providers/provider_model.dart';
import 'package:samplenewproviderpattern/screens/change_notifier_screen.dart';
import 'package:samplenewproviderpattern/screens/provider_screen.dart';

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
        ChangeNotifierProxyProvider<ProviderModel, ChangeNotifierModel>(
          create: (_) => ChangeNotifierModel(),
          update: (context, providerModel, changeNotifierModel) {
            changeNotifierModel.providerModel = providerModel;
            return changeNotifierModel;
          },
        )
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
                          return ProviderScreen();
                        }
                    )
                );
                print('Provider pattern onPressed');
              },
            )
          ],
        ),
      ),
    );
  }

}