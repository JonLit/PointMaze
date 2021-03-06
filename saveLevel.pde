void saveLevel()
{
  saveObject.setBoolean("debug", debug);
  saveObject.setString("TargetStrokeColor", hex(tStrokeColor));
  saveObject.setString("TargetFillColor", hex(tFillColor));
  saveObject.setString("ObstacleStrokeColor", hex(hStrokeColor));
  saveObject.setString("ObstacleFillColor", hex(hFillColor));
  saveObject.setString("CircleStrokeColor", hex(cStrokeColor));
  saveObject.setString("CircleFillColor", hex(cFillColor));
  saveObject.setInt("backgroundColorRed", backgroundR);
  saveObject.setInt("backgroundColorGreen", backgroundG);
  saveObject.setInt("backgroundColorBlue", backgroundB);
  saveObject.setInt("Level", level);
  saveObject.setInt("topLevel", topLevel);
  saveJSONObject(saveObject, "data/save.json");

  //  OLD SAVE SYSTEM
  /*
  save[0] = str(debug);
  save[1] = hex(tStrokeColor);
  save[2] = hex(tFillColor);
  save[3] = hex(hStrokeColor);
  save[4] = hex(hFillColor);
  save[5] = hex(cStrokeColor);
  save[6] = hex(cFillColor);
  save[7] = str(backgroundR);
  save[8] = str(backgroundG);
  save[9] = str(backgroundB);
  save[10] = str(q);
  save[11] = str(level);
  saveStrings(dataPath("") + "save.txt", save);
  */
}
