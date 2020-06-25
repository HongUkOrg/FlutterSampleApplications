
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplesimplecalculator/bloc/CalculatorBloc.dart';

class NumberPadWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 20),
      child: Container(
        child: Column(
          children: <Widget>[
            FormalRow(['C', '+/-', '%', '/']),
            FormalRow(['7', '8', '9', '*']),
            FormalRow(['4', '5', '6', '-']),
            FormalRow(['1', '2', '3', '+']),
            FinalRow(['0', '.', '=']),
          ],
        )
      ),
    );
  }
}

class FormalRow extends StatelessWidget {

  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NumberPadCell(Colors.grey[100], Colors.black, list[0], 1),
        NumberPadCell(Colors.grey[100], Colors.black, list[1], 1),
        NumberPadCell(Colors.grey[100], Colors.black, list[2], 1),
        NumberPadCell(Colors.orangeAccent, Colors.black, list[3], 1),
      ],
    );
  }

  FormalRow(this.list);
}

class FinalRow extends StatelessWidget {

  FinalRow(this.list);
  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NumberPadCell(Colors.grey[100], Colors.black, list[0], 2),
        NumberPadCell(Colors.grey[100], Colors.black, list[1], 1),
        NumberPadCell(Colors.orangeAccent, Colors.black, list[2], 1),
      ],
    );
  }
}

class NumberPadCell extends StatelessWidget {

  NumberPadCell(this.backgroundColor, this.textColor, this.value, this.flex);

  final Color backgroundColor;
  final Color textColor;
  final String value;
  int flex = 1;

  @override
  Widget build(BuildContext context) {

    final CalculatorBloc _calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Container(
          height: 100,
          child: RaisedButton(
            color: backgroundColor,
            child: Text(
                '$value',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            onPressed: () {
              _calculatorBloc.add(ButtonPressed(value));
            },
          ),
        ),
      ),
    );
  }
}
