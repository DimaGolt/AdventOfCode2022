enum RoPaSci {
  Rock,
  Paper,
  Scissors,
  Error;

  static RoPaSci parseEnemy(String char) {
    switch (char) {
      case 'B':
        return RoPaSci.Paper;
      case 'A':
        return RoPaSci.Rock;
      case 'C':
        return RoPaSci.Scissors;
      default:
        return RoPaSci.Error;
    }
  }

  static RoPaSci parseMe(String char) {
    switch (char) {
      case 'Y':
        return RoPaSci.Paper;
      case 'X':
        return RoPaSci.Rock;
      case 'Z':
        return RoPaSci.Scissors;
      default:
        return RoPaSci.Error;
    }
  }

  static RoPaSci getMyMove(String char, RoPaSci enemy) {
    switch (char) {
      case 'Y': //draw
        return enemy;
      case 'X': //lose
        return RoPaSci.getFromValue(enemy.value - 1);
      case 'Z': //win
        return RoPaSci.getFromValue(enemy.value + 1);
      default:
        return RoPaSci.Error;
    }
  }

  static RoPaSci getFromValue(int val) {
    switch (val) {
      case 2:
        return RoPaSci.Paper;
      case 1:
        return RoPaSci.Rock;
      case 3:
        return RoPaSci.Scissors;
      case 0:
        return RoPaSci.Scissors;
      case 4:
        return RoPaSci.Rock;
      default:
        return RoPaSci.Error;
    }
  }
}

extension RPSExtension on RoPaSci {
  int get value {
    switch (this) {
      case RoPaSci.Paper:
        return 2;
      case RoPaSci.Rock:
        return 1;
      case RoPaSci.Scissors:
        return 3;
      default:
        return 0;
    }
  }
}

class Strat {
  late RoPaSci enemyPick;
  late RoPaSci myPick;

  Strat(String string) {
    enemyPick = RoPaSci.parseEnemy(string.substring(0, 1));
    myPick = RoPaSci.parseMe(string.substring(2, 3));
  }

  int get outcome {
    int outcome = enemyPick.value - myPick.value;
    if (outcome == 1 || outcome == -2) {
      return myPick.value;
    } else if (outcome == -1 || outcome == 2) {
      return (6 + myPick.value);
    } else {
      return (3 + myPick.value);
    }
  }
}

class Strat2 {
  late RoPaSci enemyPick;
  late RoPaSci myPick;

  Strat2(String string) {
    enemyPick = RoPaSci.parseEnemy(string.substring(0, 1));
    myPick = RoPaSci.getMyMove(string.substring(2, 3), enemyPick);
  }

  int get outcome {
    int outcome = enemyPick.value - myPick.value;
    if (outcome == 1 || outcome == -2) {
      return myPick.value;
    } else if (outcome == -1 || outcome == 2) {
      return (6 + myPick.value);
    } else {
      return (3 + myPick.value);
    }
  }
}
