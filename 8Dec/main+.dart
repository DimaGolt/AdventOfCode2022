import 'dart:io';

import 'tree.dart';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();
  List<List<Tree>> grid = file
      .map((line) => line.split('').map((e) => Tree(int.parse(e))).toList())
      .toList();

  //give outside trees empty view
  grid.first.forEach((tree) {
    tree.visibility = 0;
  });
  grid.last.forEach((tree) {
    tree.visibility = 0;
  });
  grid.forEach((treeList) {
    treeList.first.visibility = 0;
    treeList.last.visibility = 0;
  });

  _calculateVisibility() {
    for (int i = 0; i < grid.length; i++) {
      List<int> before = [];
      List<int> after = [];
      for (int j = 0; j < grid[i].length; j++) {
        int backIndex = grid[i].length - 1 - j;

        if (j != 0) {
          int indexHigher =
              before.lastIndexWhere((element) => element >= grid[i][j].height);
          if (indexHigher == -1) {
            grid[i][j].visibility *= before.length;
          } else {
            grid[i][j].visibility *= before.length - indexHigher;
          }

          indexHigher = after.lastIndexWhere(
              (element) => element >= grid[i][backIndex].height);
          if (indexHigher == -1) {
            grid[i][backIndex].visibility *= after.length;
          } else {
            grid[i][backIndex].visibility *= after.length - indexHigher;
          }
        }

        before.add(grid[i][j].height);
        after.add(grid[i][backIndex].height);
      }
    }
  }

  _rotateGrid() {
    List<List<Tree>> buffGrid = List.generate(grid[0].length, (index) => []);
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        buffGrid[j].add(grid[i][j]);
      }
    }
    grid = buffGrid;
  }

  _calculateVisibility();
  _rotateGrid();
  _calculateVisibility();

  int highestVis = grid.fold(0, (maxi, list) {
    int value = list.fold(
        0, (maxu, tree) => tree.visibility > maxu ? tree.visibility : maxu);
    return maxi < value ? value : maxi;
  });

  print(highestVis);
}
