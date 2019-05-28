JSONArray values;
float x1, x2, x3, x4, x5;
float y1, y2, y3, y4, y5;
float r, g, b;
PShape [] shapes;
Shape shape = new Shape();
char lastKey;


void setup() {
  size(30, 30);
  background(0);
  //size(10, 10);
  frameRate(10);
}

void draw() {

  loadPixels();
  if (keyPressed) {
    generateTriangle();
    generateQuadrilateral();
    if (key == ENTER) {
      makeJSON();
    }
  }
  makeShape();
  //println(mouseX + " " + mouseY);
}

//make it a simon says game. have it bring in 5, 10, 25, or 100 shapes. the algorithm takes its guess, have a marking for the actual shape, compare the two guesses on screen
//shape types : triangle (irregular and equilateral), polygon (irregular and equilateral)
void generateTriangle() {
  if (key == 't') {
    lastKey = 't';
    int rand =  (int) random(6);
    println(rand);
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
      x2 =  random(x1 + 5, 19);
      x3 =  random(x2 + 5, 29);
      y2 =  random(1, 9);
      y3 =  random(y1 + 5, 19);
      y1 =  random(y2 + 5, 29);
    }
    if (rand == 3) {
      x1 =  random(1, 9);
      x2 =  random(x1, 19);
      x3 =  random(x2, 29);
      y2 =  random(1, 9);
      y3 =  random(y1, 19);
      y1 =  random(y2, 29);
    }
    if (rand == 4) {
      x1 =  random(1, 9);
      x2 =  random(x1 + 5, 19);
      x3 =  random(x2 + 5, 29);
      y3 =  random(1, 9);
      y1 =  random(y1 + 5, 19);
      y2 =  random(y2 + 5, 29);
    }
    if (rand == 5) {
      x1 =  random(1, 9);
      x2 =  random(x1, 19);
      x3 =  random(x2, 29);
      y3 =  random(1, 9);
      y1 =  random(y1, 19);
      y2 =  random(y2, 29);
    }
    println("triangle values generated");
  }
}

void generateQuadrilateral() {
  if (key == 'q') {
    lastKey = 'q';
    int rand =  (int) random(2);
    println(rand);
    //if (rand == 0) {
    //  x1 =  random(1, 7);
    //  x2 =  random(8, 14);
    //  x3 =  random(15, 21);
    //  x4 =  random(22, 28);
    //  y2 =  random(1, 7);
    //  y3 =  random(8, 14);
    //  y4 =  random(15, 21);
    //  y1 =  random(22, 28);
    //}
    //if (rand == 1) {
    //  x1 =  random(1, 7);
    //  x2 =  random(8, 14);
    //  x3 =  random(15, 21);
    //  x4 =  random(22, 28);
    //  y4 =  random(1, 7);
    //  y1 =  random(8, 14);
    //  y2 =  random(15, 21);
    //  y3 =  random(22, 28);
    //}
    if (rand == 0) {
      x1 =  random(1, 14);
      x2 =  random(1, 14);
      x3 =  random(15, 28);
      x4 =  random(15, 28);
      y4 =  random(1, 14);
      y1 =  random(1, 14);
      y2 =  random(15, 28);
      y3 =  random(15, 28);
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
    println("quadrilateral values generated");
  }
}


void makeShape() {
  if (keyPressed) {
    if (key == 'm' && lastKey == 't') {
      background(0);
      shape.makeTriangle(x1, x2, x3, y1, y2, y3);
      println("triangle drawn");
    }
    if (key == 'm' && lastKey == 'q') {
      background(0);
      shape.makeQuadrilateral(x1, x2, x3, x4, y1, y2, y3, y4);
      println("quadrilateral drawn");
    }
  }
}

void makeJSON() {
  values = new JSONArray();
  int xloc = 0;
  int yloc = 0;
  for (int i = 0; i < pixels.length; i++) {
    JSONObject pixel = new JSONObject();
    if (xloc == width) {
      xloc = 0;
      yloc++;
    }

    pixel.setInt("id", i);
    pixel.setInt("x", xloc);
    pixel.setInt("y", yloc);
    pixel.setFloat("r", red(pixels[i]));
    pixel.setFloat("g", green(pixels[i]));
    pixel.setFloat("b", blue(pixels[i]));

    xloc++;
    values.setJSONObject(i, pixel);
  }

  saveJSONArray(values, "C:/Users/will/Desktop/shapeInterpreter/shapeViewer/data/pixelData.json");

  //saveJSONArray(values, "/Users/763791/Desktop/shapeInterpreter/jsonTest/data/pixelData.json");
  println("file saved");
}
