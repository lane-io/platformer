import fisica.*;

FWorld world;

PImage map;
int x = 0;
int y = 0;
int gridSize = 65;

FBox player1;
float vx;

boolean upkey, downkey, leftkey, rightkey;
boolean wkey, akey, skey, dkey;
boolean spacekey;

color black = #000000;

void setup() {

  size(600, 600);

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 2000);

  map = loadImage ("platformerMap.png");

  while (y < map.height) {

    color c = map.get(x, y);

    if (c == black) {
      FBox b = new FBox(gridSize, gridSize);
      b.setFillColor(black);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      world.add(b);
    }

    x++;

    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  player1 = new FBox (20, 20);
  player1.setPosition (50, 50);
  player1.setFill(255, 255, 0);
  player1.setRestitution(0);
  world.add(player1);
}

void draw() {

  background(255);

  world.step();
  world.draw();

  vx = 0;
  if (leftkey) vx = -300;
  if (rightkey) vx = 300;

  player1.setVelocity(vx, player1.getVelocityY());

  ArrayList<FContact> contacts = player1.getContacts();
  if (upkey && contacts.size() > 0) player1.setVelocity (player1.getVelocityX(), -500);
}
