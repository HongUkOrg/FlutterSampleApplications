
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login'),),
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.vpn_key),
          label: Text('login',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/transportation');
          },
        ),
      ),
    );
  }

}