class Tree {
  bool visible = false;
  int height;
  int visibility = 1;

  Tree(this.height);

  makeVisible() {
    visible = true;
  }

  // bool operator >(other) {
  //   if (other is Tree) {
  //     return this.height > other.height;
  //   }
  //   return false;
  // }

  // bool operator <(other) {
  //   if (other is Tree) {
  //     return this.height < other.height;
  //   }
  //   return false;
  // }
}
