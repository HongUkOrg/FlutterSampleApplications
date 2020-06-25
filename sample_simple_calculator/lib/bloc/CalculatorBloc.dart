
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import 'ButtonType.dart';


abstract class CalculatorEvent {}

class ButtonPressed implements CalculatorEvent {
  String value;

  ButtonPressed(this.value);
}

class CalculatorBloc extends Bloc<CalculatorEvent, String> {

  String _lastValue = '';

  @override
  String get initialState => '0';

  @override
  Stream<String> mapEventToState(CalculatorEvent event) async* {
    if (event is ButtonPressed) {
      yield* _mapButtonPressedToState(event);
    }
  }

  Stream<String> _mapButtonPressedToState(ButtonPressed buttonPressed) async* {
    String result = calculateResult(buttonPressed.value);
    yield result;
  }

  String calculateResult(String value) {

    ButtonType lastValueType = checkType(_lastValue);
    ButtonType currentValueType = checkType(value);
    _lastValue = value;

    // operator can not be consecutive
    if(lastValueType.isOperator && currentValueType.isOperator) {
      return state;
    }

    switch(currentValueType) {
      case ButtonType.reset:
        _lastValue = '';
        return '0';
      case ButtonType.result:
        double eval = Parser().parse(state).evaluate(EvaluationType.REAL, ContextModel());
        return eval.toInt().toString();
      default:
        break;
    }

    // remove initial value in calculator
    if(state == '0') {
      return value;
    }

    return state + value;
  }

  ButtonType checkType(String value) {

    var number = int.tryParse(value);
    if (number != null) {
      return ButtonType.number;
    }

    switch(value) {
      case '+':
        return ButtonType.plus;
      case '-':
        return ButtonType.minus;
      case '*':
        return ButtonType.multiply;
      case '/':
        return ButtonType.divide;
      case 'C':
        return ButtonType.reset;
      case '=':
        return ButtonType.result;
      case '%':
        return ButtonType.modulo;
      default:
        return ButtonType.none;
    }
  }

}
