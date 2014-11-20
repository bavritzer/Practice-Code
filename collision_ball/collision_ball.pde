PVector loc[]= new PVector[20];
PVector vel[]=new PVector[20];
PVector acc[]=new PVector[20];
int sz=40;
color col[]= new color[20];
PVector velc[]= new PVector[20];
PVector accd[]= new PVector[20];
void setup() {
  size(displayWidth, displayHeight);
  for (int i=0; i<loc.length; i++  ) {
    loc[i]=new PVector(random(sz, width-sz), random(sz, height-sz));
    vel[i]=PVector.random2D();
    vel[i].mult(random(-7.5, 7.5));
    acc[i]=new PVector(0, 0);
    accd[i]=new PVector(0,0);
    velc[i]=new PVector(0, 0);
  }
}

void draw() {
  background(255);
  for (int i=0; i<loc.length; i++) {
    fill(col[i]);
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    ellipse(loc[i].x, loc[i].y, sz, sz);
    if (loc[i].x+sz/2>=width || loc[i].x-sz/2<=0) {
      vel[i].x*=-1;
      if(loc[i].x+sz/2>width){
      loc[i].x=width;}
      if(loc[i].x-sz/2<0){
      loc[i].x=0;}
    }
    if (loc[i].y+sz/2>=height || loc[i].y-sz/2<=0) {
      vel[i].y*=-1;
      if(loc[i].y+sz/2>height){
      loc[i].y=height;}
      if(loc[i].y-sz/2<0){
      loc[i].y=0;}
    }
    if (dist(mouseX, mouseY, loc[i].x, loc[i].y)<sz/2) {
      col[i]=color(0, 255, 0);
    } else col[i]=color(255, 255, 255);
    for (int q=0; q<loc.length; q++) {
      for (int k=0; k<loc.length; k++) {
        if (!(i==k)) {
         
          float force = 1/sq(loc[i].dist(loc[k]));
          accd[i].add(loc[i]);
          accd[i].sub(loc[k]);
          accd[i].normalize();
          accd[i].mult(force);
          acc[i].add(accd[i]);
          
        }
      }
      if (dist(loc[i].x, loc[i].y, loc[loc.length-q-1].x, loc[loc.length-q-1].y)<sz && !(loc.length-q-1==i)) {
        vel[i].mult(vel[i], 1, velc[i]);
        vel[loc.length-q-1].mult(vel[loc.length-q-1], 1, vel[i]);
        velc[i].mult(velc[i], 1, vel[loc.length-q-1]);
      }
    }
    fill(255, 255, 255);
  }
}

