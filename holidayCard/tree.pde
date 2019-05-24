class tree {
  int r, g, b;
  int a = 0;
  int timer = 0;
  float rColor;
  void show() {
    noStroke();
    fill(0);
    rect(715, 450, 70, 70);
    fill(50, 255, 50);

    triangle(750, 100, 670, 230, 830, 230);
    triangle(750, 150, 630, 300, 870, 300);
    triangle(750, 200, 600, 380, 900, 380);
    triangle(750, 200, 580, 450, 920, 450);

    fill(255, 0, 0);
    rect(520, 430, 60, 60);
    fill(0);
    rect(545, 430, 10, 60);
    rect(520, 455, 60, 10);

    fill(255, 50, 255);
    rect(920, 430, 60, 60);
    fill(0);
    rect(945, 430, 10, 60);
    rect(920, 455, 60, 10);

    fill(50, 50, 255);
    rect(840, 460, 60, 60);
    fill(0);
    rect(865, 460, 10, 60);
    rect(840, 485, 60, 10);

    fill(50, 75, 50);
  }
}
