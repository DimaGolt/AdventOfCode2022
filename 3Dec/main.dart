import 'dart:io';

void main(List<String> args) async {
  var path = ".txt";

  var file = await File(path).readAsLines();

  int sum = 0;

  for (String line in file) {
    List<int> firstHalf =
        line.substring(0, (line.length / 2).floor()).codeUnits;
    List<int> secondHalf = line.substring((line.length / 2).floor()).codeUnits;

    int reoccuringEl =
        firstHalf.firstWhere((element) => secondHalf.contains(element));

    if (reoccuringEl > 91) {
      sum += (reoccuringEl - 96);
    } else {
      sum += (reoccuringEl - 38);
    }
  }

  print('Sum is ' + sum.toString());
}
