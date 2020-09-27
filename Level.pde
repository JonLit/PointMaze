class Level
{
  private int startX = width / 4 * 3;
  private int startY = height / 2;
  private int zielX = 0;
  private int zielY = height / 2 - 20;
  private ArrayList<Hindernis> hindernisse;
  
  public Level(ArrayList<Hindernis> h)
  {
    this.hindernisse = h;
  }
  
  public void render()
  {
    stroke(tStrokeColor);
    fill(tFillColor);
    rect(this.zielX, this.zielY, 10, 40);
    
    //Hindernisse
    for(int i = 0; i < hindernisse.size(); i++)
    {
      Hindernis h = hindernisse.get(i);
      h.render();
    }
  }
  
  public void update()
  {
    if(cX < zielX + 10 && cX > zielX && cY < zielY + 40 && cY > zielY)
    {
      win();
      
    }
    
    for(int i = 0; i < hindernisse.size(); i++)
    {
      Hindernis h = hindernisse.get(i);
      if(h.isPointInside(cX, cY))
      {
        reset();
        //fail--;
      }
    }
    
    if(win > 0)
    {
      if(cX < zielX)
      {
        cX = zielX;
      }
      if(cX > zielX+10)
      {
        cX = zielX+10;
      }
      if(cY < zielY)
      {
        cY = zielY;
      }
       if(cY > zielY+40)    
      {
        cY = zielY+40;
      }
    }
  }
  
  public void reset()
  {
    cX = startX;
    cY = startY;
  }
};
