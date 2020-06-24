int lvl2weap = 1;
int lvl2top = 2; 
int lvl2bot = 3;
int lvl2shoe = 4;
int lvl3weap = 5;
int lvl3top = 6; 
int lvl3bot = 7; 
int lvl3shoe = 8;

shopButtons lvl2weapon = new shopButtons(820, 150, 150, 150, 1); 
shopButtons lvl2shirt = new shopButtons(990, 150, 150, 150, 2);
shopButtons lvl2bottom = new shopButtons(1160, 150, 150, 150, 3);
shopButtons lvl2shoes = new shopButtons(1330, 150, 150, 150, 4);
shopButtons lvl3weapon = new shopButtons(820, 375, 150, 150, 5);
shopButtons lvl3shirt = new shopButtons(990, 375, 150, 150, 6);
shopButtons lvl3bottom = new shopButtons(1160, 375, 150, 150, 7);
shopButtons lvl3shoes = new shopButtons(1330, 375, 150, 150, 8);


class shopButtons extends Button {

  int whichButtonType;

  shopButtons(int _x, int _y, int _w, int _h, int attr) {
    super(_x, _y, _w, _h);
    whichButtonType = attr;
  }

  void onClick() { 
    //  Item(PImage icoN, int lvl, int stR, int deF, int agI, int typE) {

    if (whichButtonType == lvl2weap) { // change price here
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(weaponlvl2image, 2, 0));
      }
    } else if (whichButtonType == lvl2top) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(toplvl2image, 2, 1));
      }
    } else if (whichButtonType == lvl2bot) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(bottomlvl2image, 2, 2));
      }
    } else if (whichButtonType == lvl2shoe) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(shoelvl2image, 2, 3));
      }
    } else if (whichButtonType == lvl3weap) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(weaponlvl3image, 3, 0));
      }
    } else if (whichButtonType == lvl3top) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(toplvl3image, 3, 1));
      }
    } else if (whichButtonType == lvl3bot) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(bottomlvl3image, 3, 2));
      }
    } else if (whichButtonType == lvl3shoe) {
      if (cash >= 10000 && inventory.size() != 8) {
        inventory.add(new Item(shoelvl3image, 3, 3));
      }
    }
  }
}






void shop() { 

  background(BLACK);

  fill(PINK);
  rect(200, 100, 500, 500);

  fill(selectedInventoryItem == 0 ? BLUE : BLACK);
  rect(220, 120, 100, 100);
  if (inventory.size() > 0) {
    image(inventory.get(0).icon, 220, 120, 100, 100);
  }

  fill(selectedInventoryItem == 1 ? BLUE : BLACK);
  rect(340, 120, 100, 100);
  if (inventory.size() > 1) {
    image(inventory.get(1).icon, 340, 120, 100, 100);
  }

  fill(selectedInventoryItem == 2 ? BLUE : BLACK);
  rect(460, 120, 100, 100);
  if (inventory.size() > 2) {
    image(inventory.get(2).icon, 460, 120, 100, 100);
  }

  fill(selectedInventoryItem == 3 ? BLUE : BLACK);
  rect(580, 120, 100, 100);
  if (inventory.size() > 3) {
    image(inventory.get(3).icon, 580, 120, 100, 100);
  }

  fill(selectedInventoryItem == 4 ? BLUE : BLACK);
  rect(220, 240, 100, 100);
  if (inventory.size() > 4) {
    image(inventory.get(4).icon, 220, 240, 100, 100);
  }

  fill(selectedInventoryItem == 5 ? BLUE : BLACK);
  rect(340, 240, 100, 100);
  if (inventory.size() > 5) {
    image(inventory.get(5).icon, 340, 240, 100, 100);
  }

  fill(selectedInventoryItem == 6 ? BLUE : BLACK);
  rect(460, 240, 100, 100);
  if (inventory.size() > 6) {
    image(inventory.get(6).icon, 460, 240, 100, 100);
  }

  fill(selectedInventoryItem == 7 ? BLUE : BLACK);
  rect(580, 240, 100, 100);
  if (inventory.size() > 7) {
    image(inventory.get(7).icon, 580, 240, 100, 100);
  }

  fill(PINK);
  rect(800, 100, 700, 500);

  fill(BLACK);
  rect(820, 150, 150, 150); // coordinates of shop buttons
  rect(990, 150, 150, 150);
  rect(1160, 150, 150, 150);
  rect(1330, 150, 150, 150);
  rect(820, 375, 150, 150);
  rect(990, 375, 150, 150);
  rect(1160, 375, 150, 150);
  rect(1330, 375, 150, 150);

  image(weaponlvl2image, 820, 150, 150, 150);
  image(toplvl2image, 990, 150, 150, 150);
  image(bottomlvl2image, 1160, 150, 150, 150);
  image(shoelvl2image, 1330, 150, 150, 150);
  image(weaponlvl3image, 820, 375, 150, 150);
  image(toplvl3image, 990, 375, 150, 150);
  image(bottomlvl3image, 1160, 375, 150, 150);
  image(shoelvl3image, 1330, 375, 150, 150);

  fill(RED);
  rect(460, 700, 500, 100); // return to menu button coordinates

  fill(WHITE);
  textSize(100);
  text("Inventory", 220, 100);

  text("Shop", 1025, 100);

  textSize(65);
  text("Return to Menu", 465, 775);

  shopReturn.draw();
  shopReturn.update();

  if (inventory.size() != 8) { 

    lvl2weapon.draw();
    lvl2weapon.update();
    lvl2shirt.draw();
    lvl2shirt.update();
    lvl2bottom.draw();
    lvl2bottom.update();
    lvl2shoes.draw();
    lvl2shoes.update();
    lvl3weapon.draw();
    lvl3weapon.update();
    lvl3shirt.draw();
    lvl3shirt.update();
    lvl3bottom.draw();
    lvl3bottom.update();
    lvl3shoes.draw();
    lvl3shoes.update();
  }
}
