boolean keys[]=new boolean[255];
float x[]=new float[100];
float y[]=new float[100];
int count=x.length;
void setup() {
  size(displayWidth, displayHeight);
  for (int i=4; i>=0; i--) {
    x[i]=random(width);
    y[i]=random(height);
  }
}

void draw() {
  background(255);
  for (int i = 0; i<count-1; i++) {
  x[i]=x[i+1]-1;
y[i]=y[i+1];}
for (int i=count-1; i>=0; i--){

ellipse(x[i], y[i], 40,40);
}
update();

  

  
}

void keyPressed() {
  keys[keyCode]=true;
}
void keyReleased() {
  keys[keyCode]=false;
}
void update(){
  if (keys[RIGHT]){
  x[count-1]+=5;}
  if (keys[LEFT]){
  x[count-1]-=5;}
  if (keys[UP]){
  y[count-1]-=5;}
  if(keys[DOWN]){
  y[count-1]+=5;}
}

