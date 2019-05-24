Particle [] p=new Particle[100];
double pie = 0;
double speed=0;
int timer = 0;
int x = 0;
int y = 0;

//
void settings() {
  size(1000, 1000);
}
void setup() 
{
  frameRate(80);
  for ( int i = 0; i< p.length; i++) {
    p[i] = new NormalParticle(pie);
    pie += Math.PI/24;
  }
  for ( int j = 0; j< 36; j++) {
    p[j] = new OddballParticle(pie);
    pie += Math.PI/18;
  }
  for ( int k = 36; k< 48; k++) {
    p[k] = new JumboParticle(pie);
    pie += Math.PI/6;
  }
}



void draw() {

  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
  if ( keyPressed == false) {
    for ( int i = 0; i< p.length; i++) {
      p[i].move();
      p[i].show();
    }
  } else {
    for ( int i = 0; i< p.length; i++) {
      p[i].show();
    }
  }
}
interface Particle {
  void move();
  void show();
  void randC();
}
