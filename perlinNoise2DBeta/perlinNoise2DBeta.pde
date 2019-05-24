float tX = 0, tY = 0, tZ = 0;
float zoff = 0;
float rateR = 0, rateG = 0, rateB = 0;
float R = random(55, 200);
float G = random(55, 200);
float B = random(55, 200);
float neo = 0;
float dirX = 0, dirY = 0, dirZ = 0;
boolean red = true;
boolean green = true;
boolean blue = true;
boolean grow = true;
boolean stop = true;
void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rateR = random(.5, 2);
  rateG = random(.5, 2);
  rateB = random(.5, 2);
  randC(); //random color shifter
  stroke(R, G, B);
  noFill();
  //fill(Math.abs(255-R), Math.abs(255-G), Math.abs(255-B), 80);
  frameRate(60); 
  for (int a= 0; a < 2*PI; a+= (PI)) {
    rotateY(a); //creates multiple cross sections
    shape(); //creates the shape
    rotation(); //makes it rotate
  }
  zoff +=.04; //rate of change of grow/shrink
  //------------XYZ lines-----------//
  //stroke(255, 0, 0);
  //line(0, 100, 0, 0, 0, 0);
  //stroke(0, 255, 0);
  //line(0, 0, 0, 100, 0, 0);
  //stroke(0, 0, 255);
  //line(0, 0, 0, 0, 0, 100);
  
}

void shape() {

  beginShape(); 
  for (float theta = 0; theta< 60*PI; theta+=(PI/36)) {
    float xoff = cos(theta); 
    float yoff = sin(theta);
    float k = map(noise(xoff, yoff, zoff), 0, 1, .2, .5); //magnitude of grow/shrink

    //float r = map(cos((2*theta)/5) * k, -1, 1, -100, 100) * 10;
    float r = map(cos((2*theta)/7) * k, -1, 1, -100, 100) * 10; //polar function
    //float r = map(cos(20*theta/13) * k, -1, 1, -100, 100) * 8;
    //float r = map(sin(17*theta/33)* k, -1, 1, -100, 100) * 8; 
    //float r = map(sin(2*theta)* k, -1, 1, -100, 100) * 5; 
    float x = r * cos(theta); //x-coordinate
    float y = r * sin(theta); //y-coordinate
    //float z = r;            //z-coordinate

    curveVertex(x, y); //plotted points
    //rotateX(tX/2); 
    //rotateY(tY/2); 
    rotateZ(tZ/2);
  }
  endShape();
}
void rotation() {
  //print(neo + "  ");
  if (neo >= .2) { //restricts the max speed
    //println("hit");
    stop = true;
  } 
  if (neo <= 0) {  //resticts the min speed
    stop = false; 
    direction(); //pos or neg direction
    print(dirX + "  ");
  }

  if (stop == true) {
    neo -= map((noise(0, 1)), 0, 1, 0, .5)/1000; //speed of rotation
  } else {
    neo += map((noise(0, 1)), 0, 1, 0, .5)/1000; //speed of rotation
  }
  tX+= neo/22000*dirX; //final rotational values
  tY+= neo/18000*dirY; 
  tZ+= neo/16000*dirZ;
}

void direction() { //makes the direction of rotation pos or neg
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
