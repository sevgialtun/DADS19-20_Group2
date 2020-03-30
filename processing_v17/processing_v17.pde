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


int redSize = 0; // Momentarily number of the cells
int greenSize = 0;
int cyanSize = 0;
int blueSize = 0;
int yellowSize = 0;

int redBorder = 300; // Intended number of the cells
int greenBorder = 600;
int cyanBorder = 400;
int blueBorder = 200;
int yellowBorder = 950;


int tolerance = 100; // Negligible amount of missing - uncolored - cells
int cycleTime = 2000;
int loopCounter = 0;

int [][] matrix = new int[Xbol][Ybol]; 

void setup()
{
  frameRate(5000);
  size(400, 800);
  background(255);

  red = new growCell("Kitchen", 1, redSize, redBorder, 255, 0, 0);
  green = new growCell("Common Area", 2, greenSize, greenBorder, 0, 255, 0);
  blue = new growCell("Wet Area", 3, blueSize, blueBorder, 0, 0, 255);
  yellow = new growCell("Personal Area", 4, yellowSize, yellowBorder, 255, 255, 0);
  cyan = new growCell("Entrance", 5, cyanSize, cyanBorder, 0, 255, 255);


  redSize = 0;
  greenSize = 0;
  cyanSize = 0;
  blueSize = 0;
  yellowSize = 0;
  loopCounter = 0;


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
  red.firstCell();
  blue.firstCell();
  green.firstCell();
  yellow.firstCell();

  matrix[18][1]= 5; // Only the first cyan - entrance - cell is not random since the entrance is fixed.
  if (matrix[18][1]== 5)
  {
    fill(0, 255, 255);
  }
  noStroke();
  rect((width/Xbol)*18, (height/Ybol)*1, (width/Xbol), (height/Ybol));
}


void draw()
{


  red.growing();
  green.growing();
  blue.growing();
  yellow.growing();
  cyan.growing();
  growControl();
}


void keyPressed() // Resets the code.
{
  if ((keyCode == 'r') || (keyCode == 'R'))
  {
    setup();
  }
}
