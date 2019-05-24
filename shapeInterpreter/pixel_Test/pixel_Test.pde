JSONArray values;
int x1, x2, x3;
int y1, y2, y3;
float r, g, b;


void setup() {
  size(30, 30);
  //size(10, 10);
  frameRate(30);
}

void draw() {

  loadPixels();
  generate();
  makeShape();

  if (keyPressed) {
    if (key == ENTER) {
      makeJSON();
    }
  }
  //println(mouseX + " " + mouseY);
}

void generate() {
  if (keyPressed) {
    if (key == 't') {
      x1 = (int) random(3, 27);
      x2 = (int) random(3, 27);
      x3 = (int) random(3, 27);
      y1 = (int) random(3, 27);
      y2 = (int) random(3, 27);
      y3 = (int) random(3, 27);
      //x1 = (int) random(1, 9);
      //x2 = (int) random(1, 9);
      //x3 = (int) random(1, 9);
      //y1 = (int) random(1, 9);
      //y2 = (int) random(1, 9);
      //y3 = (int) random(1, 9);

      while (abs(x3-x1) < 6 || abs(x1-x2) < 6 || abs(x1-x2) < 6 ) {
        x1 = (int) random(3, 27);
        x2 = (int) random(3, 27);
        x3 = (int) random(3, 27);
      }
      //while () {

      //}
      //while () {

      //}

      while (abs(y3-y1) < 6 || abs(y1-y2) < 6 || abs(y3-y2) < 6 ) {
        y1 = (int) random(3, 27);
        y2 = (int) random(3, 27);
        y3 = (int) random(3, 27);
      }
      //while (abs(y1-y2) < 6 ) {

      //}
      //while (abs(y3-y2) < 6 ) {

      //}
      if (r <80) {
        r = random(160, 240);
        g = random(80, 160);
        b = random(0, 80);
      } else if (r >80 && r <160) {

        r = random(0, 80);
        g = random(160, 240);
        b = random(80, 160);
      } else {
        r = random(80, 160);
        g = random(0, 80);
        b = random(160, 240);
      }
    }
  }
}

void makeShape() {
  background(0);
  fill(255);

  strokeWeight(.8);
  stroke(r, g, b);
  //stroke(200, 0, 0);
  triangle((float) x1, (float) x2, (float) x3, (float) y1, (float) y2, (float) y3);
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
    //float c = (blue(pixels[i]) + green(pixels[i]) + red(pixels[i])) / 3;
    //pixel.setFloat("color", c);
    pixel.setFloat("r", red(pixels[i]));
    pixel.setFloat("g", green(pixels[i]));
    pixel.setFloat("b", blue(pixels[i]));

    xloc++;
    values.setJSONObject(i, pixel);
  }


  saveJSONArray(values, "/Users/763791/Desktop/shapeInterpreter/jsonTest/data/pixelData.json");
  println("file saved");
}
