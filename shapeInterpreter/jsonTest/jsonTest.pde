
JSONArray values;
pix P;
int count = 0;
JSONObject pixel;
ArrayList <pix> list = new ArrayList <pix>();
int X = 2, Y = 10;

void setup() {
  size(600, 600);
  background(50);
  values = loadJSONArray("/Users/763791/Desktop/shapeInterpreter/jsonTest/data/pixelData.json");

  for (int i = 0; i < values.size(); i++) {

    pixel = values.getJSONObject(i); 

    int id = pixel.getInt("id");
    int x = pixel.getInt("x");
    int y = pixel.getInt("y");
    //float c = pixel.getFloat("color");
    float r = pixel.getFloat("r");
    float g = pixel.getFloat("g");
    float b = pixel.getFloat("b");
    //println(id + " " + x + " " + y + " " + c);
    P = new pix(id, x, y, r, g, b);
    list.add(P);
    //println(id + ", " + species + ", " + name);
  }
}

void draw() {
  vizShape();
}

//pixels with 5-6 adjacent pixels that are black (0)
//pixels with 3-4 adjacent pixels that are black (0)


void vizShape() {
  textSize(8);
  for (pix p : list) {
    p.filter();
    fill(p.getRed(), p.getGreen(), p.getBlue());
    rect(X-1, Y-10, 18, 12);
    if (((p.getRed()+ p.getGreen()+ p.getBlue()) /3) < 160) {
      fill(255);
    } else {
      fill(0);
    }
    text(p.getColor(), X, Y);

    X+=width/30;
    if (X > width) {
      Y+=height/30;
      X = 2;
    }
  }
}
