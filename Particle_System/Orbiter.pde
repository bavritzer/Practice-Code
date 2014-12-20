class Orbiter  {
  float sz;
  float mass;
  PVector loc, vel, acc, acc1, acc2;
  boolean die;
  Orbiter(float tempx, float tempy) {
    loc=new PVector(tempx, tempy);
    vel=  PVector.random2D();
    vel.setMag(random(.5,9)); //random vel, mag anywhere from .5 to 9
    
    acc= new PVector(0, 0);
    sz=random(2, 40);
    mass=4/3*PI*pow(sz/2, 3); // assuming constant density of 1
  }
  void make() {
    ellipse(loc.x, loc.y, sz, sz);
    loc.add(vel);
    vel.add(acc); //makes and moves orbiter; don't need two voids really
    vel.limit(sqrt(mass*.5/dist(loc.x, loc.y, displayWidth/2, displayHeight/2))); //limits vel using orbital speed equation
  }
  void isattractedto(Central tempcent) { //gravitational attraction to central body
    acc1=PVector.sub(tempcent.loc, loc);
    acc1.setMag(.005*mass/pow((dist(loc.x, loc.y, tempcent.loc.x, tempcent.loc.y)),.5)); //note that mass is only added to keep orbiters from going offscreen as easily; in real life mass does not affect a. Remove mass from expression for more realistic orbits.
  acc.add(acc1); //adds gravitational acceleration from each central body
}

  void isattractedto(Orbiter temporb) { //gravitational attraction between orbiters; optional
    acc2=PVector.sub(temporb.loc, loc);
    acc2.setMag(.000009*mass/pow((dist(loc.x, loc.y, temporb.loc.x, temporb.loc.y)),.5)); //note that mass is only added to keep orbiters from going offscreen as easily; in real life mass does not affect a. Remove mass from expression for more realistic orbits.
  acc.add(acc2);} //adds gravitational acceleration from each orbital
  void hits(Orbiter temporb) {
  if(temporb.sz>sz){
  die=true;
  int fc1=frameCount; //auxiliary timer variable; used so that the ball doesn't grow infinitely large
  if(frameCount-fc1>=2){
sz+=temporb.sz/3;}} //grows after hitting 
  else {die = false;}
  }
  void hits(Central tempcent) {
  
    die=true; //if it hits the central body, the orbiter dies
  }
   void hits(Sship tempship) {
  
    die=true; //if it hits a ship, the orbiter dies
  }


}
