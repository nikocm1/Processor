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
<<<<<<< HEAD
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
=======
    if (aDelay % 10 == 0) {
      //enemyAmmo.add(new Ammo(x,y,0,3));
      shootAngle(heroXRadian(), heroYRadian());
>>>>>>> 404c81540c54ff389bd370a913bc8b5ef93f8de3
    }
  }

  void threeShot() {
    float d = (dist(currX, currY, x, y));
    float step = 3 / d;
<<<<<<< HEAD
    //float d2 = d / cos(radians(10));
    //float step2 = 3 / d2;
    float diffX = currX - x;
    float diffY = currY - y;
    float degree = atan(diffY / diffX);
    if (currX < x)
      degree = PI + degree;

    enemyAmmo.add(new Ammo(x, y, diffX * step, diffY * step));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(degree + radians(20)), 3 * sin(degree + radians(20))));
    enemyAmmo.add(new Ammo(x, y, 3 * cos(degree - radians(20)), 3 * sin(degree - radians(20))));
=======
    float d2 = d / cos(30);
    //float step2 = 15 / d2;
    float a = sin(30) / d;
    float b = a / tan(75);
    float x1 = currX + a;
    float y1 = currY + b;

    //enemyAmmo.add(new Ammo(x, y, (currX - x) * step, (currY - y) * step));
    enemyAmmo.add(new Ammo(x, y, (x1 - x) * step, (y1 - y) * step));
    // enemyAmmo.add(new Ammo(x, y, (currX - x) * step2, (currY - y) * step2));
  }

  void shootAngle(float xR, float yR) {
    float d = dist(currX, currY, x, y);
    float x1 = cos(xR);
    float y1 = sin(yR);
    enemyAmmo.add(new Ammo(x, y, (x1 - x) * 3, (y1 - y) * 3));
>>>>>>> 404c81540c54ff389bd370a913bc8b5ef93f8de3
  }

  void circle() {
    int deg = 0;
    while (deg < 360) {
      enemyAmmo.add(new Ammo(x, y, 3 * cos(radians(deg)), 3 * sin(radians(deg))));
      deg += 10;
    }
  }
  
  float heroXRadian(){
   float d = dist(currX, currY, x, y);
   return acos( (currX - x) / d );
  }
  
  float heroYRadian(){
   float d = dist(currX, currY, x, y);
   return asin( (currY - y) / d );
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