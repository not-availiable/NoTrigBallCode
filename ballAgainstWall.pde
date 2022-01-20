Ball b;
Player p;
boolean[] move = new boolean[4];

void setup()
{
  size(600, 600);
  b = new Ball(width/2, width/2, width/2, width/2, 2, 2);
  p = new Player(100, 100, 30);
}

void draw()
{
  background(200);
  p.getInput(move, 2);
  collided();
  b.Update();
  p.Update();
}

void collided()
{
  float x1 = b.getX();
  float y1 = b.getY();
  float x2 = p.getX();
  float y2 = p.getY();
  float s1 = b.getSize();
  float s2 = p.getSize();

  if (dist(x1, y1, x2, y2) <= s1+s2)
  {
    b.setOldX(x2);
    b.setOldY(y2);
  }
}

void keyPressed()
{
  switch (key)
  {
    case 'w':
      move[0] = true;
      break;
    case 's':
      move[1] = true;
      break;
    case 'a':
      move[2] = true;
      break;
    case 'd':
      move[3] = true;
      break;
  }
}

void keyReleased()
{
  switch (key)
  {
    case 'w':
      move[0] = false;
      break;
    case 's':
      move[1] = false;
      break;
    case 'a':
      move[2] = false;
      break;
    case 'd':
      move[3] = false;
      break;
  }
}
