
class pix {
  int index, x, y;
  float r, g, b;
  
  pix(){
    
  }
  
  pix (int id, int x, int y, float r, float g, float b) {
    index = id;
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
  }

  int getID() {
    return index;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getColor(){
    return (int) (r + g + b)/3;
  }
  int getRed() {
    return (int) r;
  }
  int getGreen() {
    return (int) g;
  }
  int getBlue() {
    return (int) b;
  }
  void filter(){
    int filter = getColor();
    boolean isWhite = false;
    if (abs(getRed() - getGreen()) < 30 && abs(getGreen() - getBlue()) < 30 && abs(getBlue() - getRed()) < 30){
      isWhite = true;
    }
    if (filter < 70 || isWhite) {
      r = 0;
      g = 0;
      b = 0;
    }
  }
}
