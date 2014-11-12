PImage bird;
PImage boom;
PImage pig;
float x=50;
float y=400;
float a=.2;
float v=0;
float vx=0;
float vy=0;
int n=0;
int dx=2;
int dy=4;
void setup() {
  size(1000, 500);
fill(0,0,0);
 
bird = loadImage("bird.png");
pig=loadImage("pig.jpg");
boom=loadImage("images.jpg");
  frameRate(60);
}


void draw() {
  background(255, 255, 255);
  if (x>=width || ((x>=400 && x<=425) && ((y>=400) || (y<=100)))){
  vx=-vx;}
   if (x<0){
    vx=-vx;
  }
  if ((y>500) || (y<0)){
    vy=-vy;}
  
   if ((frameCount<200) && (mousePressed)){ 
      v=v+a;
  
  vx=v/2;
   
  vy=-(v*.8660254);
line(50.0,400.0,(30*vx+50.0),(400+30*vy));}
  if (frameCount>=200){
  vy=(vy+.098);
   x=x+vx;
  y=y+vy;
  
  }
  fill(0, 0, 0);
  ellipse(x, y, 40, 40);
  rect(400, 400, 25, 200);
  rect(400, 0,25,100);
image(bird, x-20, y-20);
if( !(abs(x-700)<20 && abs(y-400)<20)){
image(pig, 700, 400);
}
else {image(boom, 600,300);
noLoop();}
}

