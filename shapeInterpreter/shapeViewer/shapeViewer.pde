import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Queue;
import java.util.Stack;
import java.util.LinkedList;

JSONArray values;
pix P;
graphAdj graph = new graphAdj();
int count = 0;
JSONObject pixel;
ArrayList <pix> list = new ArrayList <pix>();
ArrayList <pix> colored = new ArrayList <pix>();
//Queue <Integer> xS;
//Queue <Integer> yS;
ArrayList <Integer> xS;
ArrayList <Integer> yS;
Stack <Integer> xStack;
Stack <Integer> yStack;
float duplicates = 0;
int X = 2, Y = 12;

void setup() {
  size(600, 620);
  background(50);
  //values = loadJSONArray("/Users/763791/Desktop/shapeInterpreter/shapeViewer/data/pixelData.json");
  values = loadJSONArray("C:/Users/will/Desktop/shapeInterpreter/shapeViewer/data/pixelData.json");
  for (int i = 0; i < values.size(); i++) {
    pixel = values.getJSONObject(i); 

    int id = pixel.getInt("id");
    int x = pixel.getInt("x");
    int y = pixel.getInt("y");
    float r = pixel.getFloat("r");
    float g = pixel.getFloat("g");
    float b = pixel.getFloat("b");
    P = new pix(id, x, y, r, g, b);
    list.add(P);
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
    //println(graph.findEdges());
    //println(graph.findEdges().keySet());
    //println(graph.findEdges().values());
    xS = new ArrayList <Integer>();
    yS = new ArrayList <Integer>();
   // xStack = new Stack <Integer>();
    //yStack = new Stack <Integer>();
    for (Integer x : graph.findEdges().keySet()) {
      xS.add(x);
     // xStack.push(x);
    }
    for (Integer y : graph.findEdges().values()) {
      yS.add(y);
    //  yStack.push(y);
    }
  }
  if (frameCount == 480) {
    println(graph.findEdges());
    removeDupes();
    println(xS.size());
    println(duplicates);
    int numEdges = abs(xS.size() - (int)duplicates);

    println(numEdges);
  }
}


void removeDupes() {
  Stack <Integer> temp = new  Stack <Integer>();


  //for (int i = 0; i< xS.size(); i++) {
  //  while (!xStack.empty()) {
  //    if ((xS.get(i) <= xStack.peek()+1 && xS.get(i) >= xStack.peek()-1) && 
  //      (yS.get(i) <= yStack.peek()+1 && yS.get(i) >= yStack.peek()-1 || yS.get(i) == yStack.peek())) {
  //      count++;

  //      println("ping");
  //    }
  //  }
  //  xStack.pop();
  //  yStack.pop();
  //}

  duplicates = count/2 - count/4;

  //while (!yStack.empty()) {
  //  for (int i = 0; i< yS.size(); i++) {
  //    if (yS.get(i) == yStack.peek()+1 || (yS.indexOf(yS.get(i)) != yS.lastIndexOf(yS.get(i)))) {

  //      countY++;
  //      yS.remove(i);
  //      println("pong");
  //    }
  //  }
  //  yStack.pop();

  //}
}

void drawCoord() {
  fill(0);
  rect(555, 600, 30, 15);
  fill(255);
  text(mouseX/20 + " " + (mouseY)/20, 560, 610);
}

//pixels with 5-6 adjacent pixels that are black (0)
//pixels with 3-4 adjacent pixels that are black (0)


void vizShape() {
  for (pix p : list) {
    p.filter();
    fill(p.getRed(), p.getGreen(), p.getBlue());
    if (Y < 600) {
      rect(X-2, Y-10, 18, 12);
    }
    if (((p.getRed()+ p.getGreen()+ p.getBlue()) /3) < 100) {
      fill(255);
    } else {
      fill(0);
    }
    textSize(8);
    if (Y < 600) {
      text(p.getColor(), X, Y);
    }
    if ((p.getID() + 1) % 300 == 0) {
      noStroke();
      fill(80, 250, 80);
    } else if ((p.getID() + 1) % 100 == 0) {
      noStroke();
      fill(120, 160, 255);
    } else if ((p.getID() + 1) % 10 == 0) {
      noStroke();
      fill(250, 80, 80);
    } else {
      noStroke();
      fill(0, 0, 0, 0);
    }
    if (Y < 600) {
      rect(X+13, Y-10, 4, 4);
    }
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
