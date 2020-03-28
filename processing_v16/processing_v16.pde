// Digital Architectural Design Studio - Group 2
//Space Organization Algorithm
//Version 16.0



int Xbol = 35; // Interior boundries of the module
int Ybol = 70;


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
  growred();
  growblue();
  growyellow();
  growcyan();
  growcontrol();  
  //noLoop();


  //println(millis() - timecnt);
}
/*void keyPressed()
 {
 if ((keyCode == 'r') || (keyCode == 'R'))
 {
 growred();
 growgreen();
 growblue();
 growyellow();
 growcyan();
 }
 }
 */
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
        } else if (whilecnt > 10000) {
          successred2 = 1;
          successred3 = 1;
        }
      }
    } else if (redsize >= redborder) {
      successred3 = 1;
    }
  }
}

void growgreen()
{
  int whilecnt = 0;
  int whilecnt2 = 0;
  int k = 0;
  int l = 0;
  int successgreen3 = 0;

  while (successgreen3 == 0) {
    int successgreen2 = 0;
    if ( greensize < greenborder) {
      while (successgreen2 == 0) {
        whilecnt++;
        int successgreen = 0;
        while (successgreen == 0) {
          int  randgreenx = int(random(1, Xbol - 1));
          int  randgreeny = int(random(1, Ybol - 1));
          if (matrix[randgreenx][randgreeny] == 2) {
            k = randgreenx;
            l = randgreeny;
            successgreen = 1;
          }
        }

        int newk = k;
        int newl = l;

        float eksengreen = random(-1, 1);

        if (eksengreen > 0) {
          float eksengreenx = random(-1, 1);
          if (eksengreenx > 0) {
            newk = k+1;
          } else if (eksengreenx <= 0) {
            newk = k-1;
          }
        } else if (eksengreen <= 0) {
          float eksengreeny = random(-1, 1);
          if (eksengreeny > 0) {
            newl = l+1;
          } else if (eksengreeny <= 0) {
            newl = l-1;
          }
        }
        if ((matrix[newk][newl] == 0) && (newl < Ybol) && (newl >= 0) && (newk < Xbol) && (newk >= 0)) {
          successgreen2 = 1;
          successgreen3 = 1;
          greensize++;
          matrix[newk][newl] = 2;
          fill(0, 255, 0);
          stroke(0);
          strokeWeight(1);
          rect((width/Xbol)*newk, (height/Ybol)*newl, (width/Xbol), (height/Ybol));
          //print(newk + ",");
          //println(newl);
        } else if (whilecnt > 10000) {
          successgreen2 = 1;
          successgreen3 = 1;
        }
      }
    } else if (greensize >= greenborder) {
      successgreen3 = 1;
    }
  }
}


void growblue()
{
  int whilecnt = 0;
  int whilecnt2 = 0;
  int m = 0;
  int n = 0;
  int successblue3 = 0;

  while (successblue3 == 0) {
    int successblue2 = 0;
    if ( bluesize < blueborder) {
      while (successblue2 == 0) {
        whilecnt++;
        int successblue = 0;
        while (successblue == 0) {
          int  randbluex = int(random(1, Xbol - 1));
          int  randbluey = int(random(1, Ybol - 1));
          if (matrix[randbluex][randbluey] == 3) {
            m = randbluex;
            n = randbluey;
            successblue = 1;
          }
        }

        int newm = m;
        int newn = n;

        float eksenblue = random(-1, 1);

        if (eksenblue > 0) {
          float eksenbluex = random(-1, 1);
          if (eksenbluex > 0) {
            newm = m+1;
          } else if (eksenbluex <= 0) {
            newm = m-1;
          }
        } else if (eksenblue <= 0) {
          float eksenbluey = random(-1, 1);
          if (eksenbluey > 0) {
            newn = n+1;
          } else if (eksenbluey <= 0) {
            newn = n-1;
          }
        }
        if ((matrix[newm][newn] == 0) && (newn < Ybol) && (newn >= 0) && (newm < Xbol) && (newm >= 0)) {
          successblue2 = 1;
          successblue3 = 1;
          bluesize++;
          matrix[newm][newn] = 3;
          fill(0, 0, 255);
          stroke(0);
          strokeWeight(1);
          rect((width/Xbol)*newm, (height/Ybol)*newn, (width/Xbol), (height/Ybol));
          //print(newm + ",");
          //println(newn);
        } else if (whilecnt > 10000) {
          successblue2 = 1;
          successblue3 = 1;
        }
      }
    } else if (bluesize >= blueborder) {
      successblue3 = 1;
    }
  }
}


