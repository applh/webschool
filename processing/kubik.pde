/**
 * KUBIK. 
 * 
 * The camera lifts up (controlled by mouseY) while looking at the same point.
 */


long playerX = 256;
long playerY = 0;
long playerZ = 0;
long playerR = 16;

long worldXmin=-256;
long worldXmax=256;

long worldYmin=-256;
long worldYmax=256;

long worldZmin=-256;
long worldZmax=256;

long pdx = 0;
long pdy = 1;
long pdz = 1;

long camX=0;
long camY=0;
long camZ=0;

void setup() {
  size(1000, 1000, P3D);
  fill(204);
}

void draw() {
  updateScene();
  
  lights();
  background(0);
  
  // Change height of the camera with mouseY
  camera(camX, camY, camZ, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  
  stroke(255, 0, 0);
  line(0, 0, 0, 1000, 0, 0);
  
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 1000, 0);
  
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 1000);

  stroke(255, 200, 0);
  line(0, 0, 0, -1000, 0, 0);
  
  stroke(0, 255, 200);
  line(0, 0, 0, 0, -1000, 0);
  
  stroke(200, 0, 255);
  line(0, 0, 0, 0, 0, -1000);

  stroke(255, 255, 255);
  box(512); // center at 0, 0, 0
  sphere(360);

  translate(playerX, playerY, playerZ);
  stroke(255, 255, 0);
  sphere(8);


}

long pdx0 = round(random(-10,10));
long pdy0 = round(random(-10,10));
long pdz0 = round(random(-10,10));

