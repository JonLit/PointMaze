void saveLevel()
{
  String savePath = dataPath("");
  String saveFile = "save.txt";
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
  savePath = dataPath("");
  saveStrings(saveFile, save);
}
