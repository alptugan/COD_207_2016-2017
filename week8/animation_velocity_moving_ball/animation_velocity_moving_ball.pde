float locx = 0;
float locy = 0;

float velocityX = 0;
float velocityY = 0;




void setup() {
  // set window size
  size(400, 400);
  
  velocityX = random(-5,5);
  velocityY = random(-5,5);
  
  locx = width*0.5;
  locy = height*0.5;
}


void draw() {
  
  background(0);
  
  locx = locx + velocityX;
  locy = locy + velocityY;


  if (locx < 0 || locx > width) {
    velocityX = velocityX*-1;
  }

  if (locy < 0 || locy > height) {
    velocityY = velocityY*-1;
  }
  
  ellipse(locx,locy,30,30);
}