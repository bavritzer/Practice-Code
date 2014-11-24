int num=10000;
PVector loc[]=new PVector[num];
PVector vel[]=new PVector[num];
PVector acc[]=new PVector[num];
float sz=10;
PImage sanservino;
int numfell=0;
void setup() {

    sanservino=loadImage("sanservino.jpg");
  size(sanservino.width, sanservino.height);
  for ( int i=0; i<loc.length; i++)
  {
    loc[i]=new PVector(random(sz, width-sz), random(-height+sz,sz));
    vel[i]=new PVector(0, 0);
    acc[i]=new PVector(0, 0);
    noStroke();
  }
  
 

}


void draw() {

  background(sanservino);
   
  for ( int i=0; i<loc.length; i++)
  {loc[i].add(vel[i]);
  vel[i].add(acc[i]);
if(! (loc[i].y+3*sz/2+(numfell*.05)>=99*height/100)){
  acc[i].set(random(-.05,.05),.98-.18*vel[i].magSq());
}
  fill(255,255,255,200);
ellipse(loc[i].x, loc[i].y, sz, sz);
if(loc[i].y+3*sz/2+(numfell*.05)>=99*height/100){
  if(vel[i].x!=0){numfell++;}
vel[i].set(0,0);
acc[i].set(0,0);
}
}
}

