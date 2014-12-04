Ball[] Liang= new Ball[100];

void setup() {
  size(displayWidth, displayHeight);
}
void draw() {
  background(255);
  for (int i=0; i<Liang.length; i++) {
    Liang[i].make();
    Liang[i].bwall();
    for (int j=0; j<Liang.length; j++) {
      if (j!=i) {
      Liang[i].collide(Liang[j]);}
    }
  }
}


  class Ball {
    PVector loc, vel;
    float sz;
    Ball() {
      sz=20;
      loc = new PVector(random(sz, width-sz), random(sz, height-sz));
      vel=new PVector.random2D();
      vel.mult(random(0, 20));
    }
    void make() {
      ellipse(loc.x, loc.y, sz, sz);
      loc.add(vel);
    }
    void bwall() {
      if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
        vel.x *= -1;
      } 
      if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
        vel.y *= -1;
      }
    }

    void collide(ball) {
    }
  }

