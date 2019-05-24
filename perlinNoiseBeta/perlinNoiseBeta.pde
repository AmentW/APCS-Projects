float tX = 0, tY = 0, tZ = 0;
float zoff = 0;
float rateR = 0, rateG = 0, rateB = 0;
float R = random(55, 200);
float G = random(55, 200);
float B = random(55, 200);
float neo = .5;
float dirX = 0, dirY = 0, dirZ = 0;
boolean red = true;
boolean green = true;
boolean blue = true;
boolean grow = true;
boolean stop = true;
void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rateR = random(.5, 2);
  rateG = random(.5, 2);
  rateB = random(.5, 2);
  randC();
  stroke(R, G, B);
  noFill();
  //fill(Math.abs(255-R), Math.abs(255-G), Math.abs(255-B), 80);
  frameRate(60); 
  beginShape();
  for (float a = 0; a< 30*PI; a+=(PI/36)) {

    float xoff = cos(a);
    float yoff = sin(a);
    float k = map(noise(xoff, yoff, zoff), 0, 1, .2, .5);

    //float r = map(cos((2*a)/5) * k, -1, 1, -100, 100) * 3;
    float r = map(cos(20*a/13)* k, -1, 1, -100, 100) * 5;
    float x = r * cos(a);
    float y = r * sin(a);
    float z = r;

    curveVertex(x, y, z);
    rotateX(tX);//*(noise(-.1, .1)*2));
    rotateY(tY);//*(noise(-.1, .1)*2));
    rotateZ(tZ);//*(noise(-.1, .1)*2));
  }
  //print(neo + "  ");
  if (neo >= .8) {
    //println("hit");
    stop = true;
  } 
  if (neo <= 0) {
    stop = false;
    direction();
    print(dirX + "  ");
  }

  if (stop == true) {
    neo -= (noise(0, 1)/100);
  } else {
    neo += (noise(0, 1)/100);
  }
  tX+= neo/10000*dirX;
  tY+= neo/10000*dirY;
  tZ+= neo/8000*dirZ;

  endShape();
  stroke(255, 0, 0);
  line(0, 100, 0, 0, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
  zoff +=.06;
}
void randC() {
  //--------------------Red-----------------------//
  if (red == true) {
    R+=rateR; 
    if ( R > 240) {
      red = false;
    }
  } 
  if (red == false) {
    R-=rateR;
    if ( R < 10) {
      red = true;
    }
  }
  //--------------------Green-----------------------//
  if (green == true) {
    G+=rateG;
    if ( G > 220) {
      green = false;
    }
  } 
  if (green == false) {
    G-=rateG;
    if ( G < 30) {
      green = true;
    }
  }
  //--------------------Blue-----------------------//
  if (blue == true) {
    B+=rateB;
    if ( B > 210) {
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

void direction() {
  dirX = random(-1, 1);
  dirY = random(-1, 1);
  dirZ = random(-1, 1);
  if (dirX > 0) {
    dirX = 1;
  } else {
    dirX = -1;
  }

  if (dirY > 0) {
    dirY = 1;
  } else {
    dirY = -1;
  }

  if (dirZ > 0) {
    dirZ = 1;
  } else {
    dirZ = -1;
  }
}
