//important note: y and x are displacements, not positions
//ji is for checking if mario has jumped
import ddf.minim.*;
Minim minim;
AudioSample bgm;
PImage coin;
PImage mario;
PImage marioback;
PImage goomba;
float dx=0;
float dy=0;
float x=0;
float y=0;
int ji;
float fc=frameCount;
float fc1=0;

boolean keys[]=new boolean[255];
int goombx=0;
int gdead=0;
int goombdx=8;
int mariomode=0;
int q=0;
int coincount=0;
char xc='x';
String coincounts;
float coinx=600;
void setup() {
  minim = new Minim(this);
  bgm=minim.loadSample("asteroid.mp3", 512);
  size(displayWidth, displayHeight);
  background(0, 0, 255);
  mario=loadImage("mario sprite.png");
  goomba=loadImage("goomba sprite.png");
  marioback=loadImage("mariobacksprite.png");
  coin=loadImage("Mario_Coin.png");
  frameRate(60);
}
void draw() {
  //movement referenced; initialize variables
  updateplayers();
  bgm.trigger();
  fc=frameCount;
  //default settings, coinage
  background(0, 0, 255);
  image(coin,width-168,75);
  textSize(20);
  String coincounts=str(xc)+str(coincount);
  text(coincounts, width-140, 95);
  
  //drawcoin if alive
  if(!(200+x+56>=coinx && 200+x<=coinx+23 && 700+y-542<=74  )  ){
 if (mariomode<2){ image(coin,coinx,589);} else{coinx=10000000;}
  
}
//move coin
  else {coincount++;if (gdead==0){coinx=random(0,width);} else coinx=100000;}
 //gravity
 if ( y<-3) {
    dy=dy+2.9;
  }
  //movement in y
  if (y<=0) {
    y=y+dy;
  }
  //prevents overshooting ground
  if (y+dy>=0 && !(dy==0)) {
    y=0;
    dy=0;
  }
  //prevents goomba going off-screen
  if (goombx<-900 || goombx+900>width) {
    goombdx=-goombdx;
  }
  //change sprites when changing direction
  if (mariomode==0 || mariomode==2) {
    image(mario, 200+x, 700+y);
  } else if (mariomode==1) {
    image(marioback, 200+x, 700+y);
  }
  // death animation
  if (mariomode==2) {


    x=500;
    y=-500;
    dy=5;

    fill(0, 0, 0);
    textSize(32);
    text("YOU LOSE", 500, 300);
  }
  //goomba movement
  if (gdead==0) {
    goombx=goombx+goombdx;
    image(goomba, 900+goombx, 716);
  }
  //ground
  fill(205, 133, 63);
  rect(0, 775, displayWidth, 700);
  // display instructions
if(mariomode<2){text("Use arrow keys, get the coins, killing the goomba/dying ends the game", 100,300);}
 //mario interaction with goomba, determines death
 if ((200+x+56>=900+goombx && 200+x<=900+goombx+57 && gdead==0)) {
    if (y>=-58  && dy>0) {
      gdead=1;}
      else if ( y>-24) {
      mariomode=2;
    }
  }

  //timer for jumping (can't mash up)
  if (fc1==(fc-32) && !(fc==32))
  {
    ji=0;
  }
 //win scenario
  if (gdead==1) {
    mariomode=3;
    text("YOU WIN!!!", 500,500);}
}
//movement
void keyPressed() {
  keys[keyCode]=true;
}
void keyReleased() {
  keys[keyCode]=false;
}
void updateplayers() {
//make sure you're not spamming w and mario is alive
  if (keys[UP] && ji==0 && mariomode<2) {
    dy=-23.5;
    ji=1;
    fc1=fc;
  }

  if (keys[RIGHT] && !(mariomode>=2)&& 200+x<=width-54) {
    x=x+6.8;
    mariomode=0;
  }
  if (keys[LEFT] && !(mariomode>=2)&& 200+x>=0) {
    x=x-6.8;
    mariomode=1;
  }
}

