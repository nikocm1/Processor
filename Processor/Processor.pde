Hero bob;
ArrayList<Enemy> enemies= new ArrayList<Enemy>();
ArrayList<Ammo> ammo= new ArrayList<Ammo>();
ArrayList<Ammo> enemyAmmo= new ArrayList<Ammo>();


void setup() {
  size(700, 800); 
  background(0);
  bob = new Hero();

  makeEnemies(50);
}

void draw() {
  //update background
  background(1100);

  if ( bob != null) {
    //Hero animation
    ellipse(bob.xcor, bob.ycor, 20, 20);
    bob.move();

    //enemy animation
    if (enemies.size() > 0) {
      for (Enemy e : enemies) {
        ellipse(e.x, e.y, 10, 10);
        e.enemyMove();
        e.enemyShoot();
      }
    }

    //Bullet animation
    bob.shoot();
    for (Ammo a : ammo) {
      a.update();
    }
    for (Ammo eA : enemyAmmo) {
      eA.update();
    }

    //kills enemy
    for (int i = enemies.size() - 1; i >= 0; i--) {
      for (int a = ammo.size() - 1; a >= 0; a--) {
        if (enemies.size() > i) {
          if ( (abs(enemies.get(i).x - ammo.get(a).position.x) < 10) && (abs(enemies.get(i).y - ammo.get(a).position.y) < 10)) {
            enemies.remove(i);
            ammo.remove(a);
          }
        }
      }
    }

    //kills hero
    for ( Ammo eA : enemyAmmo) {
      if (bob != null) {
        if ( (abs(eA.position.x - bob.xcor) < 10) && (abs(eA.position.y - bob.ycor) < 10)) {
          bob = null;
        }
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

void makeEnemies(int numE) {
  //make a queue of enemies in the future, including the boss at the end
  //for now, only include one enemy, just to test
  for (int i = 0; i < numE; i++) {
    enemies.add( new Enemy( random(width), 0, 0, 1, 1 ) );
  }
}