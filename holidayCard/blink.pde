class blink {
  int r, g, b;
  int timer = 100;
  int a = 0;
  float x, y;
  float rColor;
  blink(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void randC() {
    rColor = (int)random(0,4);
    if (rColor == 0){
      r = 150;
      g = 0;
      b = 0;
    }
    if (rColor == 1){
      r = 200;
      g = 200;
      b = 0;
    }
    if (rColor == 2){
      r = 0;
      g = 0;
      b = 200;
    }
    if (rColor == 3){
      r = 225;
      g = 0;
      b = 225;
    }
  }
  void light() {
    if (timer == 0) {
      randC();
      timer = 100;
      a = 1000;
    }
    timer--;
    
    fill(r, g, b, a);
    ellipse(x, y, 20, 20);
    
    
  }
}
