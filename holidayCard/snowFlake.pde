class snowFlake implements snow 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector start;
  float x, y;
  int r, g, b;
  int sizeX = 100;
  int sizeY = 100;
  snowFlake (float x, float y ) {
    this.location = new PVector(x, y);
    start = location;
    this.velocity = new PVector(((float)((Math.random() * .2) * posNeg()) ), ((float)(Math.random() * .5)  ));
    this.acceleration = new PVector(((float)(Math.random() * (.02)) ), ((float)(Math.random() * (.02)) ));
  }
  int posNeg() {
    int num = (int)random(0, 2);
    if (num == 0) {
      return -1;
    } else {
      return 1;
    }
  }
  void randC() {
    r = ((int)(Math.random() * (155) + 100));
    g = ((int)(Math.random() * (155) + 100));
    b = ((int)(Math.random() * (155) + 100));
  }
  void move() {
    posNeg();
    //println(velocity);
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(5);
  }
  void show() {
    noStroke();
    fill(255);
    if (location.x > width || location.x < 0) {
      location.x = ((float)(Math.random() * 1000) + 1);
      location.y = (((float)(Math.random()) * (20-0)));
      
      
    } 
    if (location.y > height || location.y < 0) {
      location.x = ((float)(Math.random() * 1000) + 1);
      location.y = (((float)(Math.random()) * (20-0)));
    } 

    ellipse(location.x, location.y, 10, 10);
    
  }
  
}
