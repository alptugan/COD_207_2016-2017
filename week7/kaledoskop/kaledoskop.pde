PImage picture;
PImage picture2;

void setup() {  
  size(1200, 800);

  picture = loadImage("resim2.png");
}


void draw() {


  background(255);

  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(radians(30));
  imageMode(CENTER);
  blendMode(DIFFERENCE);
  for (int i = 0; i < 36; i = i + 1) {

    rotate(radians(10));
    image(picture, 0, 0);
  }

  popMatrix();
}