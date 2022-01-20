public class Player
{
  private float x, y, size;
  private float vX, vY;
  
  public Player(float X, float Y, float s)
  {
    x = X;
    y = Y;
    size = s;
  }
  
  void Update()
  {
    x+=vX;
    y+=vY;
    ellipse(x, y, 2 * size, 2 * size);
    keepInBoundaries();
  }
  
  void keepInBoundaries()
  {
    if (x - size < 0) x = size;
    if (x + size > width) x = width - size;
    if (y - size < 0) y = size;
    if (y + size > height) y = height - size;
  }
    
  
  void getInput(boolean[] m, float speed)
  {
    vY = -speed * (m[0] ? 1 : 0) + speed * (m[1] ? 1 : 0);
    vX = -speed * (m[2] ? 1 : 0) + speed * (m[3] ? 1 : 0);
  }
  
  float getX() { return x; }
  float getY() { return y; }
  float getSize() { return size; }
}
