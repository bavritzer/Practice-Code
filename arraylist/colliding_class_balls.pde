


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
  void suckedin(Blackhole die){
  acc=PVector.sub(tempball.loc, die.loc);
acc.setMag(.05);}
}

