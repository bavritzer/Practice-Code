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
  orbiters.add(new Orbiter(-90000000,-900000000)); //stops crashes involving no orbiters
}


void draw() {
  background(0);
  textSize(15);
  text(score, 50, 50);// show score
  text("Click to make ball. Ball has gravity. Hit ship twice to kill.", width-700, 50);
  if (mousePressed && frameCount-fc>=17) //makes game challenging by restricting ball addition
  {
    orbiters.add(new Orbiter(mouseX, mouseY));
    fc=frameCount;
  }
  
  if (frameCount-fc3>=30) { //makes spaceships every half second
    ships.add(new Sship());
    fc3=frameCount;
  }
  
  for (int l=ships.size()-1; l>=0; l--) {
    Sship myship= ships.get(l);
   
    if (myship.dead==true) {
      ships.remove(myship);
      if(myship.loc.x<=width){score++; }//killing a spaceship makes score go up, they die offscreen
    }
    else{ myship.make();}

    for (int j=orbiters.size()-1; j>=0; j--) {
      Orbiter orber= orbiters.get(j);
      fill(255, 0, 0); //make a red orbiter
      if (orber.die) {
        orbiters.remove(orber);
      } else {
        orber.make(); //if it dies, don't make it; if not, make it
      }
      
      // orber.bwall(); //decided it works better without wall bounce but option exists
      for (int i=centers.size()-1; i>=0; i--) {
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
      for (int k=orbiters.size()-1; k>=0; k-- ) {
        Orbiter orb2=orbiters.get(k); //loops through orbiters for attraction and collision purposes
        if (j!=k) {
          orber.isattractedto(orb2);
          if (dist(orber.loc.x, orber.loc.y, orb2. loc.x, orb2.loc.y)<orb2.sz/2+orber.sz/2) {
            orber.hits(orb2); //orbiters are attracted to each other; if they collide, one gets bigger
          }
        }// orbiter collision
        for (int m=ships.size()-1; m>=0; m--) {
          Sship ship2=ships.get(m);
          if (dist(ship2.loc.x, ship2.loc.y, myship. loc.x, myship.loc.y)<myship.sz+ship2.sz && m!=l) {
            myship.hits(ship2);
          } //ship ship collision
        }
      }
    }
  }
  
 
}




