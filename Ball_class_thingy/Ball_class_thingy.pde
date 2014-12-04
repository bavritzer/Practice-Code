GBall[] Liang=new GBall[10];
void setup() {
  size(displayWidth, displayHeight);
  for (int i=0; i<Liang.length; i++) {
    Liang[i]=new GBall(20, color(44,34,124));
  }
}
void draw() {
  background(0);
  for (int i=0; i<Liang.length; i++) {
  Liang[i].move();
Liang[i].bounce();
Liang[i].make();}
}

class GBall {
  float sz;
  color colorful;
  PVector loc, vel, acc;
  GBall(float tempsz,color tempc) {
    colorful=tempc;
   sz=tempsz;
    loc=new PVector(random(100,width-100), random(0,height));
    vel=new PVector(0, 0);
    acc=new PVector(0, .1);
    }
    GBall() {
      sz=random(2,200);
    loc=new PVector(random(100,width-100), random(0,height));
    vel=new PVector(0, 0);
    acc=new PVector(0, .1);
    }
    void move() {
      loc.add(vel);
      vel.add(acc);
    }

  void make() {
    fill(colorful);
    ellipse(loc.x, loc.y, sz, sz);
  }
  void bounce() {
    if (loc.y+sz/2>=height) {
      loc.y=height-sz/2;
      vel.y=-abs(vel.y);
    }
  }
}

