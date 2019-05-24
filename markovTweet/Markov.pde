interface Markov {
  void trainMap(String [] s);
  String generateText(String s, int i, String [] t, int n);
}
