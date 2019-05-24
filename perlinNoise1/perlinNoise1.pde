float t = 0;
float zoff = 0;
float rateR = 0, rateG = 0, rateB = 0;
float R = random(55,200);
float G = random(55,200);
float B = random(55,200);
boolean red = true;
boolean green = true;
boolean blue = true;
boolean grow = true;
void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rateR = random(2, 10);
  rateG = random(2, 10);
  rateB = random(2, 10);
  randC();
  stroke(R, G, B);
  noFill();
  //fill(Math.abs(255-R), Math.abs(255-G), Math.abs(255-B), 80);
  frameRate(60); 
  beginShape();
  for (float a = 0; a< 9*PI; a+=(PI/36)) {

    float xoff = cos(a);
    float yoff = sin(a);
    float k = map(noise(xoff, yoff, zoff), 0, 1, .2, .5);

    //float r = map(cos((2*a)/5) * k, -1, 1, -100, 100) * 3;
    float r = map(cos(9*a/4)* k, -1, 1, -100, 100) * 5;
    float x = r * cos(a);
    float y = r *sin(a);

    curveVertex(x, y);
    rotateX(t*(noise(0,1)*2));
    rotateY(t*(noise(0,1)*2));
    rotateZ(t*(noise(0,1)*2));
  }
  t+= map(noise(0, 1), 0, 1, .45, .55)/5000;

  endShape();
  zoff +=.06;
}
void randC() {
  //--------------------Red-----------------------//
  if (red == true) {
    R+=rateR; 
    if ( R > 215) {
      red = false;
    }
  } 
  if (red == false) {
    R-=rateR;
    if ( R < 40) {
      red = true;
    }
  }
  //--------------------Green-----------------------//
  if (green == true) {
    G+=rateG;
    if ( G > 215) {
      green = false;
    }
  } 
  if (green == false) {
    G-=rateG;
    if ( G < 40) {
      green = true;
    }
  }
  //--------------------Blue-----------------------//
  if (blue == true) {
    B+=rateB;
    if ( B > 215) {
      blue = false;
    }
  } 
  if (blue == false) {
    B-=rateB;
    if ( B < 40) {
      blue = true;
    }
  }
}
