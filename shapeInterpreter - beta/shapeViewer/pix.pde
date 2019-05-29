

class pix implements Comparable<pix> {
  int index, x, y, type;
  float r, g, b;

  pix () {
  }
  pix (int id, int x, int y, int type, float r, float g, float b) {
    this.index = id;
    this.x = x;
    this.y = y;
    this.type = type;
    this.r = r;
    this.g = g;
    this.b = b;
  }
  int compareTo( pix other) {
    if (this.index > other.index) {
      return 1;
    } else if (this.index < other.index) {
      return -1;
    } else {
      return 0;
    }
  }
  int getID() {
    return this.index;
  }
  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }
  int getType() {
    return this.type;
  }
  int getColor() {
    return (int) (r + g + b)/3;
  }
  int getRed() {
    return (int) this.r;
  }
  int getGreen() {
    return (int) this.g;
  }
  int getBlue() {
    return (int) this.b;
  }
  void filter() {
    int filter = getColor();
    if (filter <= 100) {
      r = 0;
      g = 0;
      b = 0;
    }
  }
}
