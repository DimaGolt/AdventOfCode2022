import 'dart:io';

void main(List<String> args) async {
  var path = '.txt';

  List<String> file = await File(path).readAsLines();

  int contains = 0;

  for (String line in file) {
    List<String> pair = line.split(',');
    int firstStart = int.parse(pair[0].split('-')[0]);
    int firstEnd = int.parse(pair[0].split('-')[1]);
    int secondStart = int.parse(pair[1].split('-')[0]);
    int secondEnd = int.parse(pair[1].split('-')[1]);
    List<int> first =
        List.generate(firstEnd - firstStart + 1, (index) => index + firstStart);
    List<int> second = List.generate(
        secondEnd - secondStart + 1, (index) => index + secondStart);
    Set firstSet = Set.of(first);
    Set secondSet = Set.of(second);

    if (firstSet.containsAll(secondSet) || secondSet.containsAll(firstSet))
      contains++;
  }

  print(contains);
}
