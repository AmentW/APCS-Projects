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
  boolean oneTime = true;
  Map <Integer, Integer> copy = new HashMap<Integer, Integer>();


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




  Map <Integer, Integer> findCorner(int type) {
    Map <Integer, Integer> corner = new HashMap <Integer, Integer>();
    for (pix p : adjList.keySet()) {
      int black = 0;
      int colored = 0;
      for (int i = 0; i<adjList.get(p).size(); i++) {
        if (adjList.get(p).get(i).getColor() == 0) {
          black++;
        } else if (adjList.get(p).get(i).getColor()<= p.getColor() + 80 && adjList.get(p).get(i).getColor() >= p.getColor() - 80 ) {
          colored++;
          if (adjList.get(p).get(i).getRed() + adjList.get(p).get(i).getGreen() + adjList.get(p).get(i).getBlue() >= 740) {
            black++;
            //println(adjList.get(p).get(i).getID());
          }
        }
      }    
      if (type == 0) {
        //println(colored + "   " + black);
        if ( ((colored == 1 || colored == 2 || colored == 3) && (black == 5 || black == 6 || black == 7))) {

          int x = p.getX();
          int y = p.getY();

          corner.put(x, y);
        }
      }
      if (type == 1) {
        if ( ((colored == 3) && (black == 4)) || (colored == 2 && black == 5) || (colored == 1 && black == 6)) {

          int x = p.getX();
          int y = p.getY();

          corner.put(x, y);
        }
      }
    }
    if (oneTime) {
      copy.putAll(corner);
      oneTime = false;
      println(copy);
    }

    int count = 0;
    for (Map.Entry<Integer, Integer> entry : copy.entrySet()) {

      for (Map.Entry<Integer, Integer> check : copy.entrySet()) {

        if (((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue() - 1)) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue() - 1))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue()))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() - 1)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() - 1))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue() - 2)) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue() - 2))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue())) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue()))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() - 2)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey()) && (entry.getValue() == check.getValue() - 2))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey() + 1) && (entry.getValue() == check.getValue() - 2)) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue() + 2)) || ((entry.getKey() == check.getKey() - 1) && (entry.getValue() == check.getValue() - 2))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
        if (((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey() + 2) && (entry.getValue() == check.getValue() - 1)) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue() + 1)) || ((entry.getKey() == check.getKey() - 2) && (entry.getValue() == check.getValue() - 1))) {
          count++;
          if (count%2 == 0) {
            corner.remove(entry.getKey(), entry.getValue());
            println(entry.getKey() + "   " + check.getKey());
            count = 0;
          }
        }
      }
    }




    //println(corner);





    //if (((colored == 3 || colored == 4) && (black == 4)) || ((colored == 4|| colored == 5) && (black == 3 || black ==  4)) || 
    //  ((colored == 1 || colored == 2 || colored == 3) && (black == 5 || black == 6 || black == 7))) {
    //  (( ) && ( ))

    return corner;
  }



  String toString() {
    for (pix p : adjList.keySet()) {
      println(p.getColor());
    }

    return "";
  }
}
