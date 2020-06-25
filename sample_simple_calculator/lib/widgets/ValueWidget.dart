

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplesimplecalculator/bloc/CalculatorBloc.dart';

class ValueWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final CalculatorBloc _calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return BlocBuilder<CalculatorBloc, String>(
      builder: (BuildContext context, state) {
        return Expanded(
          child: Container(
            color: Colors.grey[500],
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '$state',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
