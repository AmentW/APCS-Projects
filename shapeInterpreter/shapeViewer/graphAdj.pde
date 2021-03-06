import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;
import java.util.TreeMap;

pix pyx = new pix();

class graphAdj {

  ArrayList <pix> allPixels;
  ArrayList <pix> colorPixels;
  //ArrayList <pix> adjPixels;
  Map <pix, ArrayList <pix>> adjList = new HashMap <pix, ArrayList<pix>>();



  void loadData(ArrayList all, ArrayList colored) {
    allPixels = new ArrayList <pix> (all);
    colorPixels = new ArrayList <pix> (colored);
  }

  void createMap() {
    for (pix p : colorPixels) {
      adjList.put(p, new ArrayList <pix>());
    }
    //println(adjList.size());
    //println(colorPixels.size());
    int index = 0;
    for (pix p : adjList.keySet()) {
      //helper variables
      int x = p.getX(); 
      int y = p.getY();
      int c = p.getColor();
      int id = p.getID();
      //println(x + " " +y + "   " + c + "   "+ index);
      index++;
      //actual function

      pix one = allPixels.get(id-31);
      pix two = allPixels.get(id-30);
      pix three = allPixels.get(id-29);
      pix four = allPixels.get(id-1);
      pix six = allPixels.get(id+1);
      pix seven = allPixels.get(id+29);
      pix eight = allPixels.get(id+30);
      pix nine = allPixels.get(id+31);

      adjList.get(p).add(one);
      adjList.get(p).add(two);
      adjList.get(p).add(three);
      adjList.get(p).add(four);
      adjList.get(p).add(six);
      adjList.get(p).add(seven);
      adjList.get(p).add(eight);
      adjList.get(p).add(nine);
      //println(adjList.get(p).get(0).getColor());
      //println(adjList.get(p).get(1).getColor());
    }
  }

  Map <Integer, Integer> findEdges() {
    Map <Integer, Integer> edges = new HashMap <Integer, Integer>();
    for (pix p : adjList.keySet()) {
      int black = 0;
      int colored = 0;
      for (int i = 0; i<adjList.get(p).size(); i++) {
        if (adjList.get(p).get(i).getColor() == 0) {
          black++;
        } else if (adjList.get(p).get(i).getColor()<= p.getColor() + 60 && adjList.get(p).get(i).getColor() >= p.getColor() - 60 ) {
          colored++;
        }
      }
      if ( ((colored == 1 || colored == 2 || colored == 3) && black == 4)) {
        //println(colored + "  " + black);
        int x = p.getX();
        int y = p.getY();

        if (edges.containsKey(x + 1) && edges.containsValue(y+1) || edges.containsKey(x + 1) && edges.containsValue(y - 1) || edges.containsKey(x - 1) && edges.containsValue(y+1) || edges.containsKey(x - 1) && edges.containsValue(y - 1) || edges.containsKey(x + 1) && edges.containsValue(y) || edges.containsKey(x - 1) && edges.containsValue(y) || edges.containsKey(x) && edges.containsValue(y + 1) || edges.containsKey(x) && edges.containsValue(y - 1)) {
        } else if (edges.containsKey(x + 2) && edges.containsValue(y+2) || edges.containsKey(x + 2) && edges.containsValue(y - 2) || edges.containsKey(x - 2) && edges.containsValue(y+2) || edges.containsKey(x - 2) && edges.containsValue(y - 2) || edges.containsKey(x + 2) && edges.containsValue(y) || edges.containsKey(x - 2) && edges.containsValue(y) || edges.containsKey(x) && edges.containsValue(y + 2) || edges.containsKey(x) && edges.containsValue(y - 2)) {
        } else if (edges.containsKey(x + 3) && edges.containsValue(y+3) || edges.containsKey(x + 3) && edges.containsValue(y - 3) || edges.containsKey(x - 3) && edges.containsValue(y + 3) || edges.containsKey(x - 3) && edges.containsValue(y - 3) || edges.containsKey(x + 3) && edges.containsValue(y) || edges.containsKey(x - 3) && edges.containsValue(y) || edges.containsKey(x) && edges.containsValue(y + 3) || edges.containsKey(x) && edges.containsValue(y - 3)) {
        } else {
          edges.put(x, y);
        }

        //for (int xOffset = -2; xOffset <= 2; xOffset++)
        //{
        //  for (int yOffset = -2; yOffset <= 2; yOffset++)
        //  {
        //    if (edges.containsKey(x + xOffset) || edges.containsValue(y + yOffset))
        //    {
        //      println("ping");
        //       edges.put(x, y);
        //    }

        //  }
        //}
      }
    }
    return edges;


    //if (((colored == 3 || colored == 4) && (black == 4)) || ((colored == 4|| colored == 5) && (black == 3 || black ==  4)) || 
    //  ((colored == 1 || colored == 2 || colored == 3) && (black == 5 || black == 6 || black == 7))) {
    //  (( ) && ( ))
  }


  String toString() {
    for (pix p : adjList.keySet()) {
      println(p.getColor());
    }

    return "";
  }
}
