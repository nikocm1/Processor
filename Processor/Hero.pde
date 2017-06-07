boolean keyz[] = new boolean [4];



class Hero {
  int HP;
  float xcor;
  float ycor;
  int aDelay;
  int point;
  int power;

  //needs HP, power, point
  Hero() {
    HP = 5;
    xcor = width/2;
    ycor = height * .9;
    aDelay = 0;
  }

  void shoot() {
    //use image of bullet
    aDelay++;
    if (aDelay % 7 == 0) {

      //1 stream
      if (stream == 1)
        ammo.add(new Ammo(xcor, ycor, 0, -10));

      //2 streams
      if (stream == 2) {
        ammo.add(new Ammo(xcor + 5, ycor, 0, -10));
        ammo.add(new Ammo(xcor - 5, ycor, 0, -10));
      }

      //3 streams
      if (stream == 3) {
        ammo.add(new Ammo(xcor, ycor, 0, -10));
        ammo.add(new Ammo(xcor - 10, ycor, 0, -10));
        ammo.add(new Ammo(xcor + 10, ycor, 0, -10));
      }

      //4 streams
      if (stream == 4) {
        ammo.add(new Ammo(xcor + 5, ycor, 0, -15));
        ammo.add(new Ammo(xcor - 5, ycor, 0, -15));
        ammo.add(new Ammo(xcor - 15, ycor, 0, -15));
        ammo.add(new Ammo(xcor + 15, ycor, 0, -15));
      }
    }
  }//end shoot

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
  }//end move
}//end class