void growyellow()
{
  int whilecnt = 0;
  int whilecnt2 = 0;
  int r = 0;
  int t = 0;
  int successyellow3 = 0;

  while (successyellow3 == 0) {
    int successyellow2 = 0;
    if ( yellowsize < yellowborder) {
      while (successyellow2 == 0) {
        whilecnt++;
        int successyellow = 0;
        while (successyellow == 0) {
          int  randyellowx = int(random(1, Xbol - 1));
          int  randyellowy = int(random(1, Ybol - 1));
          if (matrix[randyellowx][randyellowy] == 4) {
            r = randyellowx;
            t = randyellowy;
            successyellow = 1;
          }
        }

        int newr = r;
        int newt = t;

        float eksenyellow = random(-1, 1);

        if (eksenyellow > 0) {
          float eksenyellowx = random(-1, 1);
          if (eksenyellowx > 0) {
            newr = r+1;
          } else if (eksenyellowx <= 0) {
            newr = r-1;
          }
        } else if (eksenyellow <= 0) {
          float eksenyellowy = random(-1, 1);
          if (eksenyellowy > 0) {
            newt = t+1;
          } else if (eksenyellowy <= 0) {
            newt = t-1;
          }
        }
        if ((matrix[newr][newt] == 0) && (newt < Ybol) && (newt >= 0) && (newr < Xbol) && (newr >= 0)) {
          successyellow2 = 1;
          successyellow3 = 1;
          yellowsize++;
          matrix[newr][newt] = 4;
          fill(255, 255, 0);
          stroke(0);
          strokeWeight(1);
          rect((width/Xbol)*newr, (height/Ybol)*newt, (width/Xbol), (height/Ybol));
          //print(newr + ",");
          //println(newt);
        } else if (whilecnt > 5000) {
          successyellow2 = 1;
          successyellow3 = 1;
        }
      }
    } else if (yellowsize >= yellowborder) {
      successyellow3 = 1;
    }
  }
}


void growcyan()
{
  int whilecnt = 0;
  int whilecnt2 = 0;
  int q = 0;
  int w = 0;
  int successcyan3 = 0;

  while (successcyan3 == 0) {
    int successcyan2 = 0;
    if ( cyansize < cyanborder) {
      while (successcyan2 == 0) {
        whilecnt++;
        int successcyan = 0;
        while (successcyan == 0) {
          int  randcyanx = int(random(1, Xbol - 1));
          int  randcyany = int(random(1, Ybol - 1));
          if (matrix[randcyanx][randcyany] == 5) {
            q = randcyanx;
            w = randcyany;
            successcyan = 1;
          }
        }

        int newq = q;
        int neww = w;

        float eksencyan = random(-1, 1);

        if (eksencyan > 0) {
          float eksencyanx = random(-1, 1);
          if (eksencyanx > 0) {
            newq = q+1;
          } else if (eksencyanx <= 0) {
            newq = q-1;
          }
        } else if (eksencyan <= 0) {
          float eksencyany = random(-1, 1);
          if (eksencyany > 0) {
            neww = w+1;
          } else if (eksencyany <= 0) {
            neww = w-1;
          }
        }
        if ((matrix[newq][neww] == 0) && (neww < Ybol) && (neww >= 0) && (newq < Xbol) && (newq >= 0)) {
          successcyan2 = 1;
          successcyan3 = 1;
          cyansize++;
          matrix[newq][neww] = 5;
          fill(0, 255, 255);
          stroke(0);
          strokeWeight(1);
          rect((width/Xbol)*newq, (height/Ybol)*neww, (width/Xbol), (height/Ybol));
          //print(newq + ",");
          //println(neww);
        } else if (whilecnt > 10000) {
          successcyan2 = 1;
          successcyan3 = 1;
        }
      }
    } else if (cyansize >= cyanborder) {
      successcyan3 = 1;
    }
  }
}

void growcontrol() { 

  /*
  Sometimes, a color is tight cornered by other colors. In that case, cornered color
   can not grow as much as expected. In this scenario, results might be deceptive.
   
   In order to prevent that, growcontrol function counts the number of white cells if
   the amout is more than expected or not. Since small amount of errors acceptable,
   a tolerance is added to the function.
   
   If the error is big enough to cause deception, system reruns itself and skips the 
   undesirable result.
   */



  
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
  }
}

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
