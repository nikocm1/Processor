class Ammo {
  
  PVector position;
  PVector velocity;
  int size;
  
  //constructor
  Ammo(float x, float y , float dx , float dy) {
    size = 5;
    position= new PVector(x, y);
    velocity= new PVector (dx, dy);
  }
  
  void move() {
    position.add(velocity); 
  }
  
  void display() {
    fill(color((int)random(1000), (int)random(1000), (int)random(1000)));
    ellipse(position.x, position.y, size, size*4);
    
  }
  void update() {
    move();
    display();
  }  
}