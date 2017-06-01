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
    aDelay = (int)random(100);
    aDelay++;
    if (aDelay % 50 == 0) {
      //enemyAmmo.add(new Ammo(x,y,0,3));
      threeShot();
    }
  }

  void threeShot() {
    enemyAmmo.add(new Ammo(x, y, (currX - x)*0.01, (currY - y)*0.01));
  }

  void circle() {
  }

  int[] simplify(int y, int x) {
    int[] ret = new int[2];
    int newY = y;
    int newX = x;
    while (newY != newX) {
      if (newY > newX)
        newY = newY - newX;
      else 
      newX = newX - newY;
    }
    ret[0] = y / newY;
    ret[1] = x / newY;
    
    return ret;
  }
  int a = simplify(24,9)[0];
  int b = simplify(24,9)[1];
  println( a + " " + b);

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