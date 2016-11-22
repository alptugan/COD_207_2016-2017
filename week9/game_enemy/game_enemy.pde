import ddf.minim.*;


Minim minim;
AudioPlayer player;
AudioPlayer gameBgMusicPlayer;
AudioPlayer hit1;
AudioPlayer hit2;
AudioPlayer hit3;
AudioPlayer hit4;
//----------------------------------------------------------------
// HERO VARIABLES
//----------------------------------------------------------------
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


//----------------------------------------------------------------
// ENEMY VARIABLES
//----------------------------------------------------------------  
float enemyLocx = 0;
float enemyLocy = 0;

float enemyVelx = 0;
float enemyVely = 0;


//----------------------------------------------------------------
// START BUTTON VARIABLES
//----------------------------------------------------------------
float buttonStartx = 0;
float buttonStarty = 0;
float buttonStartW = 150;
float buttonStartH = 50;

//----------------------------------------------------------------
// SCENE VARIABLES
//----------------------------------------------------------------
boolean scene1 = true;
boolean scene2 = false;
boolean scene3 = false;


boolean HeroHitsEnemy = false;

void setup()
{
  size(500, 500); 
  scoreFont = createFont("DK_Canoodle.otf", 16);

  // Start Button initialization
  buttonStartx = width*0.5 - buttonStartW*0.5;
  buttonStarty = height*0.5 - buttonStartH*0.5;

  // Load Sound
  minim = new Minim(this);
  player = minim.loadFile("button.wav");

  // Load Game Music File
  gameBgMusicPlayer = minim.loadFile("game_music.mp3");

  // Load hit sound
  hit1 = minim.loadFile("bottom.mp3");
  hit2 = minim.loadFile("left.mp3");
  hit3 = minim.loadFile("right.mp3");
  hit4 = minim.loadFile("top.mp3");
  // Call init Game custom funtion
  initGame();
}

// Custom function
void initGame() {
  // Enemy variable initialization
  enemyVelx = random(-5, 5);
  enemyVely = random(-5, 5);

  enemyLocx = width*0.5;
  enemyLocy = height*0.5;

  x = 0;
  y = 0;
}

void draw()
{
  background(0);

  if (scene2 == true) {

    if (gameBgMusicPlayer.isPlaying() == false) {
      gameBgMusicPlayer.play();
    }
    //----------------------------------------------------------------
    // HERO SECTION
    //----------------------------------------------------------------
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

    if (HeroHitsEnemy == false) {
      fill(#ffffff);
    } else {
      fill(#E74C3C);
    }
    ellipse(x, y, r*2, r*2);

    fill(255);
    textFont(scoreFont);
    textSize(32);

    // String cift tirnak icinde yazilir
    scoreTxt = "Speed: " + speed ;
    text(scoreTxt, 10, 40);

    //----------------------------------------------------------------
    // ENEMY SECTION
    //----------------------------------------------------------------

    enemyLocx = enemyLocx + enemyVelx;
    enemyLocy = enemyLocy + enemyVely;

    if (enemyLocx < 0 || enemyLocx > width) {
      enemyVelx = enemyVelx*-1;

      hit1.play();

      if (hit1.position() == hit1.length()) {
        hit1.rewind();
        hit1.play();
      }
    }

    if (enemyLocy < 0 || enemyLocy > height) {
      enemyVely = enemyVely*-1;
      hit2.play();

      if (hit2.position() == hit2.length()) {
        hit2.rewind();
        hit2.play();
      }
    }

    pushStyle();
    fill(#E74C3C);
    ellipse(enemyLocx, enemyLocy, 30, 30);
    popStyle();

    // Hit detection between HERO and ENEMY
    if ((x + r) > (enemyLocx - 30 * 0.5) && (x-r) < (enemyLocx + 30 * 0.5)
      && (y - r) < (enemyLocy + 30 * 0.5) && (y+r) > (enemyLocy - 30 * 0.5)) {
      println("HERO tosladi");
      HeroHitsEnemy = true;

      scene2 = false;
      scene1 = false;
      scene3 = true;
    } else {
      println("HERO RAHAT OL"); 
      HeroHitsEnemy = false;
    }
  }
  //----------------------------------------------------------------
  // START BUTTON - SCENE 1
  //----------------------------------------------------------------
  if (scene1 == true) {
    pushStyle();
    noStroke();
    fill(#F1C40F);
    rect( buttonStartx, buttonStarty, buttonStartW, buttonStartH);

    // Set font options
    fill(#ffffff);
    textSize(18);
    textAlign(CENTER);
    text("START GAME", buttonStartx + 75, buttonStarty + 30);
    popStyle();
  }


  //----------------------------------------------------------------
  // START BUTTON - SCENE 3
  //----------------------------------------------------------------
  if (scene3 == true) {
    pushStyle();
    noStroke();
    fill(#F1C40F);
    rect( buttonStartx, buttonStarty, buttonStartW, buttonStartH);

    // Set font options
    fill(#ffffff);
    textSize(18);
    textAlign(CENTER);
    text("RESTART GAME", buttonStartx + 75, buttonStarty + 30);
    popStyle();
  }
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

void mouseReleased() {

  // Start Button hit detection
  if (scene1 == true) {
    if (mouseX > buttonStartx && mouseX < buttonStartx + buttonStartW
      && mouseY > buttonStarty && mouseY < buttonStarty + buttonStartH)
    {

      println("start button is pressed");
      scene1 = false;
      scene2 = true;
      scene3 = false;

      if ( player.isPlaying() == false )
      {
        player.play();
      }
    } else {
      println("start button is not pressed");
    }
  }

  if (scene3 == true) {
    if (mouseX > buttonStartx && mouseX < buttonStartx + buttonStartW
      && mouseY > buttonStarty && mouseY < buttonStarty + buttonStartH)
    {
      initGame();
      hit1.rewind();
      hit2.rewind();
      println("start button is pressed");
      scene1 = false;
      scene2 = true;
      scene3 = false;
    } else {
      println("start button is not pressed");
    }
  }
}