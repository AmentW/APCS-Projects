import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Queue;
import java.util.Stack;
import java.util.LinkedList;


pix P;
graphAdj graph = new graphAdj();
JSONArray shapeArray;
JSONObject pixel;
ArrayList <pix> colored = new ArrayList <pix>();
ArrayList <Integer> xS;
ArrayList <Integer> yS;
Queue <ArrayList> collectedShapes = new LinkedList <ArrayList>();
ArrayList <pix> temp = new ArrayList <pix>();
float duplicates = 0;
int X = 2, Y = 12;
int type;
int count = 0;
boolean pass = true;
String runtime = "";

void setup() {
  size(600, 620);
  background(50);
  shapeArray = loadJSONArray("/Users/763791/Desktop/shapeInterpreter - beta/shapeViewer/data/pixelData.json");
  //shapeArray = loadJSONArray("C:/Users/will/Desktop/shapeInterpreter - beta/shapeViewer/data/pixelData.json");

  for (int k = 0; k< shapeArray.size(); k++) {
    JSONArray values = shapeArray.getJSONArray(k);
    ArrayList <pix> list = new ArrayList <pix>();
    for (int i = 0; i < values.size(); i++) {
      pixel = values.getJSONObject(i); 
      int id = pixel.getInt("id");
      int x = pixel.getInt("x");
      int y = pixel.getInt("y");
      type = pixel.getInt("type");
      float r = pixel.getFloat("r");
      float g = pixel.getFloat("g");
      float b = pixel.getFloat("b");
      P = new pix(id, x, y, type, r, g, b);
      list.add(P);
    }
    collectedShapes.add(list);
  }
}

void draw() {
  drawCoord();
  //println(list.get(398).getRed() + "  " +list.get(398).getGreen() + "  " + list.get(398).getBlue());
  if (frameCount%300 == 0 && pass) {
    background(50);
    if (!collectedShapes.isEmpty()) {
      temp = collectedShapes.remove();
      println("start  " + (5-collectedShapes.size()));
      coloredData();
      vizShape();
      graph.loadData(temp, colored); //make the "list" argument run off of "collectedShapes"
      //need to make the program run "slower" to allow viewers to see it
      graph.createMap();

      xS = new ArrayList <Integer>();
      yS = new ArrayList <Integer>();
      type = temp.get(0).getType();

      for (Integer x : graph.findCorner(type).keySet()) {
        xS.add(x);
      }
      for (Integer y : graph.findCorner(type).values()) {
        yS.add(y);
      }
    }
  }


  if (frameCount%320 == 0 && pass) {
    if (!collectedShapes.isEmpty()) {

      println(graph.findCorner(type));
      if (type == 0) {
        println("triangle");
      } else if (type == 1) {
        println("quadrilateral");
      }
      int numCorners = xS.size();

      println("number of corners  " +numCorners);
      xS.clear();
      yS.clear();
      numCorners = 0;
      println("end");
    }
  }
}

void keyPressed() {
  if (key == TAB) {
    if (pass) {
      //noLoop();
      runtime = "pause";
      pass = false;
    } else if (!pass) {
      //loop();
      runtime = "play";
      pass = true;
    }
    println(runtime);
  }
}

void drawCoord() {
  fill(0);
  rect(555, 600, 30, 15);
  fill(255);
  text(mouseX/20 + " " + (mouseY)/20, 560, 610);
}

void vizShape() {
  X = 2;
  Y = 12;
  for (pix p : temp) {
    p.filter();
    fill(p.getRed(), p.getGreen(), p.getBlue());
    if (Y < 600) {
      rect(X-2, Y-10, 18, 12); //pixel boxes
    }
    if (((p.getRed()+ p.getGreen()+ p.getBlue()) /3) < 100) { //creates white text on black rect and vice versa
      fill(255);
    } else {
      fill(0);
    }
    textSize(8);
    if (Y < 600) {
      text(p.getColor(), X, Y); //gray scale color value for pixel
    }
    if ((p.getID() + 1) % 300 == 0) { //green marker for every 300
      noStroke();
      fill(80, 250, 80);
    } else if ((p.getID() + 1) % 100 == 0) { //blue marker for every 100
      noStroke();
      fill(120, 160, 255);
    } else if ((p.getID() + 1) % 10 == 0) { //red marker for every 10
      noStroke();
      fill(250, 80, 80);
    } else {
      noStroke();
      fill(0, 0, 0, 0);
    }
    if (Y < 600) { //display box for hovered pixel
      rect(X+13, Y-10, 4, 4);
    }
    X+=width/30;
    if (X > width) { //scales pixel values from 30x30 to 600x600
      Y+=height/30;
      X = 2;
    }
  }
}

void coloredData() { //organizes colored pixels
  for (pix p : temp) {
    p.filter();
    if (p.getColor() != 0) {
      colored.add(p);
    }
  }
}
