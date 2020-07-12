
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  GradientContainer({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.8, 1.0],
            colors: [
              color[700],
              color[500],
              color[300],
            ]
        ),
      ),
    );
  }
}
