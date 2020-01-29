import fisica.*;

PImage map;
int x = 0;
int y = 0;
int gridSize = 50;

color black = #000000;

FWorld world;

void setup() {
  
  size(450, 450);
  
  Fisica.init(this);
  world = new FWorld();
  
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
}

void draw() {
  
  background(255);
  
  world.step();
  world.draw();
}
