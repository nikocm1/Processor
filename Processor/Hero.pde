boolean keyz[] = new boolean [4];



class Hero{
  int HP;
  int Mana;
  float xcor;
  float ycor;
  
  //needs HP, Mana
  Hero(){
      HP = 5;
      Mana = 0;
      xcor = width/2;
      ycor = height * .9;
  }

  void shoot(){
    //use image of bullet
   
  }
  
  void isAlive(){
    
  }
  
 
  
  void move(){
      
      
      if (keyz[0]  && xcor > 0) {
        xcor -= 2.5;
      }
      if (keyz[2]  && (xcor < 700)) {
        xcor += 2.5;
      } 
      if (keyz[3]  && (ycor > 0)) {
        ycor -= 2.5;
      } 
      if (keyz[1]  && (ycor < 800)) {
        ycor += 2.5;
      } 
      
    }
  }