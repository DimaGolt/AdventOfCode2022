import 'dart:io';

import 'order.dart';
import 'position.dart';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();

  List<Order> orders = file.map((line) => Order(line)).toList();

  Position headPos = Position(0, 0);

  Position Pos1 = Position(0, 0);
  Position Pos2 = Position(0, 0);
  Position Pos3 = Position(0, 0);
  Position Pos4 = Position(0, 0);
  Position Pos5 = Position(0, 0);
  Position Pos6 = Position(0, 0);
  Position Pos7 = Position(0, 0);
  Position Pos8 = Position(0, 0);
  Position Pos9 = Position(0, 0);

  Set<String> positions = Set();
  positions.add('${Pos9.x}:${Pos9.y}');

  //it works, even if it looks bad
  for (Order order in orders) {
    int value = order.value;
    for (var i = 0; i < value; i++) {
      headPos.move(order.order);
      if (!Pos1.isClose(headPos)) {
        Pos1.catchUp(headPos);
      }
      if (!Pos2.isClose(Pos1)) {
        Pos2.catchUp(Pos1);
      }
      if (!Pos3.isClose(Pos2)) {
        Pos3.catchUp(Pos2);
      }
      if (!Pos4.isClose(Pos3)) {
        Pos4.catchUp(Pos3);
      }
      if (!Pos5.isClose(Pos4)) {
        Pos5.catchUp(Pos4);
      }
      if (!Pos6.isClose(Pos5)) {
        Pos6.catchUp(Pos5);
      }
      if (!Pos7.isClose(Pos6)) {
        Pos7.catchUp(Pos6);
      }
      if (!Pos8.isClose(Pos7)) {
        Pos8.catchUp(Pos7);
      }
      if (!Pos9.isClose(Pos8)) {
        positions.add(Pos9.catchUp(Pos8));
      }
    }
  }

  print(positions.length);
}
