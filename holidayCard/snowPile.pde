class snowPile 
{
  float sizeX = 60;
  float sizeY = 100;
  snowPile() {
    
  }
  void accum() {
    
    noStroke();
    fill(255);
    arc(200, 680, sizeX, sizeY, PI, TWO_PI);
    arc(500, 680, sizeX, sizeY, PI, TWO_PI);
    arc(900, 680, sizeX, sizeY, PI, TWO_PI);
    sizeX += .6;
    sizeY += .2;
  }
  
  
  
}
