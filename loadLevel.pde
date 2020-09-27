void loadLevel()
{
  //if (saveExisting.isFile())
  //{
    load = loadStrings("save.txt");
    if (load != null)
    {
      debug = boolean(load[0]);
      tStrokeColor = unhex(load[1]);
      tFillColor = unhex(load[2]);
      hStrokeColor = unhex(load[3]);
      hFillColor = unhex(load[4]);
      cStrokeColor = unhex(load[5]);
      cFillColor = unhex(load[6]);
      backgroundR = int(load[7]);
      backgroundG = int(load[8]);
      backgroundB = int(load[9]);
      q = int(load[10]);
      //level = int(load[11]);
    }
  //}
  //else 
  //{
  //  saveLevel();
  //}
}
