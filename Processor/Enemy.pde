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
    }
  }


  void threeShot() {
    float d = (dist(currX, currY, x, y));
    float step = 3 / d;
    float diffX = currX - x;
    float diffY = currY - y;
    float degree = atan(diffY / diffX);
    if (currX < x)
      degree = PI + degree;

    enemyAmmo.add(new Ammo(x, y, diffX * step, diffY * step));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(degree + radians(20)), 3 * sin(degree + radians(20))));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(degree - radians(20)), 3 * sin(degree - radians(20))));
  }

  void circle() {
    int deg = 0;
    while (deg < 360) {
      enemyAmmo.add(new Ammo(x, y, 3 * cos(radians(deg)), 3 * sin(radians(deg))));
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