import java.util.Queue;
import java.util.Stack;
import java.util.ArrayList;
import java.util.LinkedList;


class Shape {
  PShape triangle;
  PShape quadrilateral;
  float r, g, b;
  Queue <PShape> shapeQ = new LinkedList <PShape>();
  JSONArray allShapes = new JSONArray();
  JSONArray shape;
  int index = 0;
  boolean done = true;
  boolean allDone = false;
  PShape temp;

  void makeTriangle(float x1, float x2, float x3, float y1, float y2, float y3) {
    triangle = createShape();
    generateColor();
    triangle.beginShape(TRIANGLES);
    triangle.strokeWeight(.8);
    triangle.stroke(r, g, b);
    triangle.vertex(x1, y1);
    triangle.vertex(x2, y2);
    triangle.vertex(x3, y3);
    endShape(CLOSE);
    shapeQ.add(triangle);
    shape(triangle);
  }

  void makeQuadrilateral(float x1, float x2, float x3, float x4, float y1, float y2, float y3, float y4) {
    quadrilateral = createShape();
    generateColor();
    quadrilateral.beginShape(QUADS);
    quadrilateral.strokeWeight(.8);
    quadrilateral.stroke(r, g, b);
    quadrilateral.vertex(x1, y1);
    quadrilateral.vertex(x2, y2);
    quadrilateral.vertex(x3, y3);
    quadrilateral.vertex(x4, y4);    
    endShape(CLOSE);
    shapeQ.add(quadrilateral);
    shape(quadrilateral);
  }

  void generateColor() {
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

  void makeJSON(int shapeType) {
    shape = new JSONArray();
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
      pixel.setInt("type", shapeType);
      pixel.setFloat("r", red(pixels[i]));
      pixel.setFloat("g", green(pixels[i]));
      pixel.setFloat("b", blue(pixels[i]));

      xloc++;
      shape.setJSONObject(i, pixel);
    }
    allShapes.setJSONArray(index, shape);
    index++;
    done = true;
  }

  int allShapes() {
    return allShapes.size();
  }

  void saveJSON() {
    //saveJSONArray(allShapes, "C:/Users/will/Desktop/shapeInterpreter - beta/shapeViewer/data/pixelData.json");
    saveJSONArray(allShapes, "/Users/763791/Desktop/shapeInterpreter - beta/shapeViewer/data/pixelData.json");
    println(allShapes.size());
  }


  boolean getDone() {
    return done;
  }

  void setDone(boolean set) {
    done = set;
  }
}
