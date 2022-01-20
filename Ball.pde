public class Ball 
{
  float x, y, oldX, oldY, maxVX, maxVY;
 
  float bounce = 1;
  float gravity = 0;
 
  float size = 10;
  float friction = .999;
 
  public Ball(float X, float Y, float oX, float oY, float mVX, float mVY)
  {
    x = X;
    y = Y;
    oldX = oX;
    oldY = oY;
    
    maxVX = mVX;
    maxVY = mVY;
  }
 
  public void Update()
  { 
    float vX = ((x - oldX) * friction);
    float vY = ((y - oldY) * friction);
    
    //using a logistical function 1/(1+e^-k(x - x0)) to clamp the speed values between -20 and 20 while keeping their vector ratios
    vX = 3.9*(10/(1+((float)Math.pow(Math.E, -.1*(vX-0))))-5);
    vY = 3.9*(10/(1+((float)Math.pow(Math.E, -.1*(vY-0))))-5);
    
    oldX = x;
    oldY = y;
    x += vX;
    y += vY + gravity;
      
    if (x > width - size)
    {
      x = width - size;
      oldX = x + vX * bounce;
    }
    if (x < 0 + size)
    {
      x = size;
      oldX = x + vX * bounce;
    }
    if (y > height - size)
    {
      y = height - size;
      oldY = y + vY * bounce;
    }
    if (y < 0 + size) 
    {
      y = size;
      oldY = y + vY * bounce;
    } 
    ellipse(x, y, 2 * size, 2 * size);
  }
  float getSize() { return size; }
  float getX() { return x; }
  float getY() { return y; }
  void setOldX(float X) { oldX = X; }
  void setOldY(float Y) { oldY = Y; }
}
