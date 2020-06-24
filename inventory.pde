boolean upgradeOpen = false;

int inventorySell = 0;
int openEnhancement = 1;
int inventoryEnhance = 2; 
int returnToMenu = 3; 
int shopReturnToMenu = 4; // used in shop menu

inventoryButtons sell = new inventoryButtons(320, 360, 460, 100, inventorySell);
inventoryButtons openUpgrade = new inventoryButtons(320, 480, 460, 100, openEnhancement);
inventoryButtons returnMenu = new inventoryButtons(560, 700, 500, 100, returnToMenu);
inventoryButtons enhance = new inventoryButtons(1050, 500, 400, 80, inventoryEnhance);
inventoryButtons shopReturn = new inventoryButtons(460, 700, 500, 100, shopReturnToMenu = 4);

ArrayList<InventorySelectButton> inventorySelectButtons;
EquipButton equipWeaponButton = new EquipButton(160, 180, 80, 80, 0);
EquipButton equipTopButton = new EquipButton(160, 280, 80, 80, 1);
EquipButton equipBottomButton = new EquipButton(160, 380, 80, 80, 2);
EquipButton equipShoesButton = new EquipButton(160, 480, 80, 80, 3);


void inventorySetup() {
  inventorySelectButtons = new ArrayList<InventorySelectButton>();
  inventorySelectButtons.add(new InventorySelectButton(320, 120, 100, 100, 0));
  inventorySelectButtons.add(new InventorySelectButton(440, 120, 100, 100, 1));
  inventorySelectButtons.add(new InventorySelectButton(560, 120, 100, 100, 2));
  inventorySelectButtons.add(new InventorySelectButton(680, 120, 100, 100, 3));
  inventorySelectButtons.add(new InventorySelectButton(320, 240, 100, 100, 4));
  inventorySelectButtons.add(new InventorySelectButton(440, 240, 100, 100, 5));
  inventorySelectButtons.add(new InventorySelectButton(560, 240, 100, 100, 6));
  inventorySelectButtons.add(new InventorySelectButton(680, 240, 100, 100, 7));
  
  equips[0] = null;
  equips[1] = null;
  equips[2] = null;
  equips[3] = null;
}


class inventoryButtons extends Button {

  int whichButtonType;

  inventoryButtons(int _x, int _y, int _w, int _h, int attr) {
    super(_x, _y, _w, _h);
    whichButtonType = attr;
  }

  void onClick() { 
    if (whichButtonType == inventorySell) {
      Item itemToSell = inventory.get(selectedInventoryItem);
      inventory.remove(itemToSell);
      selectedInventoryItem = -1;
    } else if (whichButtonType == openEnhancement) {
      upgradeOpen = !upgradeOpen;
    } else if (whichButtonType == returnToMenu || whichButtonType == shopReturnToMenu) {
      screen = 2;
    } else if (whichButtonType == inventoryEnhance) { 
      
      Item selectedItem = inventory.get(selectedInventoryItem);
      
      if (cash >= selectedItem.cost && selectedItem.stars < 25) {
        int chance = (int) (-3.96 * selectedItem.stars + 100);
        if ((int)random(0, 101) <= chance) {
          selectedItem.stars++;
          selectedItem.str++;
          selectedItem.def++;
          selectedItem.agi++;   
                    }
      }
    }
  }
}

int selectedInventoryItem = -1;
int selectedEquipItem = -1;

