class OddballParticle implements Particle
{
  double x, y, vx, vy, speed, angle;
  int r, g, b;
  int test = 0;
  int timer =0;
  OddballParticle(double pie) {
    x = width/2;
    y = height/2;
    speed = 1.5;
    angle = pie;
  }
  void randC() {
    r = ((int)(Math.random() * (155) + 100));
    g = ((int)(Math.random() * (155) + 100));
    b = ((int)(Math.random() * (155) + 100));
  }
  void move() {
    vx += (Math.cos(angle) * speed) /400;
    vy += (Math.sin(angle) * speed) /400;
    x += vx;
    y += vy;
    if (timer == 2000) {
      x = width/2;
      y = height/2;
      vx += 2;
      vy += 2;
      speed = 1.5;
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
      ellipse((float)x, (float) y, 15, 15);
    } else {

      ellipse((float)x, (float) y, 15, 15);
    }




    if ( x > 900 || x < 100) {
      if (test == 0) {
        vx *= .05;
        test = 5;
      }
      test --;
      x = width/2;
    }

    if ( y > 900 || y < 100) {
      if (test == 0) {
        vy *= .05;
        test = 2;
      }
      test --;
      y = height/2;
    }
  }
}
