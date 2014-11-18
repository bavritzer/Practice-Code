float x, y, z, vx, vy, vz, ax, ay, az;
PVector pos, vel, acc;


void setup() {
  size(1000, 1000, P3D);
  background(255);
    x=width/2;
    y=height/2;
    z=10;
    vx=1;
    vy=1;
    vz=1;
    ax=1;
    ay=1;
    az=1;
  pos=new PVector(width/2, height/2, 10);
  vel=new PVector(1, 1, 1);
  acc=new PVector(1, 1, 1);
  colorMode(HSB);
  noStroke();
}
void draw() {
  fill(x%360, 100, 100, 100);
  
  translate(pos.x, pos.y, pos.z);
  box(20);
  pos.add(vel);
  vel.add(acc);
  acc.cross(pos);
}

void mousePressed() {
  acc=PVector.random3D();
}

