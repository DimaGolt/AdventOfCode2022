import 'dart:io';

void main(List<String> args) async {
  var path = ".txt";

  List<String> file = await File(path).readAsLines();

  int groupNum = (file[0].length / 4).ceil();
  List<List<String>> stacks = List.generate(groupNum, (index) => []);
  bool areStacks = true;

  for (String line in file) {
    if (line.isEmpty) {
      for (int i = 0; i < stacks.length; i++) {
        stacks[i] = stacks[i].reversed.toList();
      }
    } else if (areStacks) {
      for (int i = 0; i < groupNum; i++) {
        String char = line[1 + (i * 4)];
        if (int.tryParse(char) != null) {
          areStacks = false;
          break;
        } else {
          if (char != ' ') stacks[i].add(char);
        }
      }
    } else {
      var regEx = RegExp(r"(\d{1,2})").allMatches(line).toList();

      int number = int.parse(line.substring(regEx[0].start, regEx[0].end));
      int from = int.parse(line.substring(regEx[1].start, regEx[1].end)) - 1;
      int to = int.parse(line.substring(regEx[2].start, regEx[2].end)) - 1;

      var buffList = [];

      for (int i = number; i > 0; i--) {
        buffList.add(stacks[from].last);
        stacks[from].removeLast();
      }

      for (int i = number; i > 0; i--) {
        stacks[to].add(buffList.last);
        buffList.removeLast();
      }
    }
  }

  String answer = stacks.fold('', (value, element) => value += element.last);
  print(answer);
}
