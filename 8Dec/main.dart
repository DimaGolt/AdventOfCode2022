import 'dart:io';

import 'tree.dart';

void main(List<String> args) async {
  var input = '.txt';

  List<String> file = await File(input).readAsLines();
  List<List<Tree>> grid = file
      .map((line) => line.split('').map((e) => Tree(int.parse(e))).toList())
      .toList();

  //make outside trees visible
  grid.first.forEach((tree) {
    tree.makeVisible();
  });
  grid.last.forEach((tree) {
    tree.makeVisible();
  });
  grid.forEach((treeList) {
    treeList.first.makeVisible();
    treeList.last.makeVisible();
  });

  int _calculateVisible() {
    int allVisible = 0;

    grid.forEach((element) {
      element.forEach((element) {
        element.visible ? allVisible++ : null;
      });
    });

    return allVisible;
  }

  _checkVisible() {
    for (int i = 0; i < grid.length; i++) {
      int maxFront = 0;
      int maxBack = 0;
      for (int j = 0; j < grid[i].length; j++) {
        int backIndex = grid[i].length - 1 - j;

        if (grid[i][j].visible && maxFront < grid[i][j].height) {
          maxFront = grid[i][j].height;
        } else {
          if (grid[i][j].height > maxFront) {
            grid[i][j].makeVisible();
            maxFront = grid[i][j].height;
          }
        }

        if (grid[i][backIndex].visible && maxBack < grid[i][backIndex].height) {
          maxBack = grid[i][backIndex].height;
        } else {
          if (grid[i][backIndex].height > maxBack) {
            grid[i][backIndex].makeVisible();
            maxBack = grid[i][backIndex].height;
          }
        }
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

  _checkVisible();
  _rotateGrid();
  _checkVisible();

  print(_calculateVisible());
}
