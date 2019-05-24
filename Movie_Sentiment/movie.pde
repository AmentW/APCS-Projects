

class Movie implements Comparable<Movie> {
  public int rating;
  public String review;

  public Movie (int i, String s) {
    rating = i;
    review = s;
  }

  public int compareTo(Movie m) {
    if (this.rating < m.rating) 
      return 1;
    if (this.rating > m.rating)
      return -1;
    return 0;
  }

  public int getRate() {
    return rating;
  }

  public String getRev() {
    return review;
  }

  public String toString() {
    return this.rating + " " + this.review;
  }
}
