PImage picture;
PImage picture2;

void setup() {  
  size(1200,800);
  
  picture = loadImage("resim.png");
  picture2 = loadImage("resim2.png");
}


void draw() {
  background(255);
  
  blendMode(SUBTRACT);
  image(picture2,mouseX,0);
  
  blendMode(MULTIPLY);
  image(picture,0,0);
}