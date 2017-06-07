class Power {
  float x;
  float y;
  float dy;

  Power(float newX, float newY, float newDy) {
    x = newX;
    y = newY;
    dy = newDy;
  }

  void powerMove() {
    y += dy;
  }
}