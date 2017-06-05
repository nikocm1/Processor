# Team: Processor
APCS2 Final Project Spring 2017
Team Member: Yu Qi Wu, Rihui Zheng, Nikolas Cruz-Marsted
Touhou Project

# Introduction
  This is a re-creation of the game called "Touhou Project". The this an arcade shooting game similar in style to "Space Invaders" but with a much greater amount of bullets.
The large amount of bullets created becomes a "barrage" flaming towards the character.

# Description
  ##Processor is the main driver file, and contains all of the calls for moving and shooting enemies, as well as various setup features
  ##The Ammo class contains the constructor of the bullet, as well as the move and display functions
  ##The Enemy class contains:
    ##enemyMove(), which  controls the movements of the enemy.
    ##enemyShoot(), which  controls the shooting of the enemy.
    
  ##The Hero class contains:
    ##shoot(), which controls the shooting of the character.
    ##move(), which controls the movements of the character.

# Controls
  ##Use the W,S,A and D keys in order to move up, down, left and right.
  ##Pressing 'space' will clear all the bullets near the character and 
damage all enemies near the character by 1 HP.
  ##Pressing 'n' or 'm' adjusts the sensitivity.
  ##Pressing 'p' will pause the game.

# Launch Instructions
 ##Once our repo has been cloned, cd into the Processor folder. Once inside, open up our game by typing "processing Processor.pde" into the command line. Once our sketch is opened, use either command R or press the play button inside the sketch to start the game