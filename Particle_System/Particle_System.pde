ArrayList <Central> centers = new ArrayList <Central>() ;
ArrayList <Orbiter> orbiters = new ArrayList <Orbiter>();
float fc=0;

void setup() {
  size(displayWidth, displayHeight);
  centers.add(new Central(2*displayWidth/5, displayHeight/2));
  centers.add(new Central(3*displayWidth/5, displayHeight/2));
}


void draw() {
  background(0);
  if (mousePressed && frameCount-fc>=30) {
   
    orbiters.add(new Orbiter());
    fc=frameCount;
  }
  for (int j=0; j<orbiters.size (); j++) {
    Orbiter orber= orbiters.get(j);
    fill(255,0,0);
    if(orber.die){
    orbiters.remove(orber);} else{orber.make();}
   // orber.bwall();
    for (int i=0; i<centers.size (); i++) {
      Central currcent= centers.get(i);
      fill(0,255,0);
      currcent.make();
      orber.isattractedto(currcent);
      if(dist(currcent.loc.x, currcent.loc.y, orber.loc.x,  orber.loc.y)<orber.sz/2+currcent.sz/2){
      orber.hits(currcent);}
    }
    for (int k=0; k<orbiters.size(); k++ ) {
      Orbiter orb2=orbiters.get(k);
      if (j!=k) {
        orber.isattractedto(orb2);
        if(dist(orber.loc.x, orber.loc.y, orb2. loc.x,orb2.loc.y)<orb2.sz/2+orber.sz/2){
        orber.hits(orb2);}
      }
    }
  }
}




