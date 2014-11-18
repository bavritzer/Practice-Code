float x, y, vx, vy, ax, ay;
void setup(){
  size(displayWidth,displayHeight);
  background(255);
  x=width/2;
  y=height/2;
  vx=0;
  vy=0;
  ax=0;
  ay=0;
colorMode(HSB);}
 void draw(){
   fill(x%360, 100,100,100);
   ax=random(-.1,.1);
ay=random(-.1,.1);
x+=vx;
y+=vy;
vx+=ax;
vy+=ay;
ellipse(x,y,20,20);
if(x-20>width){
  x=20;}
  if((x+20)<0){
    x=width-20;}
    if(y-20>height){
  y=20;}
  if((y+20)<0){
    y=height-20;}
} 
  

