boolean pause = false;
int vibrateSwitch = 180;

void pause()
{
  if(pause == true)
  {
    stroke(255);
    fill(backgroundR, backgroundG, backgroundB);
    rect(0, 0, width-1, height-1);
    fill(255);
    textSize(s);
    text("PAUSE", 10, 25);
    text("Der Kreis bwewegt sich immer von dem Finger weg,", 10, 25+s);
    text("und zwar schneller, wenn der Finger naeher am Kreis ist.", 10, 25+2*s);
    text("Wenn der Kreis in einen roten Bereich eintritt, wird er zurueckgesetzt.", 10, 25+3*s);
    text("Wenn er in den Gruenen Bereich eintritt, hat man Gewonnen.", 10, 25+4*s);
    text("Wenn man gewonnen hat, wird nach 2 Sekunden das naechste Level geladen.", 10, 25+5*s);
    text("Ein Tippen setzt den Kreis zurueck.", 10, 25+6*s);
    //text("Tasten:", 10, 25+8*s);
    //text("i", 10, 25+9*s);
    //text(":", 70, 25+9*s);
    //text("Zeigt diese Information an", 130, 25+9*s);
    //text("ESC", 10, 25+10*s);
    //text(":", 70, 25+10*s);
    //text("Beendet das Programm", 130, 25+10*s);
    text("Finger:", 10, 25+8*s);
    text("Bewegung", 10, 25+9*s);
    text(":", 200, 25+9*s);
    text("Bewegung Kreis", 250, 25+9*s);
    text("Tippen", 10, 25+10*s);
    text(":", 200, 25+10*s);
    text("Kreis wird zurueckgesetzt", 250, 25+10*s);
  }
}
