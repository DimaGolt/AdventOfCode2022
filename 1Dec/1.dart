
import 'dart:io';

void main(List<String> args) async {
  var path = 'bigger.txt';

  bool previousNew = true;
  List<Elf> elves = [];

  void processLines(List<String> lines) {
    for (String line in lines) {
      if(previousNew == true){
        previousNew = false;
        elves.add(Elf());
        elves.last.addCalories(int.parse(line));
      } else {
        if(line.isEmpty) {
          previousNew = true;
        } else {
          elves.last.addCalories(int.parse(line));
        }
      }
      
    }
  }

  var file = await File(path).readAsLines();
  
  processLines(file);


  int _getBiggest(List<Elf> elves) {
    int theBiggest = 0;

    for(Elf elf in elves) {
      if(elf.getCalories() > elves[theBiggest].getCalories())
        theBiggest = elves.indexOf(elf);
    }

    return theBiggest;
  }

  int _topThree() {
    List<Elf> copyElfes = [];
    int topThreeCalories = 0;
    copyElfes.addAll(elves);

    for(int i = 0; i < 3 ; i++){
      int index = _getBiggest(copyElfes);
      topThreeCalories += copyElfes[index].getCalories();
      print(copyElfes[index].getCalories());
      copyElfes.removeAt(index);
    }

    return topThreeCalories;
  }

  print(_topThree());
}

class Elf {
  int _calories = 0;

  Elf();

  void addCalories(int calories) => _calories += calories;

  int getCalories() => _calories;
}