class NormalParticle implements Particle {
  double x, y, angle, speed;
  int r, g, b;
  int test = 0;
  int timer = 0;
  NormalParticle(double pie) {
    x = width/2;
    y = height/2;
    angle = pie;
    speed = 10;
  }
  void move() {

    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;
    angle += .047;


    // X boundaries
    //
    if ( x > 830) {
      x = 830;
      //speed *= -1.02;
    } else if (x < 170) {
      x = 170;
      //speed *= -1.02;
    }
    // Y boundaries
    if ( y > 830) {
      y = 830;
      //speed *= -1.02;
    } else if (y < 170) {
      y = 170;
      //speed *= -1.02;
    }
  }
  // color change
  void randC() {
    r = ((int)(Math.random() * (155) + 100));
    g = ((int)(Math.random() * (155) + 100));
    b = ((int)(Math.random() * (155) + 100));
  }

  void show() {
    noStroke();

    if (test == 0) {
      randC();
      test = 100;
    }
    test --;
    fill(r, g, b);
    ellipse((int)x, (int)y, 20, 20);
  }
}
