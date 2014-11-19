PVector loc[]= new PVector[5];
PVector vel[]=new PVector[5];
PVector acc[]=new PVector[5];
int sz=40;
color col[]= new color[5];
void setup() {
  size(displayWidth, displayHeight);
  for (int i=0; i<loc.length; i++  ) {
    loc[i]=new PVector(width/2, height/2);
    vel[i]=PVector.random2D();
    vel[i].mult(random(-5, 5));
    acc[i]= new PVector(0, 0);
  }
}

void draw() {
  background(255);
  for (int i=0; i<loc.length; i++) {
    fill(col[i]);
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    ellipse(loc[i].x, loc[i].y, sz, sz);
    if (loc[i].x+sz>=width || loc[i].x-sz<=0) {
      vel[i].x*=-1;
    }
    if (loc[i].y+sz>=height || loc[i].y-sz<=0) {
      vel[i].y*=-1;
    }
    if (dist(mouseX, mouseY, loc[i].x, loc[i].y)<sz/2) {
      col[i]=color(0, 255, 0);
    } else col[i]=color(255, 255, 255);
    for (int q=0; q<loc.length; q++) {
      if (dist(loc[i].x, loc[i].y, loc[loc.length-q-1].x, loc[loc.length-q-1].y)<sz && !(loc.length-q-1==i)) {
      vel[i].mult(-1);
    vel[loc.length-q-1].mult(-1);}
    }
    fill(255, 255, 255);
  }
}

