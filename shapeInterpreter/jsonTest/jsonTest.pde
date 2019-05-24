import java.util.ArrayList;


JSONArray values;
pix P;
graphAdj graph = new graphAdj();
int count = 0;
JSONObject pixel;
ArrayList <pix> list = new ArrayList <pix>();
ArrayList <pix> colored = new ArrayList <pix>();

int X = 2, Y = 30;

void setup() {
  size(600, 630);
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

  drawCoord();
  vizShape();
  if (frameCount == 180) {
    sendData();
    graph.loadData(list, colored);
    graph.createMap();
  }
  if (frameCount == 240) {
    //println(graph);
    println(graph.findEdges());
  }
}

void drawCoord() {
  fill(0);
  rect(7, 0, 40, 10);
  fill(255);
  text(mouseX/20 + " " + (mouseY-32)/20, 10, 10);
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

void sendData() {

  for (pix p : list) {
    p.filter();
    if (p.getColor() != 0) {
      colored.add(p);
    }
  }



  //for (int i = 0; i < colored.size(); i++){
  //  println(colored.get(i).getColor());
  //}

  //for (int i = 0; i < list.size(); i++){
  //  println(list.get(i).getColor());
  //}
}
