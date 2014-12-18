ArrayList <Central> centers = new ArrayList <Central>() ;
ArrayList <Orbiter> orbiters = new ArrayList <Orbiter>();
ArrayList <Sship> ships = new ArrayList<Sship>();
float fc=0; 
float fc3=0;//timer variables
int score=0;

void setup() {
  size(displayWidth, displayHeight);
  centers.add(new Central(2*displayWidth/5, displayHeight/2));
  centers.add(new Central(3*displayWidth/5, displayHeight/2)); //make 2 centrals on the screen toward the center
  orbiters.add(new Orbiter(-900,-900)); //stops crashes involving no orbiters
}


void draw() {
  background(0);
  textSize(15);
  text(score, 50, 50);// show score
  if (mousePressed && frameCount-fc>=30) //makes game challenging by restricting ball addition
  {
    orbiters.add(new Orbiter(mouseX, mouseY));
    fc=frameCount;
  }
  
  if (frameCount-fc3>=60) { //makes spaceships every sec 
    ships.add(new Sship());
    fc3=frameCount;
  }
  
  for (int l=0; l<ships.size (); l++) {
    Sship myship= ships.get(l);
    myship.make();
    if (myship.dead==true) {
      ships.remove(myship);
      score++;
    }

    for (int j=0; j<orbiters.size(); j++) {
      Orbiter orber= orbiters.get(j);
      fill(255, 0, 0);
      if (orber.die) {
        orbiters.remove(orber);
      } else {
        orber.make();
      }
      
      // orber.bwall(); //decided it works better without wall bounce but option exists
      for (int i=0; i<centers.size(); i++) {
        Central currcent= centers.get(i); //loops through all centrals
        fill(0, 255, 0);
        currcent.make();

        orber.isattractedto(currcent); //attract orbiter to central
        if (dist(currcent.loc.x, currcent.loc.y, orber.loc.x, orber.loc.y)<orber.sz/2+currcent.sz/2) {
          orber.hits(currcent);
        } //orbiter hits central if it's touching it

          if (dist(currcent.loc.x, currcent.loc.y, myship.loc.x, myship.loc.y)<myship.sz+currcent.sz/2) {
          myship.hits(currcent);
        } //ship hits central if it's touching it

          if (dist(myship.loc.x, myship.loc.y, orber.loc.x, orber.loc.y)<orber.sz/2+currcent.sz/2) {
          myship.hits(orber);
          orber.hits(myship);
        } //orbiter hits ship if it's touching it
      }
      for (int k=0; k<orbiters.size (); k++ ) {
        Orbiter orb2=orbiters.get(k); //loops through orbiters for attraction and collision purposes
        if (j!=k) {
          orber.isattractedto(orb2);
          if (dist(orber.loc.x, orber.loc.y, orb2. loc.x, orb2.loc.y)<orb2.sz/2+orber.sz/2) {
            orber.hits(orb2);
          }
        }// orbiter collision
        for (int m=0; m<ships.size (); m++) {
          Sship ship2=ships.get(m);
          if (dist(ship2.loc.x, ship2.loc.y, myship. loc.x, myship.loc.y)<myship.sz+ship2.sz && m!=l) {
            myship.hits(ship2);
          } //ship ship collision
        }
      }
    }
  }
  
 
}



