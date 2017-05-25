class Enemy {

  float x; // x-coordinate
  float y; // y-coordinate
  float dx; // x velocity
  float dy; // y velocity
  int HP;

  Enemy(float newX, float newY, int xvel, int yvel , int newHP) {
    x = newX;
    y = newY;
    dx = xvel;
    dy = yvel;
    HP = newHP;
  }

  void enemyShoot() {
    //use image of bullet
  }

  boolean enemyIsAlive() {
    return HP > 0;
  }

  void enemyMove() { 
    // moving from left to right
    x += dx;
    y += dy;
  }
  
  void leftMove1(){
    dx += 2;
    dy += 2;
  }
  
  void leftMove2(){
    if (y >= height/2.0)
      dx -= 2;
    dy += 2;
  }
  
  void rightMove1(){
    dx -= 2;
    dy += 2;
  }
  
  void rightMove2(){
    if (y >= height/2.0)
      dx += 2;
    dy += 2;
  }
}