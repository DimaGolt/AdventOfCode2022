import 'dart:io';

import 'dir.dart';
import 'file.dart';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();

  List<Dir> currentPath = [Dir('/')];

  int sizeToDelete = 0;

  for (String line in file) {
    if (line.startsWith(r"$")) {
      String command = line.substring(2, 4);
      if (command == 'ls') continue;
      String arg = line.substring(5);
      if (arg == '/') continue;
      if (command == 'cd' && arg == '..') {
        Dir buff = currentPath.last;
        if (buff.dirSize < 100000) sizeToDelete += buff.dirSize;
        currentPath.removeLast();
        currentPath.last.dirs.add(buff);
      } else {
        currentPath.add(Dir(arg));
      }
    } else {
      if (line.substring(0, 3) == 'dir') continue;
      int endSize = line.indexOf(RegExp(r'\s'));
      int size = int.parse(line.substring(0, endSize));
      String name = line.substring(endSize + 1);
      Filo file = Filo(name, size);
      currentPath.last.files.add(file);
    }
  }
  print(sizeToDelete);
}
