class Enemy {

  float x; // x-coordinate
  float y; // y-coordinate
  float dx; // x velocity
  float dy; // y velocity
  int HP;
  int aDelay;
  boolean spraying = false;
  boolean threshold = false;
  float diffX;
  float diffY;
  float deg;
  float degChange;
  int sprayTime = 0;

  Enemy(float newX, float newY, int xvel, int yvel, int newHP) {
    x = newX;
    y = newY;
    dx = xvel;
    dy = yvel;
    HP = newHP;
    aDelay = 0;
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

    if (HP < 100) {
      if (aDelay % 50 == 0) 
        enemyAmmo.add(new Ammo(x, y, 0, 3));
      if (aDelay % 100 == 0)
        threeShot();
    }
    if (HP >= 100) {
      if (aDelay % 10 == 0)
        threeShot();
      if (aDelay % 100 == 0)
        circle();

      if (!spraying && aDelay % 300 == 0) {
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
        println(degChange);
        enemyAmmo.add(new Ammo(x, y, 5 * cos(deg + degChange), 5 * sin(deg + degChange)));
        
        if (threshold){
          degChange += radians(5);
          println(degChange);}
        else{
          degChange -= radians(5);
          println(degChange);}
        if (degChange >= radians(30)) 
          threshold = false;
        else if (degChange <= radians(-30))
          threshold = true;
      }
    }
  }


  void threeShot() {
    float d = (dist(currX, currY, x, y));
    float step = 3 / d;

    enemyAmmo.add(new Ammo(x, y, diffX * step, diffY * step));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(deg + radians(20)), 3 * sin(deg + radians(20))));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(deg - radians(20)), 3 * sin(deg - radians(20))));
  }

  void circle() {
    int deg = 0;
    while (deg < 360) {
      enemyAmmo.add(new Ammo(x, y, 2 * cos(radians(deg)), 2 * sin(radians(deg))));
      deg += 10;
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

  void leftMove1() {
    dx += 5;
  }

  void leftMove2() {
    if (y >= height/2.0)
      dx -= 2;
  }

  void rightMove1() {
    dx -= 5;
  }

  void rightMove2() {
    if (y >= height/2.0)
      dx += 2;
    dy += 2;
  }
}