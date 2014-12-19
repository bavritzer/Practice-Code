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
  if(shield==3){fill(0,255,0,85);}
  if(shield==2){fill(0,0,255,70);}
  if(shield==1){fill(255,0,0,75);} //colors shield based on health; third shield is a buffer
  if(shield==0){fill(0);}
  loc.add(vel);
  ellipse(loc.x-10, loc.y, 2.5*sz, 2.5*sz); //make force field
  if(shield==0){dead=true;} //was having problems with this so decided to be safe
if(loc.x>width){
dead=true;} //ships die if they go offscreen
} 
void hits(Central tempcent){
dead=true;} //dies if hits central
void hits(Orbiter temporb){
temporb.die=true; // orbiter dies, ship loses 1 life
shield--;
if(shield==0){
dead=true;}}
void hits(Sship tempship){
if(tempship.vel.mag()>vel.mag()){dead=true;}} //kill the slower ship
}
