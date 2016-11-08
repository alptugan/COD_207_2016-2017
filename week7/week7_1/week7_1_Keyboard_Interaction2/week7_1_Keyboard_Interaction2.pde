float x = 0;
float y = 0;
float speed = 5.0;

// store whether key pressed or released in float variables
// 1 is pressed, 0 is not pressed
float left = 0;
float right = 0;
float up = 0;
float down = 0;

PFont scoreFont;
String scoreTxt;

int r = 30;

void setup()
{
  size(500, 500); 
  scoreFont = createFont("DK_Canoodle.otf", 16);
}

void draw()
{
  background(0);

  // if both keys pressed, right - left is 0.
  // if left pressed 0 - 1 is -1 so negative x direction.
  // multiply this by speed to make the amount of 
  // pixels moved equal to speed.
  x = x + (right - left) * speed;
  y = y + (down - up) * speed;


  // if x value exceeds the width(right border),
  // set x value to right border 
  // -50 is the half of the ellipse width because ellipse registration point is at the center by default
  // if it's a rect, we should substract -100 because the registration point of the rectangle is at the top left corner by default
  if (x > width - r) {
    println("disari cikti"); 
    x = width - r;
  } 


  if (x < r) {

    x = r;
  } 


  if (y < r) {

    y = r;
  } 
  
  
    if (y > height - r) {

    y = height - r;
  } 

  ellipse(x, y, r*2, r*2);





  fill(255);
  textFont(scoreFont);
  textSize(32);

  // String cift tirnak icinde yazilir

  scoreTxt = "Speed: " + speed ;
  text(scoreTxt, 10, 40);
}

void keyReleased()
{   
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }

    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}

void keyPressed()
{
  if (key == 'z') {
    speed = speed + 1;
  }

  if (key == 'x') {
    speed = speed - 1;
  }

  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }

    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
    }
  }
}