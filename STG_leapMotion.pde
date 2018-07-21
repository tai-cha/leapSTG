import de.voidplus.leapmotion.*;

LeapMotion leap;
PVector handPosition;
float handTime =0;
float handGrab;

boolean gPushed = false;

Player player;
PlayerBullet[] pBullets;
int maxPBullets = 550;
int[] createdBulltetsNumber;
int createdBullets = 0;
int counter = 0;

void setup() {
  size(480, 480);
  background(0);
  noStroke();
  fill(255);
  leap = new LeapMotion(this);
  player = new Player();
  pBullets = new PlayerBullet[maxPBullets];
  createdBulltetsNumber = new int[5000];
}

void draw() {
  background(0);
  fill(#B7FF05);
  rect(0, 370, width, width-370);

  // ハンドトラッキング関連のコード

  for (Hand hand : leap.getHands ()) {
    handTime  = hand.getTimeVisible();
    handPosition = hand.getPosition();
    handGrab = hand.getGrabStrength();
  }
  if (handTime > 0) {
    if (handPosition.x >=0 && handPosition.x <= width && handPosition.y >=0 && handPosition.y <= height) {
      player.xpos = handPosition.x;

      if (handPosition.y <= 360) {
        player.ypos = handPosition.y;
      }
    }
    //    println("("+handPosition.x+" , "+ handPosition.y +")");
  }
  //  println("handGrab = "+handGrab);

  //弾生成用
  if (handGrab >= 0.88||gPushed) {
    if (counter % 10 == 0) {
      pBullets[createdBullets] = new PlayerBullet(player.xpos, player.ypos);
      createdBullets++;
      if (createdBullets >= maxPBullets - 50) {
        createdBullets = 0;
      }

      /*      for (int num : createdBulltetsNumber) {
       if (pBullets[num].ypos <= 10) {
       pBullets[num] = null;
       }
       } */
    }
  }

  //キー取得

  if (keyPressed) {
    switch (keyCode) {
      case UP:
        if(player.ypos >= 20) {
        player.ypos -= 3;
        }
        break;
        
      case DOWN:
        if (player.ypos <=360) {
        player.ypos += 3;
        }
        break;
      case LEFT:
        if(player.xpos >=30) {
          player.xpos -= 3;
        }
        break;
      case RIGHT:
        if (player.xpos <= width-30) {
          player.xpos+= 3;
        }
    }

    if (key == 'G'||key == 'g') {
      gPushed = !gPushed;
    }
  }

  for (int i=0; i<createdBullets; i++) {
    pBullets[i].show();
  }

  counter++;
  player.show();
}

void keyPressed() {
}
