void start_()
{
  for (int i = 0; i < topLevel-1; i++)
  {
    levelTiles.add(new LevelTile(i));
  }
  
  strokeWeight(3);
  stroke(255);
  fill(0);
  rect(0, 0, width-1, height-1);

  fill(#ff0000);
  textSize(100);
  textAlign(CENTER, BOTTOM);
  text("POINT MAZE", width/2, 100);
  
  textAlign(LEFT, CENTER);
  
  for (int i = 0; i < levelTiles.size(); i++)
  {
    LevelTile lT = levelTiles.get(i);
    lT.render();
    if (lT.getButton().isPressed())
    {
      level = lT.id;
      start = false;
    }
  }
}
