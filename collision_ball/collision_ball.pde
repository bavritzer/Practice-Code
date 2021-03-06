int numballs=20; 
PVector loc[]= new PVector[numballs];
PVector vel[]=new PVector[numballs];
PVector acc[]=new PVector[numballs];
int sz=40;
color col[]= new color[numballs];
PVector velc[]= new PVector[numballs];
PVector accd[]= new PVector[numballs];
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
    if (loc[i].x+sz/2>=width ) {
      vel[i].x=-abs(vel[i].x);
      loc[i].x=width-sz/2;
    }
    if( loc[i].x-sz/2<=0){
    vel[i].x=abs(vel[i].x);
  loc[i].x=sz/2;}
    if (loc[i].y+sz/2>=height) {
      vel[i].y=-abs(vel[i].y);
      loc[i].y=height-sz/2;
    }
    if(loc[i].y-sz/2<=0){
    vel[i].y=abs(vel[i].y);
  loc[i].y=sz/2;}
    if (dist(mouseX, mouseY, loc[i].x, loc[i].y)<sz/2) {
      col[i]=color(0, 255, 0);
    } else col[i]=color(255, 255, 255);
   acc[i].set(0,0);
    for (int q=0; q<loc.length; q++) {
      for (int k=0; k<loc.length; k++) {
        if (!(i==k)) {
         accd[i].set(0,0);
          float force = (2000/numballs)/sq(loc[i].dist(loc[k]));
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

