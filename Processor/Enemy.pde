float x; // x-coordinate
float y; // y-coordinate
float dx; // x velocity
float dy; // y velocity
int HP;

void Enermy(float newX, float newY, int newHP){
  x = newX;
  y = newY;
  HP = newHP;
}

void enemyShoot(){
  //use image of bullet
  
}

boolean enemyIsAlive(){
  return HP > 0;
}

void enemyMove(){ 
  // moving from left to right
  x += dx;
  y += dy;
}