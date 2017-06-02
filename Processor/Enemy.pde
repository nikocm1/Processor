class Enemy {

  float x; // x-coordinate
  float y; // y-coordinate
  float dx; // x velocity
  float dy; // y velocity
  int HP;
  int aDelay;

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
    if (aDelay % 10 == 0) {
      //enemyAmmo.add(new Ammo(x,y,0,3));
      threeShot();
    }
  }

  void threeShot() {
    float d = (dist(currX, currY, x, y));
    float step = 3 / d;
    float d2 = d / cos(30);
    float step2 = 3 / d2;
    enemyAmmo.add(new Ammo(x, y, (currX - x) * step, (currY - y) * step));
    enemyAmmo.add(new Ammo(x, y, d2 * cos(30) * step2, d2 * sin(30) * step2));
   // enemyAmmo.add(new Ammo(x, y, (currX - x) * step2, (currY - y) * step2));
  }

  void circle() {
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