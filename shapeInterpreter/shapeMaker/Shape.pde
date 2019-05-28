import java.util.Queue;
import java.util.ArrayList;
import java.util.LinkedList;


class Shape {
  PShape triangle;
  PShape quadrilateral;
  float r, g, b;
  Queue <PShape> shapes = new LinkedList <PShape>();

  Shape() {
    
  }


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
    shapes.add(triangle);
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
    shapes.add(quadrilateral);
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
}
