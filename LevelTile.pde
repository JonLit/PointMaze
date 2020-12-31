class LevelTile
{
  private int id;
  private int x;
  private int y;
  private Button button;
  
  public LevelTile(int ID)
  {
    this.id = ID;
    switch(id)
    {
      case 0: x = width/5;
              y = height/4*2;
              break;
      case 1: x = width/5*2;
              y = height/4*2;
              break;
      case 2: x = width/5*3;
              y = height/4*2;
              break;
      case 3: x = width/5*4;
              y = height/4*2;
              break;
      case 4: x = width/5;
              y = height/4*3;
              break;
      case 5: x = width/5*2;
              y = height/4*3;
              break;
      case 6: x = width/5*3;
              y = height/4*3;
              break;
      case 7: x = width/5*4;
              y = height/4*3;
              break;
      default: x = -200;
               y = -200;
               println("too many levelTiles");
               break;
    }
    button = new Button(x-100, y-100, 200, 200, color(#ff0000), color(#ffffff), color(#ffffff), str(id+1));
  }
  
  public void setPos(int xNew, int yNew)
  {
    this.x = xNew;
    this.y = yNew;
  }
  
  public void render()
  {
    button.activate();
  }
  
  public Button getButton()
  {
    return button;
  }
};
