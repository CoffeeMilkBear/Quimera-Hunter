ArrayList<Item> inventory = new ArrayList<Item>();
Item[] equips = new Item[4];

// PImage weaponlvl2image;
// weaponlvl1image = loadImage("level2weapon.png");
// Item(PImage icoN, int lvl, int stR, int deF, int agI, int typE) { 
// ^ example of how to load/make/print images

PImage weaponlvl1image;
PImage toplvl1image;
PImage bottomlvl1image;
PImage shoelvl1image;

PImage weaponlvl2image;
PImage toplvl2image;
PImage bottomlvl2image;
PImage shoelvl2image;

PImage weaponlvl3image;
PImage toplvl3image;
PImage bottomlvl3image;
PImage shoelvl3image;

void gearLoad() { // put in void setup

  weaponlvl1image = loadImage("level1weapon.png"); 
  toplvl1image = loadImage("level1top.png");
  bottomlvl1image = loadImage("level1bottom.png");
  shoelvl1image = loadImage("level1shoe.png");

  weaponlvl2image = loadImage("level2weapon.png");
  toplvl2image = loadImage("level2top.png");
  bottomlvl2image = loadImage("level2bottom.png");
  shoelvl2image = loadImage("level2shoe.png");

  weaponlvl3image = loadImage("level3weapon.png");
  toplvl3image = loadImage("level3top.png");
  bottomlvl3image = loadImage("level3bottom.png");
  shoelvl3image = loadImage("level3shoe.png");
}

/*  Item one = new Item(weaponlvl1image,3,3,3,3,0);
 Item orange = new Item(weaponlvl1image,3,3,3,3,1);
 Item fun = new Item(weaponlvl1image,3,3,3,3,0);
 Item asf = new Item(weaponlvl1image,3,3,3,3,0); */

class Item { 

  PImage icon;
  int levels;
  int str;
  int def;
  int agi;
  int type;
  int cost = 500;
  int stars = 0;

  /* 
   0. weapon
   1. top
   2. pants
   3. shoes
   */

  Item(PImage icoN, int lvl, int typE) {

    icon = icoN; 
    levels = lvl;
    type = typE;

    if (lvl == 1) {

      switch (typE) { 
      case 0: 
        str = 10;
        break;
      case 1: 
        def = 10;
        break;
      case 2:    
        def = 10;
        break;
      case 3: 
        agi = 10;
      }
    } else if (lvl == 2) { 

      switch (typE) { 
      case 0: 
        str = 25;
        break;
      case 1: 
        def = 20;
        break;
      case 2: 
        def = 20;
        break;
      case 3: 
        agi = 20;
      }
    } else if (lvl == 3) {

      switch (typE) { 
      case 0: 
        str = 50;
        break;
      case 1: 
        def = 30;
        break;
      case 2: 
        def = 30;
        break;
      case 3: 
        agi = 30;
      }
    }
  }

  void updateStars(int lVl, int tyPe) {

    if (lVl == 1) {

      switch (tyPe) { 
      case 0: 
        str = str + stars;
        break;
      case 1: 
        def = def + stars;
        break;
      case 2: 
        def = def + stars;
        break;     
      case 3: 
        agi = agi + stars;
      }
      
    } else if (lVl == 2) { 

      switch (tyPe) { 
      case 0: 
        str = str + stars;
        break;
      case 1: 
        def = def + stars;
        break;
      case 2: 
        def = def + stars;
        break;
      case 3: 
        agi = agi + stars;
      }
      
    } else if (lVl == 3) {

      switch (tyPe) { 
      case 0: 
        str = str + stars;
        break;
      case 1: 
        def = def + stars;
        break;
      case 2: 
        def = def + stars;
        break;
      case 3: 
        agi = agi + stars;
      }
    }
  }
  
  
}
