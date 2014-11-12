PShape s;
float x=mouseX;
float y=mouseY;
int i=0;
int j=0;
void setup(){
  size(1000,1000, P2D);
background(234,175,69);

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
 
  
stroke(0,0,255);
strokeWeight(10);
line(x-60,y-5,x-60,y+5);
line(x-60,y+5,x-20,y+5);

//arm2
line(x+20,y+5,x+60,y+5);
line(x+60,y+5,x+60,y-5);

//leg1
line(x-5,y+30,x-5,y+60);
line(x-5,y+60,x-20,y+60);

//leg2
line(x+7,y+30,x+7,y+60);
line(x+7,y+60,x+22,y+60);

//body
stroke(0,0,0);
shape(s,x,y);
//eyes
strokeWeight(1);
rect(x-10,y,20,10);
line(x,y,x,y+10);
//mouth
line(x-10,y+20,x+10,y+20);
if (i%10==1){
  x=0;
 
}
  
if (i<11){
i++;
x=x+150;}
else{
y=y+150;
i=1;}


}

