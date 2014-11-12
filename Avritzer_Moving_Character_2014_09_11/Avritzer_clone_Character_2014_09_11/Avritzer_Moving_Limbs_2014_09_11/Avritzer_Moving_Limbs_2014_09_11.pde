PShape s;
float x=0;
float y=0;
int i=0;
int j=0;
float q=0;
float z=0;
float u=0;
float e=0;
void setup(){
  size(1000,1000, P2D);
background(234,175,69);
frameRate(8);

//body

 s = createShape();
  s.beginShape();
  s.stroke(0,255,0);
  s.fill(0, 255, 0);
  s.vertex(x-20,y);
  s.vertex(x-10, y-10);
  s.vertex(x+10, y-10);
  s.vertex(x+20, y);
  s.vertex(x+20, y+20);
  s.vertex(x+10, y+30);
  s.vertex(x-10, y+30);
  s.vertex(x-20, y+20);
  s.endShape(CLOSE);}
//arm1
void draw(){
 background(255,255,255);
 x=500;
 y=300;
 if (mousePressed==true){
   q=random(-10,10);
   e++;
  
 } 
   else {q=0;
  
 u=0;
 z=0;}
  
stroke(0,0,255);
strokeWeight(10);
line(x-60,y-5+q,x-60,y+5+q);
line(x-60,y+5+q,x-20,y+5+q);

//arm2
line(x+20,y+5+q,x+60,y+5+q);
line(x+60,y+5+q,x+60,y-5+q);

//leg1
line(x-5+q,y+30,x-5,y+60);
line(x-5+q,y+60,x-20,y+60);

//leg2
line(x+7+q,y+30,x+7,y+60);
line(x+7+q,y+60,x+22,y+60);

//body
stroke(0,0,0);
shape(s,x,y);
//eyes
strokeWeight(1);
rect(x-10,y,20,10);
line(x,y,x,y+10);
//mouth
line(x-10,y+20,x+10,y+20);
translate(width/2, height/2);
rotateY(e*PI/180);

rect(-26, -26, 52, 52);
ellipse(25,123,24,56);

  



}

