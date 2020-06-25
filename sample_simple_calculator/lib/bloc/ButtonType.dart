
enum ButtonType {
  number,
  plus,
  minus,
  divide,
  multiply,
  result,
  reset,
  modulo,
  none,
}

extension ButtonIdentifier on ButtonType {

  bool get isOperator {
    switch(this) {
      case ButtonType.plus:
      case ButtonType.minus:
      case ButtonType.multiply:
      case ButtonType.divide:
      case ButtonType.modulo:
        return true;
      default:
        return false;
    }
  }
}