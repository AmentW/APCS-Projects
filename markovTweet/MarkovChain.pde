import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;

class MarkovChain implements Markov {
  List <String> wordList;
  Map <String, ArrayList<String>> markMap;
  Set <String> newWords; 
  boolean repeat = true;
  boolean firstTime = true;
  String selected;
  String use;
  int c1 = 1;
  int c2 = 1;
  int c3 = 1;
  public MarkovChain() {
    wordList = new ArrayList<String>();
    newWords = new HashSet<String>(5);
    markMap = new HashMap <String, ArrayList<String>> ();
  }

  public void MarkovChain(String s) {
    //delimit each tweet
  }

  void trainMap(String [] str) {

    for (int s = 0; s<str.length-1; s++) {
      if (markMap.get(str[s]) == null) {
        markMap.put(str[s], new ArrayList<String>());
      }
      markMap.get(str[s]).add(str[s+1]);
    }
  }



  String generateText(String str, int i, String [] t, int n) {
    String done = "";
    int filler = n;
    for (int k = 0; k<i; k++) {

      if (firstTime == true) {
        firstTime = false;
        use = str;
      } else if (k % filler == 0) {
        use = t[k];
      } else {
        use = noRep(use);
      }

      if (markMap.containsKey(use) && firstTime == false ) {
        //println("hit - gT "+c1+ " times");
        c1++;
        //println("choices " + markMap.get(use));
        done += use+ " ";
        //println("looping");
      }
    }
    
    println("pass");
    return done;
  }

  int getRandomWord(String s) {
    //println("hit - gRW "+c2+ " times");
    c2++;
    int randomIndex=(int)random(0, markMap.get(s).size());
    return randomIndex;
  }

  String noRep(String s) {


    selected = markMap.get(s).get(getRandomWord(s));
    String prev = selected;
    if (newWords.contains(selected) == false) {
      if (newWords.size() < 5) {
        newWords.add(selected);
      } else {
        newWords.remove(4);
        newWords.add(selected);
      }
      //print("new   ");
      //println("1st selected " + selected);
    } else {
      selected = markMap.get(s).get(getRandomWord(s));
      //print("was repeat   ");
      //println("2nd selected " + selected);
    }


    //println("nR " +c3+ " times");
    c3++;

    return selected;
  }

  float accuracy(String str, String[] t) {
    String tweet = "";
    String [] generated = str.split(" ");
    int i = 0;
    int count = 0;
    for (i = 0; i< t.length-1; i++) {
      if (t[i] == generated[i]) {
        count++;
      }
      tweet += t[i] + " ";
    }
    //println("!" +tweet);
    float percent = count/i;
    return percent;
  }

  void printMap() {
    println(markMap);
  }

  void printMapExact(String s) {
    println(markMap.get(s));
  }
}
