import java.util.Scanner;
import static java.lang.System.*;
String fresh[]; //completely parsed string
String[] line; // intial string array that uses loadStings()
float inter[] = new float[150]; //holds random text size values
PFont f;
float  h; // y location for the scrolling text
int index = 0; // used as "i" for the draw loop, similar to for-loops
String finalS; // used to determine the length of inter[]
String numW;
String numV;
String numSy;
String numSe;
String rE;
String gL;
void setup() {
  size(900, 800);
  f = createFont("Arial", 20, true);
  h = height;

  //loads text for the Parser
  //line = loadStrings("accStory.dat"); 
  line = loadStrings("C:/Users/will/Desktop/Ament.W-master/syllables/data/accStory.dat");
  String para = join(line, " ");
  fresh = splitTokens(para, ",?!: ;/\"");
  printArray(fresh);
  StringParser p = new StringParser(fresh);
  // assign each string the corresponding value
  numW = "Number of Words: " +nf(p.countWords());
  numV = "\nNumber of Vowels: " +nf(p.countVowels()); 
  numSy = "\nNumber of Syllables: " + nf(p.countSyllables());
  numSe = "\nNumber of Sentences: " + nf(p.countSentences()); 
  rE = "\nReading Ease Value: " + nf(p.readEase());
  gL = "\nGrade Level: " + nf(p.gradeLevel());
  finalS = numW + numV + numSy + numSe + rE + gL;
  // load the inital random values, if this doesn't happen,
  // then the for-loops in the draw method will throw a nullPointer
  for (int i = 0; i < finalS.length()-1; i++) {
    inter[i] = random(16, 30);
  }
}
void draw() {
  background(0);
  fill(255);
  //scrolling text setup
  textFont(f, 20);
  textAlign(LEFT);
  textLeading(50);
  text(line[index], 50, h, 400, 200);
  h -=5;
  float w = textWidth(line[index]);
  if ( h < -w) {
    h = height;
    index = (index +1 )% line.length;
  }
  //framecounter for the thread
  if (frameCount % 60 == 0) {
    thread("pass");
  }
  // each for-loop prints each string on the screen
  // with different text sizes for each letter
  int x = 505;
  for (int i = 0; i < numW.length(); i++) {
    textSize(inter[i]);
    text(numW.charAt(i), x, 200);
    // textWidth() spaces the characters out properly.
    x += textWidth(numW.charAt(i));
  }
  x = 500; // w/out this the text will be written offscreen
  for (int i = 0; i < numV.length(); i++) {
    textSize(inter[i]);
    text(numV.charAt(i), x, 250);
    // textWidth() spaces the characters out properly.
    x += textWidth(numV.charAt(i));
  }
  x = 500;
  for (int i = 0; i < numSy.length(); i++) {
    textSize(inter[i]);
    text(numSy.charAt(i), x, 300);
    // textWidth() spaces the characters out properly.
    x += textWidth(numSy.charAt(i));
  }
  x = 500;
  for (int i = 0; i < numSe.length(); i++) {
    textSize(inter[i]);
    text(numSe.charAt(i), x, 350);
    // textWidth() spaces the characters out properly.
    x += textWidth(numSe.charAt(i));
  }
  x = 500;
  for (int i = 0; i < rE.length(); i++) {
    textSize(inter[i]);
    text(rE.charAt(i), x, 400);
    // textWidth() spaces the characters out properly.
    x += textWidth(rE.charAt(i));
  }

  x = 500;
  for (int i = 0; i < gL.length(); i++) {
    textSize(inter[i]);
    text(gL.charAt(i), x, 450);
    // textWidth() spaces the characters out properly.
    x += textWidth(gL.charAt(i));
  }
}
// a method that could be called with pass(), but when using
// threads you can use the thread() method to run the code in
// the pass() method without slowing down the main thread, aka aniamtion thread.
// Threads are super powerful because you can process information
// without impacting the framerate
void pass() { 
  for (int i = 0; i < finalS.length(); i++) {
    inter[i] = random(12, 36);
  }
}
