class JumboParticle extends OddballParticle //uses inheritance
{
  double x, y, vx, vy, speed, angle, sizeX, sizeY;
  int r, g, b;
  int timer = 0 ;
  JumboParticle(double pie) {
    super(pie);
    x = width/2;
    y = height/2;
    speed = 80;
    angle = pie;
    sizeX = 15;
    sizeY = 15;
  }
  void move() {


    vx = (Math.cos(angle) * speed) /100 ;
    vy = (Math.sin(angle) * speed) /100 ;
    x += vx;
    y += vy;
    sizeX += .05;
    sizeY += .05;

    if (timer == 2000) {
      x = width/2;
      y = height/2;
      sizeX = 15;
      sizeY = 15;
    }
    timer ++;
  }
  void show() {
    noStroke();
    if (test == 0) {
      randC();
      test = 100;
    }
    test --;
    fill(r, g, b);

    if (mousePressed == true) {
      x = width/2;
      y = height/2;
      ellipse((float)x, (float) y, (float)sizeX, (float)sizeY);
    } else {

      ellipse((float)x, (float) y, (float)sizeX, (float)sizeY);
    }




    if ( x > 700 || x < 300) {
      if (test == 0) {
        vx *= .05;
        test = 5;
      }
      test --;
      x = width/2;
    }

    if ( y > 700 || y < 300) {
      if (test == 0) {
        vy *= .05;
        test = 2;
      }
      test --;
      y = height/2;
    }
  }
  void randC() {
    r = ((int)(Math.random() * (155) + 100));
    g = ((int)(Math.random() * (155) + 100));
    b = ((int)(Math.random() * (155) + 100));
  }
}
