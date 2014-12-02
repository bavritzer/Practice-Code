boolean keys[]=new boolean[255];
void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  background(0);
}

class spaceship {
  PVector loc, vel, acc;
  int sz=25;
  spaceship() {
    loc=new PVector(width/2, height-50);
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
  }
  void make() {
    updateplayers();
    triangle(loc.x-sz, loc.y, loc.x+sz, loc.y, loc.x, loc.y+2*sz);
  }
  void move() {
    loc.add(vel);
    vel.add(acc);
  }
  void keyPressed() {
    keys[keyCode]=true;
  }
  void keyReleased() {
    keys[keyCode]=false;
  }
  void updateplayers() {
    //make sure you're not spamming w and mario is alive
    if (keys[UP] && loc.y+2*sz+3<height) {
    loc.y+=3;}
    if (keys[DOWN] && loc.y>=3) {
    loc.y-=3;}
    if (keys[RIGHT] && loc.x+sz<=width-3 ) {
    loc.x+=3;}
    if (keys[LEFT] && loc.x-sz>=3) {
    loc.x+=3;}
  }
}

class bullets {
}

