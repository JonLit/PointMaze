boolean pause = false;

void pause()
{
  if(pause == true)
  {
    stroke(255);
    fill(backgroundR, backgroundG, backgroundB);
    rect(0, 0, width-1, height-1);
    fill(255);
    textSize(s);
    textAlign(LEFT, CENTER);
    text("PAUSE", 10, 25);
    text("Der Kreis bwewegt sich immer von dem Finger weg,", 10, 25+s);
    text("und zwar schneller, wenn der Finger näher am Kreis ist.", 10, 25+2*s);
    text("Wenn der Kreis in einen roten Bereich eintritt, wird er zurückgesetzt.", 10, 25+3*s);
    text("Wenn er in den Grünen Bereich eintritt, hat man Gewonnen.", 10, 25+4*s);
    text("Wenn man gewonnen hat, wird nach 2 Sekunden das nächste Level geladen.", 10, 25+5*s);
    text("Ein Tippen setzt den Kreis zurück.", 10, 25+6*s);
    text("Tasten:", 10, 25+8*s);
    text("i", 10, 25+9*s);
    text(":", 70, 25+9*s);
    text("Zeigt diese Information an", 130, 25+9*s);
    text("ESC", 10, 25+10*s);
    text(":", 70, 25+10*s);
    text("Beendet das Programm", 130, 25+10*s);
    text("Finger:", 10, 25+12*s);
    text("Bewegung", 10, 25+13*s);
    text(":", 140, 25+13*s);
    text("Bewegung Kreis", 190, 25+13*s);
    text("Tippen", 10, 25+14*s);
    text(":", 140, 25+14*s);
    text("Kreis wird zurückgesetzt", 190, 25+14*s);
    textSize(14);
    text("PointMazePC v1.9.6", 10, height-25);
  }
}
