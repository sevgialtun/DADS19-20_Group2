// Digital Architectural Design Studio - Group 2
//Zone Organization Algorithm
//Version z1-coding common space
//https://github.com/mitkonikov/Processing/tree/master/Greedy_Packing_Algorithm is the referenced code


ArrayList<Object> object = new ArrayList<Object>();

void setup()
{
  frameRate(5000);
  size(400, 800);
  background(255);
  
  setupObjects();
}
// TEMP FUNCTION FOR ADDING COUPLE OF Objects
void setupObjects(){
Object o1 = new Object(45, 45, 76, 107, "table");
Object o2 = new Object(0, 45, 45, 54, "sitting unit1");//sitting unit
Object o3 = new Object(0, 90, 45, 54, "sitting unit2");
Object o4 = new Object(70, 0, 85, 5, "monitor");
Object o5 = new Object(0, 0, 34, 13, "closet");//first aid
// CHANGING THE COLOR FOR EASIER DIFFERENTIATION
   o1.R = 140;
   o2.G = 140;
   o3.B = 140;
   o4.R = 140;
   o5.G = 140;
   
   object.add(o1);
   object.add(o2);
   object.add(o3);
   object.add(o4);
   object.add(o5);
} 

Void placeObject() {
int windowsSize = object.size();
   int[][] rects = new int[windowsSize][2];
   for (int i = 0; i < windowsSize; ++i) {
      Object current = object.get(i);
      rects[i][0] = current.W;
      rects[i][1] = current.H;
   } 
   GREEDY_PACK p = new GREEDY_PACK(rects, width, height);
   int[][] result = p.RESULT;
   
   for (int i = 0; i < windowsSize; ++i) {
      Object current = object.get(i);
      if (result[i][0] == width) {
         println("IMPOSSIBLE TO FIT THE WINDOW WITH TITLE: " + current.TITLE);
      }
      
      current.X = result[i][0];
      current.Y = result[i][1];
   }
}



void draw()
{
background(150);
   
   for (Object o : object) {
      o.DRAW();
   }

}
void keyPressed() {
  if (key == 's' || key == 'S') {
    String name = ""+day()+hour()+minute()+second();
      
    saveFrame(name+".png");
    println(name + " saved.");
  }
 }
