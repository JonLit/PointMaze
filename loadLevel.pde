void loadLevel()
{
  loadObject = loadJSONObject("save.json");
  debug = loadObject.getBoolean("debug");
  tStrokeColor = unhex(loadObject.getString("TargetStrokeColor"));
  tFillColor = unhex(loadObject.getString("TargetFillColor"));
  hStrokeColor = unhex(loadObject.getString("ObstacleStrokeColor"));
  hFillColor = unhex(loadObject.getString("ObstacleFillColor"));
  cStrokeColor = unhex(loadObject.getString("CircleStrokeColor"));
  cFillColor = unhex(loadObject.getString("CircleFillColor"));
  backgroundR = loadObject.getInt("backgroundColorRed");
  backgroundG = loadObject.getInt("backgroundColorGreen");
  backgroundB = loadObject.getInt("backgroundColorBlue");
  level = loadObject.getInt("Level");
  topLevel = loadObject.getInt("topLevel");
  
  
  //  OLD LOADING SYSTEM
  /*
  load = loadStrings(dataPath("") + "\\save.txt");
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
    level = int(load[11]);
  }
  */
}
