// object 1
int x1 = 0;
int y1 = 0;
int w1 = 40;
int h1 = 40;

// object 2
int x2 = 50;
int y2 = 0;
int w2 = 40;
int h2 = 40;

void setup() {
  size(400, 400);
}


void draw() {
  background(255); 

  noStroke();

  x1 = mouseX;
  y1 = mouseY;
  fill(#F39C12);
  rect(x1, y1, w1, h1);


  fill(#27AE60);
  rect(x2, y2, w2, h2);


  // Hit detection check on X axis
  if(x1 + w1 > x2 && x1 < x2 + w2) {
    println("hit detection on x axis");
  }else{
    println("NOOOOO hit detection on x axis");
  }
  
  
  
  // Hit detection check on Y axis
  if(y1 + h1 > y2 && y1 < y2 + h2) {
    println("hit detection on y axis");
  }else{
    println("NOOOOO hit detection on y axis");
  }
}