import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.Collections;
import static java.lang.System.*;
Scanner file;
MovieList ml=new MovieList();
int type; //type of load
String word = ""; //change the word being sought after
int leng; // change the length of the comment being sought after
String s = ""; //keystroke holder
String mess = ""; //movieList's toString return
int pos = -1;
float x;
Boolean test = false; 
Boolean next = false;
void setup() {
  size(800, 400);
  x = width;
  try { 
    //String fileName = "Desktop/Will Ament ACS 18-19/Movie_Sentiment/data/movieReviews.txt";
    String fileName = "C:/Users/will/Desktop/Ament.W-master/Movie_Sentiment/data/movieReviews.txt";
    file = new Scanner(new File(fileName));
  }
  catch(FileNotFoundException e) {
    println("---THROW---\n" +e);
    println("\n---Details---\n" +e.getMessage());
  }
  finally {
  }
}
void draw() {
  background(0);
  if (test) { //to make sure the message isn't written over by the background
    textSize(16);
    fill(255);
    text(mess, 455, 110); // toString from movieList
    if (next) { //check for starting the scrolling text
      textSize(16);
      text(ml.transcript(pos), x, 275);
      text(ml.transcript(pos + 1), x, 300);
      text(ml.transcript(pos + 2), x, 325);
      text(ml.transcript(pos + 3), x, 350);
      text(ml.transcript(pos + 4), x, 375);
      x = x - 1.5; //scrolling speed

      float w = textWidth(ml.transcript(pos));
      if (x < -w) {
        x = width; 
        pos = (pos + 5) % ml.getStringLength(pos);
      }
    }
  }

  //heading
  textSize(54);
  fill(255);
  text("Movie Sentiment", 20, 50);
  textSize(24);
  fill(255);
  text("You can search through this database of \nMovie Reviews using the keyboard", 20, 95);
  textSize(24);
  //text("You can use the keyboard to filter reviews \nby keyword or comment length", 20, 140);
  text("Keyword or length: " +s, 20, 170);

  //details
  textSize(16);
  fill(255);
  text("Ratings are on a scale of 0-4 (4 is the best)", 20, 245);

  //button 1
  textSize(14);
  fill(255);
  text("Load All", 20, 215);
  fill(200, 20, 20);
  rect(85, 200, 20, 20);

  //button 2
  textSize(14);
  fill(255);
  text("Word Search", 120, 215);
  fill(20, 200, 20);
  rect(210, 200, 20, 20);

  //button 3
  textSize(14);
  fill(255);
  text("Quality Comments", 240, 215);
  fill(20, 20, 200);
  rect(370, 200, 20, 20);

  //transcript button 
  fill(255);
  rect(470, 10, 50, 50);
  textSize(14);
  fill(0);
  text("Print", 480, 40);
} 
void mouseClicked() { //mouseclick is detected automatically in the draw() loop
  typeSet();
}
void typeSet() { //determines which button is being pressed aka which load is being used
  //normal load
  if ((mouseX < 105 && mouseX > 85)&&(mouseY < 220 && mouseY > 200)) {
    type = 0;
    while (file.hasNext()) {
      ml.loadMovies(file.nextLine(), type, "", 0);
    }
    ml.sortMoviesByRating();
    ml.overallComment();
    //handling the toString return
    println(ml);
    test = true;
    mess = ml.toString();
  }
  //word load
  if ((mouseX < 230 && mouseX > 210)&&(mouseY < 220 && mouseY > 200)) {
    type = 1;
    word=s;
    while (file.hasNext()) {
      ml.loadMovies(file.nextLine(), type, word, 0);
    }
    ml.sortMoviesByRating();
    ml.overallComment();
    //handling the toString return
    println(ml);
    test = true;
    mess = ml.toString();
  }
  //quality load //finds all reviews greater than the specififed number
  if ((mouseX < 390 && mouseX > 370)&&(mouseY < 220 && mouseY > 200)) {
    type = 2;
    leng = Integer.parseInt(s); //since the keystroke holder is a string, it must be parsed into an int
    while (file.hasNext()) {
      ml.loadMovies(file.nextLine(), type, "", leng);
    }
    ml.sortMoviesByRating();
    ml.overallComment();
    //handling the toString return
    println(ml);
    test = true;
    mess = ml.toString();
  }
  //transcript //starts the scrolling text
  if ((mouseX < 520 && mouseX > 470)&&(mouseY < 60 && mouseY > 10)) {
    textSize(20);
    fill(255);
    ml.prelim();
    next = true;
    if (pos < ml.getArrayLength() - 1) {
      pos = pos + 1;
    }
  }
}
void keyTyped() {
  // int(key) is the identifier for what value a key has on the keyboard. processing API has an example
  if ( int(key) != 8) { //8 is the value for the delete key
    s+=key;
  } else if (s.length() > 0) {
    s = s.substring(0, s.length()-1); //"deletes" the last character
  }
}
