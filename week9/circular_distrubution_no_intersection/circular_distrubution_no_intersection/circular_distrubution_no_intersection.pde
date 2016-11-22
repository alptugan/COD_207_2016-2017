float tt, tx, ty;
float [] x;
float [] y;
float [] teta;
boolean overlapping;

void setup() {
  size(600, 600);
  generateRandomPos();
}


void draw() {
  background(0);

  for (int i = 0; i < x.length; i++) {
    fill(255);
    ellipse(x[i], y[i], 30, 30);
  }
}

void mousePressed() {
  generateRandomPos();
}

void generateRandomPos() {
  teta = new float[8];
  x = new float[8];
  y = new float[8];
  int i =0;

  while (i < 8) {
    tt = random(radians(360));

    tx = width * 0.5 + cos(tt) * 100;
    ty = height * 0.5 + sin(tt) * 100;

    overlapping = false;

    for (int j = 0; j < x.length; j++) {
      float otherX = x[j];
      float otherY = y[j];
      if (dist(tx, ty, otherX, otherY) < 30) {
        overlapping = true;
      }
    }

    if (overlapping == false) {
      teta[i] = tt;
      x[i] = tx;
      y[i] = ty;
      i++;
    }

    println(x.length);
  }
}