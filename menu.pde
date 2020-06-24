void transitions() { // Use to switch from different parts

  background(BLACK);
  textSize(150);
  text("Loading...", 500, 400);
}

/**************************************************************************/

startButtons startGame = new startButtons(500, 300, 700, 200); 

void startMenu() { 

  background(BLACK);

  fill(WHITE);
  textSize(100);
  text("Quimera Hunter", 450, 110);

  textSize(50);
  text("Made by:", 25, 650);
  text("David Park", 25, 775);
 text("Henry Rosa", 25, 825);
  text("Charlie Zhang", 25, 875);

  fill(RED);
  rect(500, 300, 700, 200); // Use for button size

  fill(WHITE);
  textSize(75);
  text("Play Game", 650, 425);
  startGame.update();
  startGame.draw();
}

class startButtons extends Button {

  startButtons(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }

  void onClick() {
    screen = 1;
    visible = false;
  }
}

/**************************************************************************/

int attributeStrength = 0;
int attributeDefense = 1;
int attributeAgility = 2;
int attributesReset = 3;
int attributesContinue = 4;

attributeButtons strengthButton = new attributeButtons(1300, 250, 50, 50, attributeStrength);
attributeButtons defenseButton = new attributeButtons(1300, 375, 50, 50, attributeDefense);
attributeButtons agilityButton = new attributeButtons(1300, 500, 50, 50, attributeAgility);
attributeButtons resetAttributes = new attributeButtons(600,600,400,100, attributesReset);
attributeButtons finishAttributes = new attributeButtons(600,750,400,100, attributesContinue);

int addBar = 10; 
int strengthBar = 0, defenseBar = 0, agilityBar = 0; 

class attributeButtons extends Button {

   int whichAttribute;

  attributeButtons(int _x, int _y, int _w, int _h, int attr) {
    super(_x, _y, _w, _h);
    whichAttribute = attr;
  }

  void onClick() { // ADDITIONAL DAMAGES
     if (whichAttribute == attributeStrength) {
        extraStrength = extraStrength + 0.05;
        addBar = addBar - 1;
        strengthBar = strengthBar + 1;
     } else if (whichAttribute == attributeDefense) {
        extraDefense = extraDefense + 0.05;
        addBar = addBar - 1;
        defenseBar = defenseBar + 1;
     } else if (whichAttribute == attributeAgility) {
        extraAgility = extraAgility + 0.05;
        addBar = addBar - 1;
        agilityBar = agilityBar + 1;
     } else if (whichAttribute == attributesReset) { 
       extraStrength = 1;   
       extraDefense = 1;
       extraAgility = 1;
       strengthBar = 0; 
       defenseBar = 0;
       agilityBar = 0;
       addBar = 10;
     } else if (whichAttribute == attributesContinue) {
       screen = 2;
     }
     
  }
}

void attributeMenu() { 

  background(BLACK);
  
  fill(WHITE);
  textSize(100);
  text("Attribute Menu", 450, 110);

  textSize(25); 
  text("Upgrade Points Remaining: "+addBar+ "", 600, 160);

  textSize(50);
  text("Strength", 100, 300);
  text("Defense", 100, 425);
  text("Agility", 125, 550);


  // bars (1 point = 180 pixels) 
  
  fill(WHITE);
  rect(350, 250, 900, 50);
  fill(RED);
  rect(350,250,  (strengthBar * 90), 50);

  fill(WHITE);
  rect(350, 375, 900, 50);
  fill(RED);
  rect(350,375, (defenseBar * 90), 50);
    
  fill(WHITE);
  rect(350, 500, 900, 50);
  fill(RED);
  rect(350,500,(agilityBar * 90),50);


  fill(BLUE);

  // buttons (sizes)
  rect(1300, 250, 50, 50);
  rect(1300, 375, 50, 50);
  rect(1300, 500, 50, 50);

  // reset button
  fill(RED);
  rect(600, 600, 400, 100);
  fill(WHITE);
  text("Reset Attributes", 605, 665);

  // continue button
  fill(GREEN);
  rect(600, 750, 400, 100);
  fill(WHITE);
  text("Continue Game", 610, 820);
  
  if (addBar > 0) {
  strengthButton.draw();
  strengthButton.update();
  defenseButton.draw();
  defenseButton.update();
  agilityButton.draw();
  agilityButton.update();
  }
  
  resetAttributes.draw();
  resetAttributes.update();
  finishAttributes.draw(); 
  finishAttributes.update();
  
}
