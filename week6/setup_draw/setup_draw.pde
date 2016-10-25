int a  = 30;
int b = 50;


void setup() {
  
}

void draw() {
  
  
  // If conditions
  if(a < 30) { // statement
    rect(0,0,40,40); 
  }
  
  
  if(a > 30)
  {
    ellipse(0,0,40,40);
  }
  
  
  if(a < 30) 
  {
    ellipse(width*0.5,height*0.5,30,30);
  }else if(a < 40) 
  {
    rect(width*0.5,height*0.5,40,40);
  }
  
  
  // and expressions &&
  
  if(b > 40 && b < 51) {
    
    fill(150);
    rect(width*0.5,height*0.5,40,40);
  }
  
  // or expression ||
  if(a > 20 || b > 60) {
    fill(255,0,0);
    rect(width*0.5,height*0.5,40,40);
  }
  
  
}