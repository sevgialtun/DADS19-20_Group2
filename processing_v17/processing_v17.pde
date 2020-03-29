// Digital Architectural Design Studio - Group 2
//Space Organization Algorithm
//Version 17.0

//growCell red;
//growCell green;
//growCell cyan;
//growCell blue;
//growCell yellow;

int Xbol = 35; // Interior boundries of the module
int Ybol = 70; // Each cell has 10*10cm dimensions


int redsize = 0; // Momentarily number of the cells
int greensize = 0;
int cyansize = 0;
int bluesize = 0;
int yellowsize = 0;

int redborder = 800; // Intended number of the cells
int greenborder = 500;
int cyanborder = 200;
int blueborder = 600;
int yellowborder = 350;


int tolerance = 100; // Negligible amount of missing - uncolored - cells
int loopcounter = 0;

int [][] matrix = new int[Xbol][Ybol]; 

void setup()
{
  frameRate(5000);
  size(400, 800);
  background(255);

  //red = new growCell();
  //green = new growCell();
  //cyan = new growCell();
  //blue = new growCell();
  //yellow = new growCell();

  redsize = 0;
  greensize = 0;
  cyansize = 0;
  bluesize = 0;
  yellowsize = 0;
  loopcounter = 0;


  for (int j=0; j<Ybol; j++)
  {
    for (int i=0; i<Xbol; i++)
    {
      matrix [i][j] = 0;
    }
  }

  /*
Below, one cell for each color - which represents different spaces - are created 
   randomly in order to generate alternative organizations. Each color - space - different
   int value to make further calculations.
   */
  matrix[int(random(1, Xbol-1))][int(random(1, Ybol-1))]= 1;
  matrix[int(random(1, Xbol-1))][int(random(1, Ybol-1))]= 2;
  matrix[int(random(1, Xbol-1))][int(random(1, Ybol-1))]= 3;
  matrix[int(random(1, Xbol-1))][int(random(1, Ybol-1))]= 4;
  matrix[18][1]= 5; // Only the first cyan - entrance - cell is not random since the entrance is fixed.

  // Below, Coloring process of the each cell according to its value.
  for (int j=1; j<Ybol-1; j++)
  {
    for (int i=1; i<Xbol-1; i++)
    {
      if (matrix[i][j]== 1)
      {
        fill(255, 0, 0);
      } else if (matrix[i][j]== 2)
      {
        fill(0, 255, 0);
      } else if (matrix[i][j]== 3)
      {
        fill(0, 0, 255);
      } else if (matrix[i][j]== 4)
      {
        fill(255, 255, 0);
      } else if (matrix[i][j]== 5)
      {
        fill(0, 255, 255);
      } else if (matrix[i][j]== 0)
      {
        fill(255);
      }

      stroke(0);
      strokeWeight(1);
      rect((width/Xbol)*i, (height/Ybol)*j, (width/Xbol), (height/Ybol));
    }
  }
}


void draw()
{
  //long timecnt = millis();

  growgreen();




  //println(millis() - timecnt);
}

void growred() //Growing function of the colors - spaces -. 
{
  int whilecnt = 0;
  //int whilecnt2 = 0;
  //int successcnt = 0;
  int i = 0;
  int j = 0;
  int successred3 = 0;

  while (successred3 == 0) { // Limits the growing to determinated number.
    int successred2 = 0;
    if ( redsize < redborder) {      
      while (successred2 == 0) { // Randomly checks four sides of the randomly founded red cell. If the checked cell is white - empty -, grows in that direction. If it does not white, checks another side randomly until find the white cell.
        //successcnt++;
        whilecnt++;
        int successred = 0;
        while (successred == 0) { //Checks cells randomly if it is red or not. When it finds the red cell, loop ends and function proceeds.

          int  randredx = int(random(1, Xbol - 1));
          int  randredy = int(random(1, Ybol - 1));
          if (matrix[randredx][randredy] == 1) {
            i = randredx;
            j = randredy;
            successred = 1;

            //println(successcnt);
          }
        }

        int newi = i;
        int newj = j;

        float eksenred = random(-1, 1);

        if (eksenred > 0) {
          float eksenredx = random(-1, 1);
          if (eksenredx > 0) {
            newi = i+1;
          } else if (eksenredx <= 0) {
            newi = i-1;
          }
        } else if (eksenred <= 0) {
          float eksenredy = random(-1, 1);
          if (eksenredy > 0) {
            newj = j+1;
          } else if (eksenredy <= 0) {
            newj = j-1;
          }
        }
        if ((matrix[newi][newj] == 0) && (newj < Ybol) && (newj >= 0) && (newi < Xbol) && (newi >= 0)) {
          successred2 = 1;
          successred3 = 1;
          redsize++;
          matrix[newi][newj] = 1;
          fill(255, 0, 0);
          stroke(0);
          strokeWeight(1);
          rect((width/Xbol)*newi, (height/Ybol)*newj, (width/Xbol), (height/Ybol));
        } else if (whilecnt > 5000) {
          successred2 = 1;
          successred3 = 1;
        }
      }
    } else if (redsize >= redborder) {
      successred3 = 1;
    }
  }
}


/*
void growcontrol() { 
 
/*
 Sometimes, a color is tight cornered by other colors. In that case, cornered color
 can not grow as much as expected. In this scenario, results might be deceptive.
 
 In order to prevent that, growcontrol function counts the number of white cells if
 the amout is more than expected or not. Since small amount of errors acceptable,
 a tolerance is added to the function.
 
 If the error is big enough to cause deception, system reruns itself and skips the 
 undesirable result.
 
 
 
 
 
 int allcells = Xbol * Ybol;
 int coloredcells = redborder + greenborder + yellowborder + blueborder + cyanborder;
 int control = allcells - coloredcells + tolerance;
 int countergrow = 0;
 
 loopcounter++;
 
 if (loopcounter >= 2000) 
 {
 for (int j=1; j<Ybol; j++)
 {
 for (int i=1; i<Xbol; i++)
 {
 if (matrix[i][j] ==0)
 {
 countergrow++;
 //println(counterbuyume);
 }
 }
 }
 
 if (countergrow >= control) {
 setup();
 }
 if (countergrow < control) {
 saveFrame("alternative-####.png");
 setup();
 }
 }
 }
 */
/*void mouseClicked()
 {
 for (int repeat = 0; repeat<10000; repeat++)
 { 
 growgreen();
 growred();
 growblue();
 growyellow();
 growcyan();
 }
 buyumekontrol();
 }
 */

void keyPressed() // Resets the code.
{
  if ((keyCode == 'r') || (keyCode == 'R'))
  {
    setup();
  }
}
