float x, y, vx, vy, ax, ay;
PVector pos= new PVector(x,y);
PVector vel= new PVector(vx,vy);
PVector acc= new PVector(ax,ay);
void setup(){
  size(displayWidth,displayHeight);
  background(255);
  x=width/2;
  y=height/2;
  vx=.1;
  vy=.1;
  ax=.01;
  ay=.01;
colorMode(HSB);
pos= new PVector(x,y);
vel= new PVector(vx,vy);
acc= new PVector(ax,ay);}
 void draw(){
   fill(frameCount%360, 100,100);
acc.random2D();
vel.add(acc);
pos.add(vel);

ellipse(pos.x,pos.y,20,20);
if(pos.x-20>width){
  pos.x=-20;}
  if((pos.x+20)<0){
    pos.x=width+20;}
    if(pos.y-20>height){
  pos.y=-20;}
  if((pos.y+20)<0){
    pos.y=height+20;}
} 
  

