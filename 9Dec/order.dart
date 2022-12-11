enum Orders { Up, Down, Left, Right, Error }

class Order {
  late int value;
  late Orders order;

  Order(String line) {
    switch (line[0]) {
      case 'U':
        order = Orders.Up;
        break;
      case 'D':
        order = Orders.Down;
        break;
      case 'L':
        order = Orders.Left;
        break;
      case 'R':
        order = Orders.Right;
        break;
      default:
        order = Orders.Error;
        break;
    }
    value = int.parse(line.substring(2));
  }
}