void updateScene() {
  
  if (playerX < worldXmin) {
    pdx=round(abs(pdx));
  } 
  if (playerX > worldXmax) {
    pdx=-round(abs(pdx));
  } 

  if (playerY < worldYmin) {
    pdy=round(abs(pdy));
  } 
  if (playerY > worldYmax) {
    pdy=-round(abs(pdy));
  } 

  if (playerZ < worldZmin) {
    pdz=round(abs(pdz));
  } 
  if (playerZ > worldZmax) {
    pdz=-round(abs(pdz));
  } 

  long sp2=round(random(10, 100));
  long sp2x=round(random(10, 100-sp2));
  long sp2y=round(random(10, 100-sp2-sp2x));
  long sp2z=round(random(10, 100-sp2-sp2x-sp2y));
  
  playerX +=pdx * sqrt(sp2x);
  playerY +=pdy *.5 * sqrt(sp2y);
  playerZ +=pdz *.5 * sqrt(sp2z);

  pdx0 += round(random(-1,1)); 
  pdy0 += round(random(-1,1)); 
  pdz0 += round(random(-1,1)); 
  
  if (abs(pdx0) > 10) pdx0=pdx0/4;
  if (abs(pdy0) > 10) pdy0=pdy0/4;
  if (abs(pdz0) > 10) pdz0=pdz0/4;
  
  playerX +=pdx * pdx0;
  playerY +=pdy * pdy0;
  playerZ +=pdz * pdz0;

  if (abs(playerX) > 2.0*worldXmax) playerX = round(.6 * playerX); 
  if (abs(playerY) > 2.0*worldYmax) playerY = round(.6 * playerY); 
  if (abs(playerZ) > 2.0*worldZmax) playerZ = round(.6 * playerZ); 

  if ((playerX >= worldXmax) && (playerY >= worldYmax) && (abs(playerZ) < abs(worldZmax))) {
    // edge 12
    if (pdx == 0) // face 1
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmax; println("2");} // goto face 2
    else if (pdy == 0) // face 2
      { pdx=0; pdy=1; pdz=1; playerY=0; playerZ=0; playerX=worldXmax; println("1");} // goto face 1
  }
  if ((playerX <= worldXmin) && (playerY <= worldYmin) && (abs(playerZ) < abs(worldZmax))) {
    // edge 15
    if (pdx == 0) // face 1
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmin; println("5");} // goto face 5
    else if (pdy == 0) // face 5
      { pdx=0; pdy=1; pdz=1; playerY=0; playerZ=0; playerX=worldXmax; println("1");} // goto face 1
  }

  if ((playerX >= worldXmax) && (playerZ >= worldZmax) && (abs(playerY) < abs(worldYmax))) {
    // edge 13
    if (pdx == 0) // face 1
      { pdx=1; pdy=1; pdz=0; playerX=0; playerY=0; playerZ=worldZmax; println("3");} // goto face 3
    else if (pdz == 0) // face 3
      { pdx=0; pdy=1; pdz=1; playerY=0; playerZ=0; playerX=worldXmax; println("1");} // goto face 1
  }
  if ((playerX >= worldXmax) && (playerZ <= worldZmin) && (abs(playerY) < abs(worldYmax))) {
    // edge 14
    if (pdx == 0) // face 1
      { pdx=1; pdy=1; pdz=0; playerX=0;playerY=0; playerZ=worldZmin; println("4");} // goto face 4
    else if (pdz == 0) // face 4
      { pdx=0; pdy=1; pdz=1; playerY=0; playerZ=0; playerX=worldXmax; println("1");} // goto face 1
  }

  if ((playerY >= worldYmax) && (playerZ >= worldZmax) && (abs(playerX) < abs(worldXmax))) {
    // edge 23
    if (pdy == 0) // face 2
      { pdx=1; pdy=1; pdz=0; playerX=0; playerY=0; playerZ=worldZmax; println("3");} // goto face 3
    else if (pdz == 0) // face 3
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmax; println("2");} // goto face 2
  }
  if ((playerY >= worldYmax) && (playerZ <= worldZmin) && (abs(playerX) < abs(worldXmax))) {
    // edge 24
    if (pdy == 0) // face 2
      { pdx=1; pdy=1; pdz=0; playerX=0;playerY=0; playerZ=worldZmin; println("4");} // goto face 4
    else if (pdz == 0) // face 4
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmax; println("2");} // goto face 2
  }
  if ((playerX <= worldXmin) && (playerY >= worldYmax) && (abs(playerZ) < abs(worldZmax))) {
    // edge 62
    if (pdx == 0) // face 6
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmax; println("2");} // goto face 2
    else if (pdy == 0) // face 2
      { pdx=0; pdy=1; pdz=1; playerX=worldXmin; playerZ=0; playerY=0; println("6");} // goto face 6
  }

  if ((playerY <= worldYmin) && (playerZ >= worldZmax) && (abs(playerX) < abs(worldXmax))) {
    // edge 53
    if (pdy == 0)  // face 5
      { pdx=1; pdy=1; pdz=0; playerX=0; playerY=0; playerZ=worldZmax; println("3");} // goto face 3
    else if (pdz == 0) // face 3
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmin; println("5");} // goto face 5
  }
  if ((playerY <= worldYmin) && (playerZ >= worldZmax) && (abs(playerX) < abs(worldXmax))) {
    // edge 54
    if (pdy == 0)  // face 5
      { pdx=1; pdy=1; pdz=0; playerX=0;playerY=0; playerZ=worldZmin; println("4");} // goto face 4
    else if (pdz == 0) // face 4
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmin; println("5");} // goto face 5
  }

  if ((playerX <= worldXmin) && (playerZ >= worldZmax) && (abs(playerY) < abs(worldYmax))) {
    // edge 63
    if (pdx == 0) // face 6
      { pdx=1; pdy=1; pdz=0; playerX=0; playerY=0; playerZ=worldZmax; println("3");} // goto face 3
    else if (pdz == 0) // face 3
      { pdx=0; pdy=1; pdz=1; playerX=worldXmin; playerZ=0; playerY=0; println("6");} // goto face 6
  }
  if ((playerX <= worldXmin) && (playerZ <= worldZmin) && (abs(playerY) < abs(worldYmax))) {
    // edge 64
    if (pdx == 0) // face 6
      { pdx=1; pdy=1; pdz=0; playerX=0;playerY=0; playerZ=worldZmin; println("4");} // goto face 4
    else if (pdy == 0) // face 4
      { pdx=0; pdy=1; pdz=1; playerX=worldXmin; playerZ=0; playerY=0; println("6");} // goto face 6
  }
  if ((playerX <= worldXmin) && (playerZ <= worldZmin) && (abs(playerY) < abs(worldYmax))) {
    // edge 65
    if (pdx == 0) // face 6
      { pdx=1; pdy=0; pdz=1; playerX=0; playerZ=0; playerY=worldYmin; println("5");} // goto face 5
    if (pdy == 0)  // face 5
      { pdx=0; pdy=1; pdz=1; playerX=worldXmin; playerZ=0; playerY=0; println("6");} // goto face 6
  }

  //println("PLAYER("+playerX+","+playerY+","+playerZ+")");
  //println("DELTA("+pdx+","+pdy+","+pdz+")");
  //println("WORLD("+worldXmax+","+worldYmax+","+worldZmax+")");
  //println("WORLD("+worldXmin+","+worldYmin+","+worldZmin+")");
  
  camX=3*playerX;
  camY=3*playerY;
  camZ=3*playerZ;
  
}
