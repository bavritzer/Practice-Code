PShape s;
int x=-100;
void setup(){
  size(1000,1000, P2D);
background(234,175,69);

//body

 s = createShape();
  s.beginShape();
  s.stroke(0,255,0);
  s.fill(0, 255, 0);
  s.vertex(x+50,x+110);
  s.vertex(x+60, x+100);
  s.vertex(x+80, x+100);
  s.vertex(x+90, x+110);
  s.vertex(x+90, x+130);
  s.vertex(x+80, x+140);
  s.vertex(x+60, x+140);
  s.vertex(x+50, x+130);
  s.endShape(CLOSE);}
//arm1
void draw(){
stroke(0,0,255);
strokeWeight(10);
line(x+10,x+105,x+10,x+115);
line(x+10,x+115,x+50,x+115);

//arm2
line(x+90,x+115,x+130,x+115);
line(x+130,x+115,x+130,x+105);

//leg1
line(x+65,x+140,x+65,x+170);
line(x+65,x+170,x+50,x+170);

//leg2
line(x+77,x+140,x+77,x+170);
line(x+77,x+170,x+92,x+170);

//body
stroke(0,0,0);
shape(s);
//eyes
strokeWeight(1);
rect(x+60,x+110,20,10);
line(x+70,x+110,x+70,x+120);
//mouth
line(x+60,x+130,x+80,x+130);
x=x+50;
}

