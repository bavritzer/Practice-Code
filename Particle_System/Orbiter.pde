class Orbiter {
  float sz;
  float mass;
  PVector loc, vel, acc;
  Orbiter() {
    loc=new PVector(mouseX, mouseY);
    vel= new PVector(0, 0);
    acc= new PVector(0, 0);
    sz=random(2, 40);
    mass=4/3*PI*pow(sz/2, 3); // assuming constant density of 1}
  }
  void make() {
    ellipse(loc.x, loc.y, sz, sz);
    loc.add(vel);
    vel.add(acc);
  }
  void isattractedto(Central tempcent) {
    acc=PVector.sub(tempcent.loc, loc);
    acc.setMag(-.1*mass/sq(dist(loc.x, loc.y, tempcent.loc.x, tempcent.loc.y)));
  }

  void isattractedto(Orbiter temporb) {
    acc=PVector.sub(temporb.loc, loc);
    acc.setMag(-.009*mass/sq(dist(loc.x, loc.y, temporb.loc.x, temporb.loc.y)));
  }
  void hits(Orbiter temporb) {
    float speed=vel.mag();
    vel=PVector.sub(loc, temporb.loc);
    vel.normalize();
    vel.setMag(speed);
  }
  void hits(Central tempcent) {
    float speed1=-1*vel.mag();
    vel.mult(speed1);
    
  }
}

