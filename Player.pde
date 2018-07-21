class Player {

  float xpos, ypos;
  int life;
  boolean visible;
  
  Player() {
    this.xpos = width/2;
    this.ypos = height-130;
  }

  void show () {
    noStroke();
    fill(255);
    rect(xpos-10, ypos-20, 20, 30);
    rect(xpos-30, ypos,60,20);
  }
}
