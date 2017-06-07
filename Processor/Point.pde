class Point {
  float x;
  float y;
  float dy;

  Point(float newX, float newY, float newDy) {
    x = newX;
    y = newY;
    dy = newDy;
  }

  void pointMove() {
    y += dy;
  }
}