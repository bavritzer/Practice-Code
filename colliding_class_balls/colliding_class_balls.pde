Ball[] Liang= new Ball[100];

void setup() {
  size(displayWidth, displayHeight);
  for(int i=0; i<Liang.length; i++){
  Liang[i]=new Ball(random(0,100), random(0,20), color(random(255), random(255), random(255)));}
}
void draw() {
  background(255);
  for (int i=0; i<Liang.length; i++) {
    Liang[i].make();
    Liang[i].bwall();
    for (int j=0; j<Liang.length; j++) {
      if (j!=i) {
        Liang[i].collide(Liang[j]);
      }
    }
  }
}


class Ball {
  PVector loc, vel;
  float sz=random(0,100);
  float speed=random(0,20);
  Ball(float tempspeed, float tempsz, color tempc) {
    tempsz=sz;
    tempspeed=speed;
    loc = new PVector(random(sz, width-sz), random(sz, height-sz));
    vel=PVector.random2D();
    vel.normalize();
    vel.mult(tempspeed);
fill(tempc);
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

  void collide(Ball tempball) {
    if (loc.dist(tempball.loc)<sz/2+tempball.sz/2 ){
    vel=PVector.sub(loc,tempball.loc);
  vel.setMag(speed);}
  }
}

