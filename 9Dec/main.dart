import 'dart:io';

import 'order.dart';
import 'position.dart';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();

  List<Order> orders = file.map((line) => Order(line)).toList();

  Position headPos = Position(0, 0);

  Position tailPos = Position(0, 0);

  Set<String> positions = Set();
  positions.add('${tailPos.x}:${tailPos.y}');
  List<List<int>> route = [];

  for (Order order in orders) {
    int value = order.value;
    for (var i = 0; i < value; i++) {
      headPos.move(order.order);
      if (!tailPos.isClose(headPos)) {
        positions.add(tailPos.catchUp(headPos));
      }
      ;
    }
  }

  print(positions.length);
}
