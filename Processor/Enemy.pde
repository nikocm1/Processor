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
}