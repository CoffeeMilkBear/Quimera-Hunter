boolean isMouseInsideRect(int x, int y, int w, int h) {
   return ( mouseX > x   &&
            mouseX < x+w &&
            mouseY > y   &&
            mouseY < y+h );
}

/*
void draw() {
   fill(40,42,54);
   rect(0, 0, 800, 600);
   menubutton.update();
   menubutton.draw();
   purchasebutton.update();
   purchasebutton.draw();
}

*/

//////////////////////
// Button classes
//////////////////////
class Button {

   int x, y, w, h;
   int IDLE = 0;
   int HOVERED = 1;
   int HELD = 2;
   int currentState;
   String label;
   boolean visible = true;

   Button(int _x, int _y, int _w, int _h) {
      x = _x;
      y = _y;
      w = _w;
      h = _h;
   }

   // override this for specific button functions (eg. show menu, purchase item, etc)
   void onClick() {
      println("Button clicked.");
   }

   // determine button state based on current mouse position
   void update() {
      if (!visible) return;
      if (currentState == IDLE) { 
         // mouse enters button
         if (isMouseInsideRect(x, y, w, h)) {
            currentState = HOVERED;
         }
      } else if (currentState == HOVERED) {
         // mouse leaves button
         if (!isMouseInsideRect(x, y, w, h)) {
            currentState = IDLE;
         }
         // mouse pressed while mouse is hovering on button
         else if (mousePressed) {
            currentState = HELD;
         }
      } else if (currentState == HELD) {
         if (!mousePressed) {
            // mouse released while mouse is on button
            if (isMouseInsideRect(x, y, w, h)) {
               currentState = HOVERED;
               onClick(); // trigger button event
            }
            // mouse released while mouse is outside the button
            else {
               currentState = IDLE;
            }
         }
      }
   }

   void draw() {
      if (!visible) return;
      // draw a rectangle for the button
      stroke(0, 0);
      if (currentState == IDLE) { 
         fill(255, 0);
      } else if (currentState == HOVERED) {
         fill(255, 24);
      } else if (currentState == HELD) {
         fill(255, 150);
      }
      rect(x, y, w, h);

   }
}
