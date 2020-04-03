public class Object{
 int X, Y, W, H;
 int defaultColor = 80;
 int R = defaultColor, G = defaultColor, B = defaultColor;
 int TEXTSIZE = 12;
 String TITLE = "no title";
 
 
 
  // THE CLASS CONSTRACTOR
 Object(int x, int y, int w, int h, String title){
 
  X = x; Y = y; W = w; H = h;
      TITLE = title;
      
 }
 
  
   // SETTING COLOR
void SETCOLOR(int r, int g, int b) {
      R = r; G = g; B = b;
   }
   
 // DRAWING THE WINDOW ON THE CANVAS
   void DRAW() {
      noStroke();
      // WINDOW BACKGROUND
      fill(R, G, B);
      rect(X, Y, W, H);
      // WINDOW FRAME
      fill(R + 20, G + 20, B + 20);
      rect(X, Y, W, 10);
      
      textSize(TEXTSIZE);
      text(TITLE, X + 5, Y + 20);
   }   
   
}
