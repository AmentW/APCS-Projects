snowFlake [] s = new snowFlake[500];
blink [] b = new blink[10];
int [] repX = new int[] {30, 80, -10, 0, 20, 100, 60, 110, 140, 170, 200};
int [] repY = new int[] {30, -10, 200, 70, 100, 120, 50, 160, 140, 170, 200};
tree t;
snowPile sp;
int x = 600;
int y = 470;
int x1, y1, xQ, yQ;
void setup() {
  size(1000, 600);
  frameRate(60);
  for ( int i = 0; i < s.length; i++) {
    s[i] = new snowFlake(((float)(Math.random() * 1000) + 1), (((float)(Math.random()) * 50) + 1));
  }
  for (int  i = 0; i< b.length; i++) {
    x1 = 690 + repX[i];
    y1 = 180 + repY[i];
    b[i] = new blink(x1, y1);
    println(x1, y1);
  }
  PImage c= loadImage("gift1.png");
  image(c, x, y, 650, 350);
  t = new tree();
  sp = new snowPile();
}

void draw() {
  fill(1, 53, 137);
  rect(0, 0, width, height);
  t.show();
  sp.accum();
  for (int i = 0; i < s.length; i++)
  {
    s[i].move();
    s[i].show();
  }
  for (int i = 0; i < b.length; i++) {
    b[i].light();
  }
}

void keyPressed() {
  if (key == '1') {
    x=10000;
    y=10000;
  }
  if (key == '2') {
    x=600;
    y=470;
  }
}

interface snow {
  void move();
  void show();
}
