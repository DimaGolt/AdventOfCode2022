import 'dart:io';

void main(List<String> args) async {
  var input = ".txt";

  String file = await File(input).readAsString();

  int charInd = 0;
  bool startOfPacket = false;

  while (!startOfPacket) {
    Set set = Set.from(file.substring(charInd, charInd + 4).split(''));

    startOfPacket = set.length == 4;
    charInd++;
  }

  print(charInd + 3);
}
