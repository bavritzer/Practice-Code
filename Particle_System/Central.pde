class Central //describes central bodies
{
  PVector loc;
  float sz;
  Central(float tempx,float tempy) {
   loc=new PVector(tempx,tempy);
   sz=50;
  }
  void make(){
    ellipse(loc.x, loc.y, sz, sz); //makes central body
  }
  

}
