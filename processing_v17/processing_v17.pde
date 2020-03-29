// Digital Architectural Design Studio - Group 2
//Space Organization Algorithm
//Version 17.0

growCell red;
growCell green;
growCell cyan;
growCell blue;
growCell yellow;

int Xbol = 35; // Interior boundries of the module
int Ybol = 70; // Each cell has 10*10cm dimensions


int redsize = 0; // Momentarily number of the cells
int greensize = 0;
int cyansize = 0;
int bluesize = 0;
int yellowsize = 0;

int redborder = 450; // Intended number of the cells
int greenborder = 500;
int cyanborder = 500;
int blueborder = 500;
int yellowborder = 500;


int tolerance = 100; // Negligible amount of missing - uncolored - cells
int cycletime = 2000;
int loopcounter = 0;

int [][] matrix = new int[Xbol][Ybol]; 

void setup()
{
  frameRate(5000);
  size(400, 800);
  background(255);

  red = new growCell(1, redsize, redborder, 255, 0, 0);
  green = new growCell(2, greensize, greenborder, 0, 255, 0);
  blue = new growCell(3, bluesize, blueborder, 0, 0, 255);
  yellow = new growCell(4, yellowsize, yellowborder, 255, 255, 0);
  cyan = new growCell(5, cyansize, cyanborder, 0, 255, 255);


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


  red.growing();
  green.growing();
  blue.growing();
  yellow.growing();
  cyan.growing();
  growcontrol();
}


void growcontrol() { 
 
/*
 Sometimes, a color is tight cornered by other colors. In that case, cornered color
 can not grow as much as expected. In this scenario, results might be deceptive.
 
 In order to prevent that, growcontrol function counts the number of white cells if
 the amout is more than expected or not. Since small amount of errors acceptable,
 a tolerance is added to the function.
 
 If the error is big enough to cause deception, system reruns itself and skips the 
 undesirable result. */

int allcells = Xbol * Ybol;
int coloredcells = redborder + greenborder + yellowborder + blueborder + cyanborder;
int control = allcells - coloredcells + tolerance;
int countergrow = 0;

loopcounter++;

if (loopcounter >= cycletime) 
{
  for (int j=1; j<Ybol; j++)
  {
    for (int i=1; i<Xbol; i++)
    {
      if (matrix[i][j] ==0)
      {
        countergrow++;       
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


void keyPressed() // Resets the code.
{
  if ((keyCode == 'r') || (keyCode == 'R'))
  {
    setup();
  }
}
