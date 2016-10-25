void setup() {
  size(400,400);
}


void draw() {
  
  background(255);
  
  pushMatrix();
  pushStyle();
  translate(100,0);
  
  noStroke();
  fill(#ffcc00);
  rect(width*0.5 - 50,height*0.5 - 50, 100,100);
  
  rect( width*0.5 - 40,height*0.5 + 51 , 80,80);
  
  rect(width*0.5 - 20,height*0.5 - 51 - 40 , 40,40);
  
  popStyle();
  popMatrix();
  
  rect(0,0,50,50);
}