import 'dart:io';

import 'item.dart';
import 'monkey.dart';

void main(List<String> args) async {
  var input = '.txt';

  String file = await File(input).readAsString();

  List<String> monkeyStrings = file.split('\r\n\r\n');
  List<Monkey> monkeys = [];

  for (String mokeyString in monkeyStrings) {
    List<String> lines = mokeyString.split('\r\n');
    List<Item> items = lines[1]
        .substring(17)
        .split(',')
        .map((e) => Item(int.parse(e)))
        .toList();
    Operation operation = Operation.parse(lines[2].substring(23, 24));
    int? operators = int.tryParse(lines[2].substring(25));
    int test = int.parse(lines[3].substring(21));
    int whenTrue = int.parse(lines[4].substring(29));
    int whenFalse = int.parse(lines[5].substring(30));

    monkeys.add(Monkey(items, operation, operators, test, whenTrue, whenFalse));
  }

  for (var i = 0; i < 100; i++) {
    for (var monkey in monkeys) {
      List<int> homies = monkey.inspectAll();
      for (var i = 0; i < homies.length; i++) {
        monkeys[homies[i]].items.add(monkey.items[i]);
      }
      monkey.items.clear();
    }
  }

  monkeys.sort((a, b) => b.inspectedTimes.compareTo(a.inspectedTimes));

  print(monkeys[0].inspectedTimes * monkeys[1].inspectedTimes);
}
