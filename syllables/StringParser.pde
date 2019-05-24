String vowels = "a e i o u y";
String []v=vowels.split(" ");
char c[] = vowels.toCharArray();
String alpha = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ";
String a[] = alpha.split(" ");
char ca[] = alpha.toCharArray();
String para = "";
String []sArray;
int i;
public class StringParser {
  String line;
  public StringParser() {
  }
  public StringParser(String [] s) {
    sArray=s;
  }
  public float countWords() {
    float count = 0;
    for (i = 0; i < fresh.length; i++) {
      count ++;
    }
    return count;
  }
  public float countVowels() {
    float count = 0;
    for ( String c : fresh) {
      for (int i = 0; i < c.length(); i++ ) {
        if ( c.charAt(i) == 'a' || c.charAt(i) == 'e' || c.charAt(i) == 'i' || c.charAt(i) == 'o' || c.charAt(i) == 'u' || c.charAt(i) == 'y') {
          count ++;
        }
      }
    }
    return count;
  }
  private int countSyllables() {
    int count = 0;
    boolean newSyll = true;
    for (String s : sArray) {
      char[] wordArray = s.toCharArray();
      for (int i = 0; i < wordArray.length; i++) {
        if (i == wordArray.length-1 && wordArray[i] == 'e' && newSyll && count > 0) {
          count--;
        } 
        if (newSyll && vowels.indexOf(wordArray[i]) >= 0) {
          newSyll = false;
          count++;
        } else if (vowels.indexOf(wordArray[i]) < 0) {
          newSyll = true;
        }
      }
    }
    return count;
  }
  public float countSentences() {
    float count = 0;
    for (int i = 0; i < fresh.length; i++) {
      if (fresh[i].endsWith(".")) {
        count++;
      }
    }
    return count;
  }
  public float readEase() {
    return 206.835 - (1.015 * ((float)countWords() / (float)countSentences())) - (84.6 * ((float)countSyllables() / (float)countWords()));
  }
  public float gradeLevel() {
    return ((.39 * ((float)countWords() / (float)countSentences())) + (11.8 * ((float)countSyllables() / (float)countWords()))) - 15.59;
  }
  public String[] getA() {
    return a;
  }
}
