PShape s;
void setup(){
  size(200,200, P2D);
background(234,175,69);

//body

 s = createShape();
  s.beginShape();
  s.stroke(0,255,0);
  s.fill(0, 255, 0);
  s.vertex(50,110);
  s.vertex(60, 100);
  s.vertex(80, 100);
  s.vertex(90, 110);
  s.vertex(90, 130);
  s.vertex(80, 140);
  s.vertex(60, 140);
  s.vertex(50, 130);
  s.endShape(CLOSE);}
//arm1
void draw(){
stroke(0,0,255);
strokeWeight(10);
line(10,105,10,115);
line(10,115,50,115);

//arm2
line(90,115,130,115);
line(130,115,130,105);

//leg1
line(65,140,65,170);
line(65,170,50,170);

//leg2
line(77,140,77,170);
line(77,170,92,170);

//body
stroke(0,0,0);
shape(s);
//eyes
strokeWeight(1);
rect(60,110,20,10);
line(70,110,70,120);
//mouth
line(60,130,80,130);
}

