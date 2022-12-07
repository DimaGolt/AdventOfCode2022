import 'file.dart';

class Dir {
  String name;
  List<Filo> files = [];
  List<Dir> dirs = [];

  Dir(this.name);

  int get dirSize =>
      dirs.fold(0, (previousValue, dir) => previousValue += dir.dirSize) +
      files.fold(0, (previousValue, file) => previousValue += file.size);

  bool operator ==(other) {
    if (other is Dir) if (this.name == other.name) return true;
    return false;
  }
}
