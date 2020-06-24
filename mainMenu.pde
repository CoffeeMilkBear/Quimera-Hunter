int fightBoss = 1; 
int mainMenuShop = 2;
int mainMenuInventory = 3 ;

mainMenuButtons fightBossButton = new mainMenuButtons(550,200,500,500,1);
mainMenuButtons shopButton = new mainMenuButtons(1425,725,150,150,2);
mainMenuButtons inventoryButton = new mainMenuButtons(1250,725,150,150,3);

int agilityDisplayCounter = 0;
boolean bossButtonClicked = false;

class mainMenuButtons extends Button {

   int whichAttribute;

  mainMenuButtons(int _x, int _y, int _w, int _h, int attr) {
    super(_x, _y, _w, _h);
    whichAttribute = attr;
  }

  void onClick() { 
     if (whichAttribute == fightBoss) { // set up boss properties (health, strength, etc)
        
        gameOver = false;
        useItemButton.visible = true;
        attackButton.visible = true; 
        runButton.visible = true;
        playerHealth = 300;       
        bossHealth = 500;
        playerTurn = compareAgility(agility, bossAgility);
        potionDefense = 0;
        potionStrength = 0;
        if (playerTurn == true || playerTurn == false) {
          agilityDisplayCounter = 120;
          bossButtonClicked = true;
        }
        
        
        else {
          screen = 5;
        }
     } else if (whichAttribute == mainMenuShop) {
       screen = 4;
     } else if (whichAttribute == mainMenuInventory) { 
       screen = 3;
     }
  }
}

void mainMenu() {
  
  background(BLACK);
  
  fill(RED);
  rect(550,200,500,500); // fight boss box coordinate
  
  fill(BLUE);
  rect(1425,725,150,150); // shop button box coordinate
  
  fill(GREEN);
  rect(1250,725,150,150); // inventory button box coordinate
  
  fill(WHITE);
  textSize(35);
  text("Shop",1455,815);

  textSize(25);
  text("Inventory",1270,815);
  
  textSize(40);
  text("Cash: $"+ cash +"", 10,45);
  text("Strength: "+ strength +"", 10, 85); 
  text("Defense: "+ defense +"", 10, 120); 
  text("Agility: "+ agility +"", 10, 160);
  
  textSize(100);
  text("Fight Boss", 550, 450);
 
  fightBossButton.draw();
  fightBossButton.update();
  shopButton.draw();
  shopButton.update();
  inventoryButton.draw(); 
  inventoryButton.update();

  if (bossButtonClicked && agilityDisplayCounter > 0) {
    fill(RED);
    rect(0,0,1600,900);
    fill(WHITE);
    
   if(playerTurn == true) {
    text("Your agility is greater.", 270,400); 
    text("You will start first.", 350,550);
   } 
   if (playerTurn == false) {
     text("Your agility is lower.", 270,400);
     text("Enemy will start first.",300,550);
   }
   
    if (--agilityDisplayCounter == 0) {
      agilityDisplayCounter = 0;
      bossButtonClicked = false;
      screen = 5;
    }
  }

}
