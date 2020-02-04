class FBomb extends FBox {

  int timer;

  FBomb() {
    super(20, 20);
    timer = 60;
    this.setFill(255, 0, 0);
    this.setPosition(player1.getX() + 20, player1.getY() + 20);
    world.add(this);
  }

  void act() {
    timer--;
    if (timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
    }
  }
  
  void explode() {
    for (int i = 0; i < boxes.size(); i++) {
      FBox b = boxes.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 200);
      float vx = (b.getX() - this.getX()) * 5;
      float vy = (b.getY() - this.getY()) * 5;
      b.setVelocity(vx, vy);
      b.setStatic(false);
    }
  }
}
