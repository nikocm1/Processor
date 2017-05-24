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
    if (keyPressed) {
      if ((key == 'a' || key == 'A') && (xcor > 0)) {
        xcor -= 2.5;
      }
      if ((key == 'd' || key == 'D') && (xcor < 700)) {
        xcor += 2.5;
      } 
      if ((key == 'w' || key == 'W') && (ycor > 0)) {
        ycor -= 2.5;
      } 
      if ((key == 's' || key == 'S') && (ycor < 800)) {
        ycor += 2.5;
      } 
      
    }
  }
}