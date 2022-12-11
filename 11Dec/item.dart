enum Operation {
  Add,
  Multiply,
  Divide,
  Subtraction,
  Error;

  static Operation parse(String string) {
    switch (string) {
      case '+':
        return Operation.Add;
      case '*':
        return Operation.Multiply;
      case '/':
        return Operation.Divide;
      case '-':
        return Operation.Subtraction;
      default:
        return Operation.Error;
    }
  }
}

class Item {
  int worryLevel;
  late int temp;

  Item(this.worryLevel) {
    temp = worryLevel;
  }

  gotInspected(Operation operation, int? operator) {
    if (operator == null) operator = worryLevel;
    switch (operation) {
      case Operation.Add:
        temp = worryLevel + operator;
        break;
      case Operation.Multiply:
        temp = worryLevel * operator;
        break;
      case Operation.Divide:
        temp = (worryLevel / operator).floor();
        break;
      case Operation.Subtraction:
        temp = worryLevel - operator;
        break;
      default:
        worryLevel = 0;
    }
    worryLevel = temp;
  }

  bool test(int operator) {
    return worryLevel % operator == 0;
  }
}
