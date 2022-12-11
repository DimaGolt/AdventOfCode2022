import 'order.dart';

class Position {
  int x;
  int y;

  Position(this.x, this.y);

  Position move(Orders order) {
    int newX = this.x;
    int newY = this.y;
    switch (order) {
      case Orders.Up:
        newY++;
        break;
      case Orders.Down:
        newY--;
        break;
      case Orders.Left:
        newX--;
        break;
      case Orders.Right:
        newX++;
        break;
      default:
        print('error?');
        break;
    }
    Position newPosition = Position(newX, newY);
    this.x = newX;
    this.y = newY;

    return newPosition;
  }

  bool isClose(Position headPos) {
    return (headPos.x - x).abs() < 2 && (headPos.y - y).abs() < 2;
  }

  String catchUp(Position headPos) {
    while (!isClose(headPos)) {
      if ((((headPos.x - x).abs() > 1) && ((headPos.y - y).abs() > 0)) ||
          (((headPos.x - x).abs() > 0) && ((headPos.y - y).abs() > 1))) {
        headPos.x > x ? x++ : x--;
        headPos.y > y ? y++ : y--;
      }
      if ((headPos.x - x).abs() > 1) {
        headPos.x > x ? x++ : x--;
      }
      if ((headPos.y - y).abs() > 1) {
        headPos.y > y ? y++ : y--;
      }
    }
    return '$x:$y';
  }
}
