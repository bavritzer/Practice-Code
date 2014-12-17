class Central  {
  PVector loc, vel, acc;
  float sz;
  Central(float tempx,float tempy) {
   loc=new PVector(tempx,tempy);
   sz=50;
  }
  void make(){
    ellipse(loc.x, loc.y, sz, sz);
  }
  

}
