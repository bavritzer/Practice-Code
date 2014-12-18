class Sship{
  boolean dead=false; 
  int shield=3;
  float sz;
  PVector loc, vel;
 Sship(){
   loc=new PVector(0,random(100, height-100)); //make random spaceships with random velocity
   vel= new PVector(random(1,9),0);
 sz=12;}
void make(){
  fill(255,255,255);
  triangle(loc.x-sz, loc.y-sz, loc.x-sz, loc.y+sz, loc.x+sz, loc.y); //draw ships
  if(shield==3){fill(0,255,0,50);}
  if(shield==2){fill(0,0,255,50);}
  if(shield==1){fill(255,0,0,50);} //colors shield based on health
  loc.add(vel);
  ellipse(loc.x, loc.y, 2*sz, 2*sz);
  if(shield==0){dead=true;}
} 
void hits(Central tempcent){
dead=true;} //dies if hits central
void hits(Orbiter temporb){
temporb.die=true;
shield--;}
void hits(Sship tempship){
if(tempship.vel.mag()>vel.mag()){dead=true;}}
}
