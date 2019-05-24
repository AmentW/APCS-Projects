import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;
Scanner file;
MarkovChain mc = new MarkovChain();
String [] str, gen, fakeArr, chosenTweet, cleanText;
String allText;
String tweet, fakeTweet, real = "", fake = "", realOut = "", fakeOut = "";
String firstWord;
int tweetLength;
int i = 0;
int track = 0;
boolean go = true;
float same = 0, total = 0, runSame = 0, runTotal = 0;
float rateR = 0, rateG = 0, rateB = 0;
float R = random(55, 200), G = random(55, 200), B = random(55, 200);
boolean red = true, green = true, blue = true;
void setup() {
  size(1100, 420);

  frameRate = 60;
  try { 
    file = new Scanner(new File("Desktop/Will Ament ACS 18-19/Map Labs/data/trump.txt"));
    str=loadStrings("Desktop/Will Ament ACS 18-19/Map Labs/data/trump.txt");
    allText=join(str, " ");
    genHandler();
    core();
  }

  catch(Exception e) {
    println("---THROW---\n" +e);
    println("\n---Details---\n" +e.getMessage());
  }
}

void draw() {
  background(0);
  fill(255);
  textSize(64);
  textAlign(CENTER);
  rateR = random(.5, 2);
  rateG = random(.5, 2);
  rateB = random(.5, 2);
  randC();
  fill(R, G, B);
  text("Fake Tweets using Markov Chains", 550, 80);
  textSize(8);
  textAlign(LEFT);
  text("William Ament '19", 7, 12);
  if (track == tweetLength) {
    same = 0;
    total = 0;
    track = 0;
    realOut = "";
    fakeOut = "";
    core();
  }
  if (frameCount % 60 == 0 && track < tweetLength) {
    go = false;
    real = chosenTweet[track];
    fake = fakeArr[track];
    realOut += real + " ";
    fakeOut += fake + " ";
    track++;
    total++;
    runTotal++;
  }
  //println(mouseX);
  //println(mouseY);

  if (real.equals(fake)) {
    fill(50, 200, 50);
    if (frameCount % 60 == 0) {
      same++;
      runSame++;
    }
  } else {
    fill(200, 50, 50);
  }
  rect(850, 220, 30, 30);

  textSize(32);
  textAlign(RIGHT);
  fill(165, 250, 245);
  text(realOut, 900, 145);
  fill(250, 165, 190);
  text(fakeOut, 900, 190);

  textAlign(LEFT);
  textSize(16);
  fill(165, 250, 245);
  text("Real Tweet", 930, 140);
  fill(250, 165, 190);
  text("Fake Tweet", 930, 185);



  textSize(21);
  fill(255);
  String a = "This program uses 200+ real tweets from Donald Trump's twitter page!";
  String b = "The objective is to generate a fake tweet that mimics the real tweet.";
  String c = "It does so by choosing a new word that follows the previous word";
  String d = "based on probabilities complied from the real tweets.";
  text(a, 10, 280);
  text(b, 10, 310);
  text(c, 10, 340);
  text(d, 10, 370);

  textSize(14);
  text("Adjusted = every 3 words will always be a match", 750, 405);

  textSize(18);
  fill(50, 200, 50);
  text("Word Matches: " + (int)same, 680, 240);
  fill(255);
  text("Total Words: " + (int)total, 900, 240);
  float raw = total * 1.3;
  float runRaw = runTotal * 1.3;

  if (go == false) {
    textSize(21);
    textAlign(RIGHT);
    fill(255, 140, 10);
    text("Accuracy (Adjusted): " + round((same/total)*100) + "%", 1070, 280);
    text("Overall Accuracy (Adjusted): " + round((runSame/runTotal)*100) + "%", 1070, 340);
    fill(1, 255, 155);
    text("Accuracy (Raw): " + round((same/raw)*100) + "%", 1070, 310);
    text("Overall Accuracy (Raw): " + round((runSame/runRaw)*100) + "%", 1070, 370);
  }
}

void core() {
  sampleHandler();
  fakeTweet = mc.generateText(firstWord, tweetLength, chosenTweet, 3);
  fakeArr = fakeTweet.split(" ");
  println("hit");
  println(tweetLength);
  println(fakeArr[0]);
}

void genHandler() {
  gen = allText.split(" ");
  for (String s : gen) {
    if (s.contains("@")) {
      int loc = i;
      String tag = s;
      tag = "@ " + tag.substring(1);
      gen[loc] = tag;
    }
    i++;
  }
  allText = join(gen, " ");
  cleanText=allText.replaceAll("[^a-zA-Z@',.!?# ]", "").toLowerCase().split("\\s+");
  mc.trainMap(cleanText);
}

void sampleHandler() {
  tweet = str[(int)random(0, str.length)];
  chosenTweet = tweet.replaceAll("[^a-zA-Z@',.!?# ]", "").toLowerCase().split("\\s+");
  firstWord = chosenTweet[0];

  tweetLength = chosenTweet.length-1;
}
void randC() {
  //--------------------Red-----------------------//
  if (red == true) {
    R+=rateR; 
    if ( R > 240) {
      red = false;
    }
  } 
  if (red == false) {
    R-=rateR;
    if ( R < 60) {
      red = true;
    }
  }
  //--------------------Green-----------------------//
  if (green == true) {
    G+=rateG;
    if ( G > 200) {
      green = false;
    }
  } 
  if (green == false) {
    G-=rateG;
    if ( G < 20) {
      green = true;
    }
  }
  //--------------------Blue-----------------------//
  if (blue == true) {
    B+=rateB;
    if ( B > 180) {
      blue = false;
    }
  } 
  if (blue == false) {
    B-=rateB;
    if ( B < 70) {
      blue = true;
    }
  }
}
