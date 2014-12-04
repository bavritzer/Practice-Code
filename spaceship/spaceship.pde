boolean keys[]=new boolean[255];
Spaceship ship1;
void setup() {
  size(displayWidth, displayHeight);
  ship1=new Spaceship();
}

void draw() {
  background(0);
  ship1.make();
  ship1.updateplayers();
  ship1.move();
}

class Spaceship {
  PVector loc, vel, acc;
  int sz=25;
  Spaceship() {
    loc=new PVector(width/2, height-3*sz);
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
  }
  void make() {

    triangle(loc.x-sz, loc.y, loc.x+sz, loc.y, loc.x, loc.y-2*sz);
  }
  void move() {
    loc.add(vel);
    vel.add(acc);
    if (keyPressed) {
      keys[key]=true;
    } else {
      keys[key]=false;
      vel.set(0, 0);
      acc.set(0, 0);
    }
  }


  void updateplayers() {

    if (keys['s'] && loc.y<height) {
      acc.y=.3;
    } else
    {
      if (keys['w'] && loc.y+2*sz+3>=3) {
        acc.y=-.3;
      } else {acc.y=0; 
      vel.y=0;}
    }
    if (keys['d'] && loc.x+sz<=width ) {
      acc.x=.3;
    } else {
      if (keys['a'] && loc.x-sz>=0) {
        acc.x=-.3;
      } else {
        acc.x=0;
        vel.x=0;
      }
    }
    //    if (loc.x+sz>=width  && !(key=='a') && !(key=='s') && !(key=='w')) {
    //      acc.set(0, 0);
    //      vel.set(0, 0);
    //      loc.x=width;
    //    }
    //    if (loc.x -sz <=0 && !(key=='d') && !(key=='s') && !(key=='w')) {
    //      loc.x=0;
    //      acc.set(0, 0);
    //      vel.set(0, 0);
    //    }
    //    if (loc.y+2*sz<=0 && !(key=='d') && !(key=='s') && !(key=='a')) {
    //      acc.set(0, 0);
    //      vel.set(0, 0);
    //      loc.y=0;
    //    }
    //    if (loc.y>=height && !(key=='d') && !(key=='w') && !(key=='a')) {
    //      acc.set(0, 0);
    //      vel.set(0, 0);
    //      loc.y=height;
    //    }
  }
}
class bullets {
}

