float x1, x2, x3, x4, x5;
float y1, y2, y3, y4, y5;
float r, g, b;
Shape shape = new Shape();
char lastKey;
int numShapes = 5;
int shapeType;


void setup() {
  size(30, 30);
  background(0);
  frameRate(10);
}

void draw() {

  //loadPixels();
  //if (keyPressed) {
  //  generateTriangle();
  //  generateQuadrilateral();
  //  if (key == ENTER) {
  //    shape.makeJSON();
  //  }
  //}
  //makeShape();
  if (shape.allShapes() < numShapes) {
    if (shape.getDone()) {
      shape.setDone(false);
      int rand = (int) random(2);
      // println(rand);
      if (rand == 0) {
        generateTriangle(); 
        background(0);
        shape.makeTriangle(x1, x2, x3, y1, y2, y3);
        shapeType = 0;
      } else {
        generateQuadrilateral();       
        background(0);
        shape.makeQuadrilateral(x1, x2, x3, x4, y1, y2, y3, y4);
        shapeType = 1;
      }
      loadPixels();
      shape.makeJSON(shapeType);
    }
  }
  if (shape.allShapes() == numShapes) {
    shape.saveJSON();
    noLoop();
  }
}
//println(mouseX + " " + mouseY);


//void makeShape() {
//  if (keyPressed) {
//    if (key == 'm' && lastKey == 't') {
//      //background(0);
//      //shape.showShape();
//      println("triangle drawn");
//    }
//    if (key == 'm' && lastKey == 'q') {
//      //background(0);
//      //shape.showShape();
//      println("quadrilateral drawn");
//    }
//  }
//}

//make it a simon says game. have it bring in 5, 10, 25, or 100 shapes. the algorithm takes its guess, have a marking for the actual shape, compare the two guesses on screen
void generateTriangle() {
  //if (key == 't') {
  //  lastKey = 't';
  int rand =  (int) random(6);
  //println(rand);
  if (rand == 0) {
    x1 =  random(1, 9);
    x2 =  random(11, 19);
    x3 =  random(21, 29);
    y2 =  random(1, 9);
    y3 =  random(11, 19);
    y1 =  random(21, 29);
  }
  if (rand == 1) {
    x1 =  random(1, 9);
    x2 =  random(11, 19);
    x3 =  random(21, 29);
    y3 =  random(1, 9);
    y1 =  random(11, 19);
    y2 =  random(21, 29);
  }
  if (rand == 2) {
    x1 =  random(1, 9);
    x2 =  random(10, 19);
    x3 =  random(20, 29);
    y2 =  random(1, 9);
    y3 =  random(20, 19);
    y1 =  random(20, 29);
  }
  if (rand == 3) {
    x1 =  random(1, 10);
    x2 =  random(13, 17);
    x3 =  random(20, 29);
    y2 =  random(1, 9);
    y3 =  random(20, 19);
    y1 =  random(20, 29);
  }
  if (rand == 4) {
    x1 =  random(1, 9);
    x2 =  random(10, 19);
    x3 =  random(20, 29);
    y3 =  random(1, 9);
    y1 =  random(1, 9);
    y2 =  random(20, 29);
  }
  if (rand == 5) {
    x1 =  random(3, 8);
    x2 =  random(3, 8);
    x3 =  random(20, 29);
    y1 =  random(2, 6);
    y3 =  random(2, 6);
    y2 =  random(24, 29);
  }
  println("triangle values generated");
  //}
}

void generateQuadrilateral() {
  //if (key == 'q') {
  //  lastKey = 'q';
  int rand =  (int) random(4);
  //println(rand);

  if (rand == 0) {
    x1 =  random(4, 8);
    x2 =  random(22, 26);
    x3 =  random(22, 26);
    x4 =  random(4, 8);
    y1 =  random(4, 10);
    y2 =  random(4, 10);
    y3 =  random(18, 28);
    y4 =  random(18, 28);
  }
  if (rand == 1) {
    x1 =  random(1, 14);
    x2 =  random(1, 14);
    x3 =  random(15, 28);
    x4 =  random(15, 28);
    y4 =  random(1, 14);
    y1 =  random(1, 14);
    y2 =  random(15, 28);
    y3 =  random(15, 28);
  }

  if (rand == 2) {
    x1 =  random(8, 14);
    x2 =  random(18, 22);
    x3 =  random(22, 26);
    x4 =  random(4, 8);
    y1 =  random(4, 10);
    y2 =  random(4, 10);
    y3 =  random(18, 28);
    y4 =  random(18, 28);
  }
  if (rand == 3) {
    x1 =  random(3, 5);
    x2 =  random(16, 24);
    x3 =  random(18, 22);
    x4 =  random(6, 11);
    y1 =  random(4, 8);
    y2 =  random(8, 16);
    y3 =  random(22, 28);
    y4 =  random(15, 28);
  }

  println("quadrilateral values generated");
  //}
}
