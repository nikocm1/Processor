Hero bob;
ArrayList<Enemy> enemies= new ArrayList<Enemy>();
ArrayList<Ammo> ammo= new ArrayList<Ammo>();
ArrayList<Ammo> enemyAmmo= new ArrayList<Ammo>();


void setup(){
   size(600,600); 
   background(0);
   bob = new Hero();
   makeEnemies();
   
}

  void draw(){
    background(1100);
    ellipse(bob.xcor,bob.ycor,20,20);
    bob.move();
    if(enemies.size() > 0){
      ellipse(enemies.get(0).x,enemies.get(0).y,10,10);
      enemies.get(0).enemyMove();
    }
    bob.shoot();
    for(Ammo a:ammo){
      a.update();
    }
    for(int i = 0; i < enemies.size(); i++){
       for(Ammo a:ammo){
        if( (abs(enemies.get(i).x - a.position.x)) < 10 && (abs(enemies.get(i).y - a.position.y)) < 10){
          enemies.remove(i);
        }        
        
       }
    }
  }



 void keyPressed() {
    if (key == 'a')  keyz[0] = true;
    if (key == 's')  keyz[1] = true;
    if (key == 'd')  keyz[2] = true;
    if (key == 'w')  keyz[3] = true;
  }

  void keyReleased() {
    if (key == 'a')  keyz[0] = false;
    if (key == 's')  keyz[1] = false;
    if (key == 'd')  keyz[2] = false;
    if (key == 'w')  keyz[3] = false;
  }
  
  void makeEnemies(){
     //make a queue of enemies in the future, including the boss at the end
     //for now, only include one enemy, just to test
     enemies.add( new Enemy( random(width) , 0 , 0 , 1, 1 ) );
  }