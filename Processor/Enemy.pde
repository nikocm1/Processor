class Enemy {

  float x; // x-coordinate
  float y; // y-coordinate
  float dx; // x velocity
  float dy; // y velocity
  int HP;
  int initHP;
  int aDelay;
  boolean spraying = false;
  boolean threshold = false;
  boolean spiraling = false;
  float diffX;
  float diffY;
  float deg;
  float degChange;
  float spiralDeg;
  float currDeg;
  int sprayTime = 0;
  int type;

  Enemy(float newX, float newY, int xvel, int yvel, int newHP, int etype) {
    x = newX;
    y = newY;
    dx = xvel;
    dy = yvel;
    HP = newHP;
    initHP = newHP;
    aDelay = 0;
    type = etype;
    currDeg = radians(90);
  }

  void enemyShoot() {
    //use image of bullet
    //(int)random(100);
    aDelay++;

    diffX = 0;
    diffY = 0;
    diffX = currX - x;
    diffY = currY - y;
    deg = atan(diffY / diffX);
    if (currX < x)
      deg = PI + deg;

    if (type < 100) {
      if (type == 1 && aDelay % 100 == 0) 
        enemyAmmo.add(new Ammo(x, y, 0, 3));
      if (type == 2 && aDelay % 200 == 0)
        threeShot(deg);
      if (type == 3 && aDelay % 200 == 0)
        circle(30);
    }
    if (type >= 100) {
      if (aDelay % 100 <= 50) {
        if (aDelay % 100 == 0)
          currDeg = deg;
        if (aDelay % 10 == 0)
          threeShot(currDeg);
      }
      if (type >= 200 && aDelay % 150 == 0)
        circle(10);

      if (type >= 300 && aDelay % 400 == 0 && !spiraling) {
        spiraling = true;
        spiralDeg = 0;
      }
      if (spiraling && spiralDeg >= 720){
        spiraling = false;
        spiralDeg = 0;
      }
      if (spiraling && aDelay % 5 == 0) {
        enemyAmmo.add(new Ammo(x, y, 2.5 * cos(radians(spiralDeg)), 2.5 * sin(radians(spiralDeg))));
        spiralDeg += 20;
      }

      if (type >= 500 && !spraying && aDelay % 300 == 0) {
        spraying = true;
        threshold = true;
        degChange = 0;
      }
      if (spraying && sprayTime >= 30) {
        spraying = false;
        sprayTime = 0;
      }
      if (spraying && aDelay % 5 == 0) {
        sprayTime ++;
        //println(degChange);
        enemyAmmo.add(new Ammo(x, y, 5 * cos(deg + degChange), 5 * sin(deg + degChange)));

        if (threshold) {
          degChange += radians(5);
          //println(degChange);
        } else {
          degChange -= radians(5);
          //println(degChange);
        }
        if (degChange >= radians(30)) 
          threshold = false;
        else if (degChange <= radians(-30))
          threshold = true;
      }
    }
  }


  void threeShot(float currDeg) {
    enemyAmmo.add(new Ammo(x, y, 3 * cos(currDeg), 3 * sin(currDeg)));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(currDeg + radians(20)), 3 * sin(currDeg + radians(20))));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(currDeg - radians(20)), 3 * sin(currDeg - radians(20))));
  }

  void circle(int degrees) {
    int deg = 0;
    while (deg < 360) {
      enemyAmmo.add(new Ammo(x, y, 2 * cos(radians(deg)), 2 * sin(radians(deg))));
      deg += degrees;
    }
  }

  boolean enemyIsAlive() {
    return HP > 0;
  }

  void enemyMove() { 
    // moving from left to right
    x += dx;
    y += dy;
    //dx = (int)(random(10) - 5);
  }
}