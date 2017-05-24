class Ammo {
  
  PVector position;
  PVector velocity;
  int size;
  
  //constructor
  Ammo(int x, int y , int dx , int dy) {
    size = 5;
    position= new PVector(x, y);
    velocity= new PVector (dx, dy);
  }
  
  void move() {
    position.add(velocity); 
  }
  
  void display() {
    fill(color(0, 225, 0));
    ellipse(position.x, position.y, size, size*4);
    
  }
  void update() {
    move();
    display();
  }  
}