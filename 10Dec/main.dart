import 'dart:io';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();

  int cycle = 0;
  int value = 1;
  int sum = 0;

  _checkState() {
    if (cycle % 40 == 20) {
      sum += cycle * value;
    }
  }

  for (String line in file) {
    if (line.substring(0, 4) == 'noop') {
      cycle++;
      _checkState();
    } else {
      cycle++;
      _checkState();
      cycle++;
      _checkState();
      value += int.parse(line.substring(5));
    }
  }

  print(sum);
}
