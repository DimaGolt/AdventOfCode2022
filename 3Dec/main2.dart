import 'dart:io';

void main(List<String> args) async {
  var path = ".txt";

  var file = await File(path).readAsLines();

  int sum = 0;
  int elfNum = 0;

  List<int>? first;
  List<int>? second;
  List<int>? third;

  for (String line in file) {
    elfNum++;
    if (elfNum == 1) {
      first = line.codeUnits;
    }
    if (elfNum == 2) {
      second = line.codeUnits;
    }
    if (elfNum == 3) {
      third = line.codeUnits;
      int reoccuringEl = first!
          .where((element) => second!.contains(element))
          .where((element) => third!.contains(element))
          .first;

      if (reoccuringEl > 91) {
        sum += (reoccuringEl - 96);
      } else {
        sum += (reoccuringEl - 38);
      }

      elfNum = 0;
    }
  }

  print('Sum is ' + sum.toString());
}

extension SafeList<Element> on List<Element> {
  Element? get firstSafe {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }

  Element? get lastSafe {
    try {
      return last;
    } catch (e) {
      return null;
    }
  }

  Element? firstWhereSafe(bool Function(Element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
