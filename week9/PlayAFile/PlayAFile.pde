import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("02 Out of Time.mp3");
}

void draw()
{
  background(0);
  stroke(255);
  
  
  if ( player.isPlaying() )
  {
    text("Press any key to pause playback.", 10, 20 );
  }
  else
  {
    text("Press any key to start playback.", 10, 20 );
  }
}

void keyPressed()
{
  // If player is playing the sound, pause
  // Else do nothing
  if ( player.isPlaying() )
  {
    player.pause();
  }else{
     player.play(); 
  }
}