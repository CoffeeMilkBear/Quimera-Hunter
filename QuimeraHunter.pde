/*********************************************************
 *  Names: David Park, Henry Rosa, Charlie Zhang          *
 *  Course: ICS 3U 02  Pd. 4                              *
 *  Summative Game Assignment                             *
 *  Purpose: Quimera Hunter Game                          *
 *  Due Date: May 21, 2020                                *
 *********************************************************/

int strength;
int agility;
int defense; 

int screen;
int cash = 100000;

float extraStrength = 1; // Scales used later on the fight, defense is below 0
float extraAgility = 1;
float extraDefense = 1;

// images:


void setup() {

  size(1600, 900);
  
  gearLoad();
  
  Item one = new Item(weaponlvl1image,3,0);
  Item two = new Item(toplvl1image,3,1);
  Item three = new Item(bottomlvl1image,3,2);
  Item four = new Item(shoelvl1image,3,3);
  
  inventory.add(one);
  inventory.add(two);
  inventory.add(three);
  inventory.add(four);
  
  inventorySetup();

  screen = 5; // use this to skip to other areas 
}


void draw() {

  /*********************************************************
  *  Screen Lists:                                         *
  *  0 - Start Menu                                        *
  *  1 - Attribute Menu                                    *
  *  2 - Main Menu                                         *
  *  3 - Inventory                                         *
  *  4 - Shop                                              *
  *  5 - Boss Fight                                        *
  *********************************************************/

  if (screen == 0) 
    startMenu(); 
   else if (screen == 1)
    attributeMenu();
    else if (screen == 2) 
    mainMenu();
    else if (screen == 3) 
    inventory();
    else if (screen == 4) 
    shop();
    else if (screen == 5) {
    
        
 
      bossFight();
    
  }    
    
    
    
}
