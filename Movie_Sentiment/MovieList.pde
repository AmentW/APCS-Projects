import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.ListIterator;

class MovieList {
  ArrayList <Movie> movieList;
  String[] commonWord;
  public int count;
  public int avgCount = 0;
  public int place;
  public int sum = 0;
  public int whichLoad;
  public String[] scroll;
  public int[] sLength;
  public MovieList() {
    movieList = new ArrayList <Movie> ();
  }

  public void loadMovies(String s, int w, String seek, int l) {
    Scanner scan=new Scanner(s);
    int num = scan.nextInt(); //rating 
    String str = scan.nextLine(); //review
    String find = seek; //keyword
    int limit = l; //review length
    whichLoad = w; //loadtype
    if (whichLoad == 0) {
      movieList.add(new Movie(num, str));
      count++;
      scroll = new String [count];
      sLength = new int [count];
    }
    if (whichLoad == 1) {
      if (str.contains(find)) {
        movieList.add(new Movie(num, str));
        count++;
        scroll = new String [count];
        sLength = new int [count];
      }
    }
    if (whichLoad == 2) {
      if (str.length() > limit) {
        movieList.add(new Movie(num, str));
        count++;
        scroll = new String [count];
        sLength = new int [count];
      }
    }
    scan.close();
  }

  public int getAvgScore() {
    for ( Movie mo : movieList) {
      sum += mo.getRate();
      avgCount++;
    }
    if (avgCount == 0) {
      return 5;
    }
    return sum/avgCount;
  }

  public void sortMoviesByRating() {
    Collections.sort(movieList);
  }

  public String overallComment() {
    if (getAvgScore() == 4) {
      return "Survey Saysss: This movie is AMAZING!";
    } else if (getAvgScore() == 3) {
      return "Survey Saysss: This movie is great.";
    } else if (getAvgScore() == 2) {
      return "Survey Saysss: This movie is okay.";
    } else if (getAvgScore() == 1) {
      return "Survey Saysss: This movie is meh.";
    } 
    return "Survey Saysss: This movie is HORRIBLE!";
  }

  public int getAvgLength() {
    int leng = 0;
    for (Movie mo : movieList) {
      leng+= mo.getRev().length();
    }
    return leng/count;
  }

  void prelim() { //preliminary data processing for scrolling text
    int index = 0;
    for (Movie mo : movieList) {
      scroll[index] = nf(mo.getRate()) +" "+ mo.getRev(); //creates a new string array with the rating and review in the same string
      sLength[index] = scroll[index].length(); //an array that stores the each strings length
      index++;
    }
  }

  public String transcript(int p) { //selects the review based on the designated position
    String end = "";
    place = p;
    if (place < scroll.length ) {
      end = scroll[place];
    }
    return end;
  }

  public int getArrayLength() { 
    return scroll.length;
  }

  public int getStringLength(int p) {
    if (p < scroll.length) {
      return sLength[p];
    }
    return 1;
  }

  public String toString() {
    if (whichLoad == 0) {
      return "\nNumber of Movies: " +count+ "\nAverage Rating: " +getAvgScore()+ "\n" +overallComment();
    }
    if (whichLoad == 1) {
      if (getAvgScore() == 5) {
        return "\nThere are no movie reviews containing your keyword.";
      }
      return "\nCount: " +count+ "\nAverage Rating: " +getAvgScore()+ "\n" +overallComment();
    }
    if (whichLoad == 2) {
      return "\nCount: " +count+ "\nAverage Rating: " +getAvgScore()+ 
        "\nAverage Length: " +getAvgLength()+"\n" +overallComment();
    }
    return "";
  }
}
