import 'dart:io';

import 'strat.dart';

void main(List<String> args) async {
  var path = ".txt";

  var file = await File(path).readAsLines();

  List<Strat2> strats = [];

  _processStrats(List<String> stratsStr) {
    for (String string in stratsStr) {
      Strat2 strat = Strat2(string);
      strats.add(strat);
    }
  }

  _processStrats(file);

  int highscore = 0;

  strats.forEach((element) => highscore += element.outcome);

  print(highscore);
}
