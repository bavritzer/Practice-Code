class Orbiter  {
  float sz;
  float mass;
  PVector loc, vel, acc, acc1, acc2;
  boolean die;
  Orbiter() {
    loc=new PVector(mouseX, mouseY);
    vel=  PVector.random2D();
    vel.setMag(random(.5,9));
    
    acc= new PVector(0, 0);
    sz=random(2, 40);
    mass=4/3*PI*pow(sz/2, 3); // assuming constant density of 1}
  }
  void make() {
    ellipse(loc.x, loc.y, sz, sz);
    loc.add(vel);
    vel.add(acc);
    vel.limit(sqrt(mass*.5/dist(loc.x, loc.y, displayWidth/2, displayHeight/2)));
  }
  void isattractedto(Central tempcent) {
    acc1=PVector.sub(tempcent.loc, loc);
    acc1.setMag(.005*mass/pow((dist(loc.x, loc.y, tempcent.loc.x, tempcent.loc.y)),.5));
  acc.add(acc1);
}

  void isattractedto(Orbiter temporb) {
    acc2=PVector.sub(temporb.loc, loc);
    acc2.setMag(.000009*mass/pow((dist(loc.x, loc.y, temporb.loc.x, temporb.loc.y)),.5));
  acc.add(acc2);}
  void hits(Orbiter temporb) {
  if(temporb.sz>sz){
  die=true;
  int fc1=frameCount;
  if(frameCount-fc1>=2){
sz+=temporb.sz/3;}}
  else {die = false;}
  }
  void hits(Central tempcent) {
  
    die=true;
  }
 void bwall() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
  
    } 
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    
    }
  }

}

