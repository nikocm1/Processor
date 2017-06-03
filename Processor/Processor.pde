import java.util.ArrayDeque;

Hero bob;

ArrayDeque<Enemy> enemyInQ = new ArrayDeque<Enemy>();
ArrayList<Enemy> enemies= new ArrayList<Enemy>();
ArrayList<Ammo> ammo= new ArrayList<Ammo>();
ArrayList<Ammo> enemyAmmo= new ArrayList<Ammo>();

boolean pause;
boolean skillActive;
float sensitivity;
int stream;


float currX;
float currY;
float skillX;
float skillY;
int skillRad;
int cooldown;
int level;

int a;
int b;
int c;
void setup() {
  size(600, 600); 
  noStroke();
  background(0);
  bob = new Hero();
  cooldown = 0;
  level = 0;

  a = (int)random(255);
  b = (int)random(255);
  c = (int)random(255);

  makeEnemies(100);
  pause = false;
  sensitivity = 4;
  skillActive = false;

  //num of streams of bullets = (2 * stream) - 1
  stream = 1;
}//end setup

void draw() {
  if (!pause) {
    //update background
    background(1100);
    noStroke(); 
    fill(color(a, b, c));
    if (enemies.size() == 0) {
      for (int i = 0; i < 10; i++) {
        if (enemyInQ.size() > 0)
          enemies.add(enemyInQ.pop());
      }
    }


    if ( bob != null) {
      //Hero animation
      triangle(bob.xcor, bob.ycor - 15, bob.xcor - 10, bob.ycor + 15, bob.xcor + 10, bob.ycor + 15);
      bob.move();
      currX = bob.xcor;
      currY = bob.ycor;
      //enemy animation
      if (enemies.size() > 0) {
        for (Enemy e : enemies) {
          ellipse(e.x, e.y, 10, 10);
          if (e.y < height * .3)
            e.enemyMove();
          e.enemyShoot();
        }
      }//end enemy animation

      //Bullet animation
      bob.shoot();
      for (Ammo a : ammo) {
        a.update();
      }
      for (Ammo eA : enemyAmmo) {
        eA.update();
      }//end of bullet animation

      //kills enemy
      for (int i = enemies.size() - 1; i >= 0; i--) {
        for (int a = ammo.size() - 1; a >= 0; a--) {
          if (enemies.size() > i) {
            if ( (abs(enemies.get(i).x - ammo.get(a).position.x) < 10) && (abs(enemies.get(i).y - ammo.get(a).position.y) < 10)) {
              enemies.get(i).HP -=1;
              ammo.remove(a);
              if (enemies.get(i).HP <= 0)
                enemies.remove(i);
            }
          }
        }
      }//end of kill enemy

      //kills hero
      for ( Ammo eA : enemyAmmo) {
        if (bob != null) {
          if ( (abs(eA.position.x - bob.xcor) < 10) && (abs(eA.position.y - bob.ycor) < 10)) {
            bob = null;
          }
        }
      }//and of kill hero

      //use skill
      if (cooldown < 100)
        cooldown++;
      println(cooldown);
      if (skillActive) {
        cooldown = 0;
        if (skillRad < 250) {
          noFill();
          stroke(225);
          ellipse(skillX, skillY, 2 * skillRad, 2 * skillRad);
          skillRad += 5;
          for (int i = enemyAmmo.size()-1; i >= 0; i--) {
            float changeEAX = abs(enemyAmmo.get(i).position.x - skillX);
            float changeEAY = abs(enemyAmmo.get(i).position.y - skillY);
            float EAdist = sqrt(changeEAX * changeEAX + changeEAY * changeEAY);
            if ( EAdist <= skillRad ) {
              enemyAmmo.remove(i);
            }
          }

          for (int i = enemies.size()-1; i >= 0; i--) {
            float changeEX = abs(enemies.get(i).x - skillX);
            float changeEY = abs(enemies.get(i).y - skillY);
            float Edist = sqrt(changeEX * changeEX + changeEY * changeEY);
            if ( Edist <= skillRad && Edist >= skillRad - 5 ) {
              enemies.get(i).HP -= 10;
              if (enemies.get(i).HP <= 0)
                enemies.remove(i);
            }
          }
        } else {
          skillActive = false;
        }
      }//end use skill
    }//end of if bob is alive
  }//end of if pause

  //Game Over
}//end draw


void keyPressed() {

  //move
  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;

  //pause
  if (key == 'p') {
    pause = !pause;
  }

  //change sensitivity
  if (key == 'n' && sensitivity >= 2) sensitivity -= 0.5;
  if (key == 'm' && sensitivity <= 6) sensitivity += 0.5;

  //use skill
  if (key == ' ' && cooldown >= 0) {
    if (bob != null) {
      skillRad = 0;
      skillX = currX;
      skillY = currY;
      skillActive = true;
    }
  }
}//end keyPressed

void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}

void makeEnemies(int numE) {
  //make a queue of enemies in the future, including the boss at the end
  //for now, only include one enemy, just to test
  /*
  if (level == 0) {
   for (int i = 0; i < 20; i++) {
   enemies.add( new Enemy( random(width), 0, 0, 1, 5 ) );
   }
   }
   if (level == 1) {
   for (int i = 0; i < 25; i++) {
   enemies.add( new Enemy( random(width), 0, 0, 1, 10 ) );
   }
   }
   if (level == 2) {
   for (int i = 0; i < 30; i++) {
   enemies.add( new Enemy( random(width), 0, 0, 1, 15 ) );
   }
   }
   if (level == 3) {
   enemies.add( new Enemy(width/2, 0, 0, 1, 100 ));
   }
   */
  if (enemyInQ.size() == 0)
    enemyInQ.push( new Enemy(width/2, 0, 0, 1, 1000 ) );

  for (int i = 0; i < 0; i++)
    enemyInQ.push( new Enemy(random(width), 0, 0, 1, 5 ) );
}