import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:sampleinifnitelistbloc/post/post_bloc.dart';
import 'package:sampleinifnitelistbloc/post/post_event.dart';
import 'package:sampleinifnitelistbloc/post/post_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Infinite list in bloc'),
        ),
        body: BlocProvider(
          create: (context) => PostBloc(Client())..add(FetchPost()),
            child: PostView()
        ),
      ),
    );
  }
}