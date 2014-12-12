ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
  size(displayWidth, displayHeight);
  background(0);
}

void draw() {
  
  if (mousePressed) {
    balls.add(new Ball(2,5,9));
  }
  background(0);
  fill(255, 0, 0);

  for (int i = 0; i < balls.size (); i++) {
    Ball b = balls.get(i);    
    b.make();
    b.bwall();
   
  }
  fill(255);

  if (keyPressed) {
    if (key=='k' && balls.size()>0) {
      balls.remove(0);
    }
  }
}

