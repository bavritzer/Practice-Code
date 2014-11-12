float x[]= new float[3];
float y[]= new float[3];
float dx[]=new float[3];
float dy[]=new float[3];
float paddlex[]=new float[6];
float paddley[]=new float[6];
boolean keys[]=new boolean[255];

void setup(){
size(displayWidth, displayHeight);
background(255);
rectMode(RADIUS);
ellipseMode(RADIUS);
for(int i=0; i<x.length; i++){
  x[i]=500;
  y[i]=500;
  dx[i]=5;
  dy[i]=5;
}
for(int i=0; i<paddlex.length; i++){
if(i<=3){
paddlex[i]=0;
}
else {paddlex[i]=width-50;}
paddley[i]=50*(i+1);

}
}
    


void draw(){
  background(255,255,255);
  for(int i=0; i<paddlex.length;i++){
  }
  for(int i=0; i<x.length; i++){
  }
}
void keyPressed(){
  if(keyCode==false){
  keys[key]=true;}}
void keyReleased(){
  if(keyCode==false){
  keys[key]=false;}}
  void updateplayers(){
  if(keys['q']){
    paddley[1]=paddley-4;
  }
if(keys['w']){
paddley[1]=paddley[1]+4;}}
