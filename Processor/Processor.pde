Hero bob;
void setup(){
   size(700,800); 
   background(0);
   bob = new Hero();
}

void draw(){
  background(1100);
   ellipse(bob.xcor,bob.ycor,20,20);
   bob.move();
}