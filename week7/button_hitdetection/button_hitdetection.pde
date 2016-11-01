// object 1
float x1 = 0;
float y1 = 0;
float w1 = 40;
float h1 = 40;

boolean hit = false;

void setup() {
  size(400, 400);

  w1 = 120;
  h1 = 30;

  x1 = width*0.5 - w1 * 0.5;
  y1 = height*0.5 - h1 *0.5;
}


void draw() {
  background(255); 

  noStroke();
  
  if(hit == true) {
    fill(0, 255, 0);
  }
  
  if(hit == false) {
    fill(255,0,0);
  }
  
  rect( x1, y1, w1, h1);
}

void mousePressed() {
  if (mouseX > x1 && mouseX < x1 + w1 && mouseY > y1 && mouseY < y1 + h1) {
    println(" CLICK");
    hit = true;
  } else {
    println("NO CLICK");
    hit = false;
  }

  
}