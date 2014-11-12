int x=0;
int n=abs(1000-frameCount);
void setup(){
  size(1000,1000);
  background(255,255,255);
  fill(0,0,0);
}
void draw(){
  background(255,255,255);
  rect(40,x,20,70);
  ellipse(n,40,10,10);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      x--;
    }
  }
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x++;
    }
  }
  if(
}
  
