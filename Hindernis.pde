class Hindernis
{
  private int x;
  private int y;
  private int h;
  private int b;
  
  public Hindernis(int posX, int posY, int breite, int hoehe)
  {
    this.x = posX;
    this.y = posY;
    this.b = breite;
    this.h = hoehe;
  }
  
  public void render()
  {
    fill(hFillColor);
    stroke(hStrokeColor);
    rect(this.x, this.y, this.b, this.h);
  }
  
  public boolean isPointInside(float cx, float cy)
  {
    if(cx-0.4*cRadius < this.x + this.b && cx+0.4*cRadius > this.x && cy-0.4*cRadius < this.y + this.h && cy+0.4*cRadius > this.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
};
