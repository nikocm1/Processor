boolean keyz[] = new boolean [4];



class Hero{
  int HP;
  int Mana;
  float xcor;
  float ycor;
  int aDelay;
  
  //needs HP, Mana
  Hero(){
      HP = 5;
      Mana = 0;
      xcor = width/2;
      ycor = height * .9;
      aDelay = 0;
  }

  void shoot(){
    //use image of bullet
    aDelay++;
    if(aDelay % 7 == 0){
     ammo.add(new Ammo(xcor,ycor,0,-10));
    }
  }
  
  void isAlive(){
    
  }
  
 
  
  void move(){
      
      
      if (keyz[0]  && xcor > 0) {
        xcor -= 2.5;
      }
      if (keyz[2]  && (xcor < height)) {
        xcor += 2.5;
      } 
      if (keyz[3]  && (ycor > 0)) {
        ycor -= 2.5;
      } 
      if (keyz[1]  && (ycor < width)) {
        ycor += 2.5;
      } 
      
    }
  }