int bossAgility = 5; // (int) random(10,51); // 10 - 50

boolean playerTurn = true; 

int attackInt = 1;
int useItemInt = 2; 
int runInt = 3;

boolean gameOver = false;
bossButtons attackButton = new bossButtons(1465, 670, 110, 210, attackInt);
bossButtons useItemButton = new bossButtons(1335, 670, 110, 210, useItemInt);
bossButtons runButton = new bossButtons(1205, 670, 110, 210, runInt);

int dice = 0;
int enemyDice = 0;

String[] displayMessages = new String[] {"", ""};
int messageDisplayCounter = 0;
int roll = 0;
boolean tryingToRunAway = false;
/*

 
 inventory.add(new Item(weaponlvl3image, 3, 100, 0, 0, 0));
 ^^^ how to add gears
 
 
 - icon refers to the image of the gear (list in gears tab)
 - lvl refers to the level
 - str,def,agi is obvious
 - type refers to if it's weapon,top,bottom,shoe (check gears tab for the int list)
 
 */

int yourDecision;
int playerHealth = 300; 
int bossHealth = 1000;
int bossAttack;

/*
boss strength: 30
 boss defense: 60
 
 boss strength: 1.25
 boss defence: 1.25
 */

int potionStrength;
int potionDefense;


void bossFight() {

  if (gameOver == false) {

    background(BLACK);

    fill(WHITE);
    rect(0, 650, 1600, 900);

    fill(PINK);
    rect(1465, 670, 110, 210);
    rect(1335, 670, 110, 210);
    rect(1205, 670, 110, 210);

    fill(RED);
    rect(280, 670, 900, 210);


    fill(BLACK);
    textSize(50);
    text("Run", 1220, 775);
    text("Item", 1335, 775);

    textSize(30);
    text("Attack", 1475, 770);

    textSize(50);
    fill(WHITE);
    text("Player Health: "+ playerHealth +"", 100, 75);
    text("Boss Health: "+ bossHealth +"", 1100, 75);



    if (playerTurn == true) {
      attackButton.draw();
      attackButton.update();
      useItemButton.draw();
      useItemButton.update();
      runButton.draw();
      runButton.update();


      textSize(60);
      fill(WHITE);

    } 

    if (playerTurn == false) {
      
    //  displayMessage("Enemy's Turn", "Enemy chose to attack", 180);

      enemyDice = rollDice();
      dice = rollDice();


      
      bossTurn(dice, enemyDice);
    
      
      
      delay(1000);  
      playerTurn = true;

}






    // show message
    if (messageDisplayCounter > 0) {
      textSize(60);
      fill(WHITE);
      text(displayMessages[0], 300, 750);
      text(displayMessages[1], 300, 830);
      messageDisplayCounter--;
    }

    if (playerHealth <= 0) 
      gameOver = true;

    if (messageDisplayCounter == 0 && tryingToRunAway) {
      if (roll == 6)
        screen = 2;

      tryingToRunAway = false;
      roll = 0;
    }
  }

  if (gameOver == true) {
  
  background(BLACK);
  textSize(100);
  text("Game Over", 120,200);
    screen = 2;
   }
   
}



void bossTurn(int yourRoll, int enemyRoll) {

  fill(RED);
  rect(280, 670, 900, 210);

  yourDecision = (int) (random(1, 3));

  int playerRoll = yourRoll;
  int bossRoll = enemyRoll;

  int realDice = 0;

  switch (yourDecision) {

  case 1: // defending

    if (playerRoll > bossRoll) {
      realDice = playerRoll - bossRoll;
      bossAttack = monsterAttack(realDice); 
      playerHealth = playerHealth - bossAttack;
    } else if (bossRoll >= playerRoll) {

      realDice = 1;
      bossAttack = monsterAttack(realDice);
      playerHealth = playerHealth - bossAttack;
    }

    break;

  case 2: // dodging
    // displayMessage("You chose to dodge", "Rolling dice...", 200);  

    if (playerRoll >= bossRoll) {
      bossAttack = 0;
    } else {
      bossAttack = monsterAttack(bossRoll); 
      playerHealth = playerHealth - bossAttack;
    }
  }


  playerTurn = true;
}



int monsterAttack(int dice) {
  return (int) (dice * (30 * 1.25));
}



int playerAttack(int dice, int str, float attributes, int potionBonus) {
  return (int) (dice * (str * attributes) + potionBonus);
}


int damageTaken(int dice, int enemyStrength, int gearDefence, float attribute) { // enemy strength is the strength from the other size
  return abs((int) (dice * (enemyStrength) - (gearDefence * attribute / 2)));
}




int giveItem() {

  int itemType = 0; 
  itemType = (int) random(1, 4);

  return itemType;
}





void displayMessage(String line1, String line2, int duration) {
  displayMessages[0] = line1;
  displayMessages[1] = line2;
  messageDisplayCounter = duration;
}
void displayMessage(String line1, int duration) {
  displayMessage(line1, "", duration);
}









class bossButtons extends Button {

  int whichButtonType;

  bossButtons(int _x, int _y, int _w, int _h, int attr) {
    super(_x, _y, _w, _h);
    whichButtonType = attr;
  }
  void onClick() { 
    if (whichButtonType == attackInt && playerTurn == true) {

      dice = rollDice();
      enemyDice = rollDice();

      int giveDamage = playerAttack(dice, strength, extraStrength, potionStrength);
      bossHealth = bossHealth - damageTaken(enemyDice, giveDamage, 60, 1.25);

      displayMessage("Player roll: "+ dice + ", Enemy roll: "+ enemyDice+"", "Damage Given: "+ damageTaken(enemyDice, giveDamage, 60, 1.25) +"", 200);

      playerTurn = false;
      
    } else if (whichButtonType == useItemInt && playerTurn == true) {

      displayMessage("You died", 120);
      int temporaryItemType = giveItem();

      switch(temporaryItemType) {

      case 1: 

        displayMessage("You got 50 health", 120);
        if (playerHealth >= 450) 
          playerHealth = 500;
        else
          playerHealth = playerHealth + 50;
          playerTurn = false;
        break;
        
      case 2: 
        displayMessage("You got 5 bonus strength points", 120);
        potionStrength = potionStrength + 5;
        playerTurn = false;
        break;
        
      case 3:
        
        displayMessage("You got 5 bonus defense points", 120);
        potionDefense = potionDefense + 5;
        playerTurn = false;
      }

      playerTurn = false;
    } else if (whichButtonType == runInt && playerTurn == true) {

      // roll dice to run away
      roll = rollDice();
      messageDisplayCounter = 120;
      tryingToRunAway = true;

      if (roll == 6) {
        useItemButton.visible = false;
        attackButton.visible = false;
        runButton.visible = false;
        displayMessage("You rolled a " + roll, "Returning to Menu...", 200);
      } else {
        displayMessage("You rolled a " + roll, "You need a 6 to run away", 60);
      }  
      playerTurn = false;
    }
  
  }
}
















// decides who goes first 
boolean compareAgility(int player, int enemy) { 

  int temporary = 0;

  if (player > enemy) 
    return true;
  if (player < enemy)
    return false;

  if (player == enemy) 
    temporary = (int)random(1, 3);
  if (temporary == 1) 
    return true;
  else
    return false;
}


int rollDice() {
  return (int) random(1, 7);
}
