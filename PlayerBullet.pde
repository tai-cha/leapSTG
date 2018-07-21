class PlayerBullet {

  float xpos, ypos;

  PlayerBullet(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void show() {
    stroke(255);
    strokeWeight(4);
    if (ypos>=10) {
      line(xpos-7, ypos-10, xpos-7, ypos+10);
      line(xpos+7, ypos-10, xpos+7, ypos+10);
      ypos-=5;
    }
  }
}
