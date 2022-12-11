import 'dart:io';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();

  int cycle = 0;
  int register = 1;
  int position = 0;
  List<String> display = [''];

  _draw() {
    (register - position).abs() < 2 ? display.last += '#' : display.last += '.';
    position++;
    if (cycle % 40 == 0) {
      position = 0;
      display.add('');
    }
  }

  for (String line in file) {
    if (line.substring(0, 4) == 'noop') {
      cycle++;
      _draw();
    } else {
      cycle++;
      _draw();
      cycle++;
      _draw();
      register += int.parse(line.substring(5));
    }
  }

  display.forEach((element) {
    print(element);
  });
}
