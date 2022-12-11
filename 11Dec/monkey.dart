import 'item.dart';

class Monkey {
  List<Item> items;
  Operation operation;
  int? operator;
  int test;
  int inspectedTimes = 0;
  int whenTrue;
  int whenFalse;

  Monkey(this.items, this.operation, this.operator, this.test, this.whenTrue,
      this.whenFalse);

  List<int> inspectAll() {
    List<int> homies = [];
    for (var item in items) {
      item.gotInspected(operation, operator);
      inspectedTimes++;
      item.worryLevel ~/= 3;
      item.test(test) ? homies.add(whenTrue) : homies.add(whenFalse);
    }
    return homies;
  }

  List<int> inspectAllD(int LCM) {
    List<int> homies = [];
    for (var item in items) {
      item.gotInspected(operation, operator);
      inspectedTimes++;
      item.worryLevel %= LCM;
      item.test(test) ? homies.add(whenTrue) : homies.add(whenFalse);
    }
    return homies;
  }
}
