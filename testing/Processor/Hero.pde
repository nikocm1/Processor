boolean keyz[] = new boolean [4];



class Hero {
  int HP;
  int Mana;
  float xcor;
  float ycor;
  int aDelay;

  //needs HP, Mana
  Hero() {
    HP = 5;
    Mana = 0;
    xcor = width/2;
    ycor = height * .9;
    aDelay = 0;
  }

  void shoot() {
    //use image of bullet
    aDelay++;
    if (aDelay % 7 == 0) {

      //1 stream
      ammo.add(new Ammo(xcor, ycor, 0, -10));

      //3 streams
      if (stream >= 2) {
        ammo.add(new Ammo(xcor, ycor, -2, -10));
        ammo.add(new Ammo(xcor, ycor, 2, -10));
      }

      //5 streams
      if (stream >= 3) {
        ammo.add(new Ammo(xcor, ycor, -4, -10));
        ammo.add(new Ammo(xcor, ycor, 4, -10));
      }

      //7 streams
      if (stream >= 4) {
        ammo.add(new Ammo(xcor, ycor, -6, -10));
        ammo.add(new Ammo(xcor, ycor, 6, -10));
      }
    }
  }//end shoot


  void isAlive() {
  }



  void move() {


    if (keyz[0]  && xcor > 0) {
      xcor -= sensitivity;
    }
    if (keyz[2]  && (xcor < width)) {
      xcor += sensitivity;
    } 
    if (keyz[3]  && (ycor > 0)) {
      ycor -= sensitivity;
    } 
    if (keyz[1]  && (ycor < height)) {
      ycor += sensitivity;
    }
  }
}//end move