void inventory() { 

  background(BLACK);

  fill(PINK);
  rect(300, 100, 500, 500);
  rect(150, 100, 100, 500);

  // coordinates for the inventory icons
  fill(selectedInventoryItem == 0 ? BLUE : BLACK);
  rect(320, 120, 100, 100);
  if (inventory.size() > 0) {
    image(inventory.get(0).icon, 320, 120, 100, 100);
  }

  fill(selectedInventoryItem == 1 ? BLUE : BLACK);
  rect(440, 120, 100, 100);
  if (inventory.size() > 1) {
    image(inventory.get(1).icon, 440, 120, 100, 100);
  }

  fill(selectedInventoryItem == 2 ? BLUE : BLACK);
  rect(560, 120, 100, 100);
  if (inventory.size() > 2) {
    image(inventory.get(2).icon, 560, 120, 100, 100);
  }

  fill(selectedInventoryItem == 3 ? BLUE : BLACK);
  rect(680, 120, 100, 100);
  if (inventory.size() > 3) {
    image(inventory.get(3).icon, 680, 120, 100, 100);
  }

  fill(selectedInventoryItem == 4 ? BLUE : BLACK);
  rect(320, 240, 100, 100);
  if (inventory.size() > 4) {
    image(inventory.get(4).icon, 320, 240, 100, 100);
  }

  fill(selectedInventoryItem == 5 ? BLUE : BLACK);
  rect(440, 240, 100, 100);
  if (inventory.size() > 5) {
    image(inventory.get(5).icon, 440, 240, 100, 100);
  }

  fill(selectedInventoryItem == 6 ? BLUE : BLACK);
  rect(560, 240, 100, 100);
  if (inventory.size() > 6) {
    image(inventory.get(6).icon, 560, 240, 100, 100);
  }

  fill(selectedInventoryItem == 7 ? BLUE : BLACK);
  rect(680, 240, 100, 100);
  if (inventory.size() > 7) {
    image(inventory.get(7).icon, 680, 240, 100, 100);
  }
  
  // inventory select buttons
  for (InventorySelectButton button : inventorySelectButtons) {
    button.update();
    button.draw();
  }

  // coordinates for the equips icons
  fill(selectedEquipItem == 0 ? BLUE : BLACK);
  rect(160, 180, 80, 80);
  if (equips[0] != null) image(equips[0].icon, 160, 180, 80, 80);

  fill(selectedEquipItem == 1 ? BLUE : BLACK);
  rect(160, 280, 80, 80);
  if (equips[1] != null) image(equips[1].icon, 160, 280, 80, 80);

  fill(selectedEquipItem == 2 ? BLUE : BLACK);
  rect(160, 380, 80, 80);
  if (equips[2] != null) image(equips[2].icon, 160, 380, 80, 80);

  fill(selectedEquipItem == 3 ? BLUE : BLACK);
  rect(160, 480, 80, 80);
  if (equips[3] != null) image(equips[3].icon, 160, 480, 80, 80);

  equipWeaponButton.update();
  equipWeaponButton.draw();
  equipTopButton.update();
  equipTopButton.draw();
  equipBottomButton.update();
  equipBottomButton.draw();
  equipShoesButton.update();
  equipShoesButton.draw();

  fill(RED);
  rect(560, 700, 500, 100); // return to menu button coordinates

  rect(320, 360, 460, 100); // sell item button
  rect(320, 480, 460, 100); // enhance item button

  fill(WHITE);
  textSize(100);
  text("Inventory", 320, 100);

  textSize(35);
  text("Equips", 145, 150);

  textSize(65);
  text("Return to Menu", 565, 775);
  text("Sell Gear", 420, 430);
  text("Upgrade Gear", 335, 550);

  sell.draw();
  sell.update();
  openUpgrade.draw();
  openUpgrade.update();
  returnMenu.draw();
  returnMenu.update();

  if (upgradeOpen == true) { 
    upgrade();
    enhance.draw();
    enhance.update();
  }
}









void upgrade() { 

  fill(PINK);
  rect(1000, 100, 500, 500);

  fill(BLUE);
  rect(1200, 300, 100, 100);

  fill(RED);
  rect(1050, 500, 400, 80); // enhance button coordinates

  fill(WHITE);
  text("Upgrade", 1125, 560);

  if (selectedInventoryItem != -1) {
    int chance = (int) (-3.96 * inventory.get(selectedInventoryItem).stars + 100);
    text(inventory.get(selectedInventoryItem).stars, 1125, 260);
    image(inventory.get(selectedInventoryItem).icon, 1200, 300, 100, 100);

    text(cash, 1125, 460);

    if (inventory.get(selectedInventoryItem).stars != 25) {
      text(chance, 1125, 360);
    } else {
      text("Max Level", 1125,360);
    }
  }
}




class InventorySelectButton extends Button {
  int sel;
  InventorySelectButton(int _x, int _y, int _w, int _h, int seL) {
    super(_x, _y, _w, _h);
    sel = seL;
  }
  void onClick() {         
    // empty slot clicked while equip item selected
    if (selectedEquipItem != -1 && (sel >= inventory.size())) {
      Item itemToMove = equips[selectedEquipItem];
      inventory.add(itemToMove);
      equips[selectedEquipItem] = null;
      selectedEquipItem = -1;
      updateStats();
      return;
    }
    selectedEquipItem = -1;
    if (inventory.size() <= sel) {
      selectedInventoryItem = -1;
      return; // no item to select
    }

    if (selectedInventoryItem == sel)
      selectedInventoryItem = -1; // deselect this item
    else
      selectedInventoryItem = sel;
  }
}







void updateStats() { 
  
  strength = 0;
  defense = 0;
  agility = 0;
  
  for(int i = 0; i < 4; i++) {
   
    if (equips[i] == null) {
     continue;       
    } 
    
    strength += equips[i].str;
    defense += equips[i].def;
    agility += equips[i].agi;
    
  }
}


class EquipButton extends Button {

  int slot;

  EquipButton(int _x, int _y, int _w, int _h, int _slot) {
    super(_x, _y, _w, _h);
    slot = _slot;
  }

  void onClick() {

    // equip slot was clicked while inventory item was selected
    if (selectedInventoryItem != -1 && equips[slot] == null) {
      // check if selected item type matches equip slot
      Item itemToMove = inventory.get(selectedInventoryItem);
      if (itemToMove.type != slot) {
        selectedInventoryItem = -1; // tried to move item into wrong slot
        return;
      }

      // move from item from inventory into equips
      equips[slot] = itemToMove;
      updateStats();
      inventory.remove(itemToMove);
      selectedInventoryItem = -1; // deselect this slot
      return;
    }
    selectedInventoryItem = -1;

    // equip slot was clicked while no inventory item was selected
    if (selectedInventoryItem == -1 && equips[slot] == null) {
      selectedEquipItem = -1;
      return;
    }

    if (selectedEquipItem == slot) {
      selectedEquipItem = -1; // deselect this item
      return;
    }

    if (selectedEquipItem != 0) {
      selectedEquipItem = slot; // select the item in this equip slot
      return;
    }
  }
}
