// Digital Architectural Design Studio - Group 2
//Zone Organization Algorithm
//Version z2-coding common space


void setup() {
  size(350, 720);
  background(255);
}
//for table
int x1=150;//REFERENCE POINTS
int y1=150;//REFERENCE POINTS
int w1=76;
int l1=107;

//for seating units
int x2=0;
int y2=0;
int w2=45;
int l2=54; 
int counterSeat=0;//CONTROL NUMBER FOR ONE SIDE PLACEMENT

//for monitor
float x3=0;
float y3=0;
int w3=85;
int l3=5; 
float rangeM = random(100, 150);//monitor margin changes randomly
int m=0;

void draw()
{
  fill(0,200,200);
  rect(x1, y1, w1, l1);//draw table

  
  //draw seating units

  for (int a=0; a<2; a++)//place 2 units
  { 
   if  (counterSeat ==0)// eğer 4 veya 5. seçenek gerçekleştiyse daha fazla oturma elemanı çizilmeyecek
   
    {
       println(counterSeat);
      int i= int(random(0, 6));
      noLoop(); 

      println("i=" +i);
fill(255,0,255);
      if (i==0) {
        x2 = (x1-w2);
        y2=y1;
        m=2;
        rect(x2, y2, w2, l2); //draw seating units according to table
      } else if (i==1) {
        x2 =x1;
        y2=(y1-w2);
        m=3;
        rect(x2, y2, l2, w2); //draw seating units according to table
      } else if (i==2) {
        x2 =(x1+w1);
        y2=y1;
         m=1;
        rect(x2, y2, w2, l2); //draw seating units according to table
      } else if (i==3) {
        x2 =x1;
        y2=(y1+l1);
        m=4;
        rect(x2, y2, l2, w2); //draw seating units according to table
      } else if (i==4) {
        x2 =(x1-w2);
        y2=y1;
         m=2;
        rect(x2, y2, w2, l1); //draw seating units according to table
        counterSeat++;
      } else if (i==5) {
        x2 =(x1+w1);
        y2=y1;
        rect(x2, y2, w2, l1); //draw seating units according to table
        counterSeat=1;
        m=1;
      }
    }
  }

//draw monitor
for (int a=0; a<1; a++)
{
fill(255,0,0);
      if (m==1) {
        x3 = (x1-rangeM);
        y3=y1;
        rect(x3, y3, l3, w3); //draw monitor according to seatings
}
else if (m==2) {
        x3 = (x1+rangeM);
        y3=y1;
        rect(x3, y3, l3, w3); //draw monitor according to seatings
}
else if (m==3) {
        x3 = (x1);
        y3=(y1+rangeM);
        rect(x3, y3, w3, l3); //draw monitor according to seatings
}
else if (m==4) {
        x3 = x1;
        y3=(y1-rangeM);
        rect(x3, y3, w3, l3); //draw monitor according to seatings
}
}
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    String name = ""+day()+hour()+minute()+second();

    saveFrame(name+".png");
    println(name + " saved.");
  }
}
