
class pix {
  int index, x, y, type;
  float r, g, b;
  
  pix(){
    
  }
  
  pix (int id, int x, int y, int type, float r, float g, float b) {
    index = id;
    this.x = x;
    this.y = y;
    this.type = type;
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
  int getType(){
    return type; 
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
    //if (abs(getRed() - getGreen()) < 20 && abs(getGreen() - getBlue()) < 20 && abs(getBlue() - getRed()) < 20){
    //  isWhite = true;
    //}
    if (filter < 100) {
      r = 0;
      g = 0;
      b = 0;
    }
  }
}
