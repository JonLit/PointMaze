boolean settings = false;

void settings_()
{
  if(settings == true)
  {
    stroke(255);
    fill(backgroundR, backgroundG, backgroundB);
    rect(0, 0, width-1, height-1);
    fill(255);
    textSize(s);
    text("EINSTELLUNGEN", 10, 25);
    text("Design", 10, 65);
    
    text("Hintergrund", 10, 105);
    
    fill(#ff0000);
    rect(10, 145, 70, 70);
    strokeWeight(10);
    stroke(255);
    line(45, 165, 45, 195);
    line(30, 180, 60, 180);
    if (mousePressed && mouseX < 80 && mouseX > 10 && mouseY < 215 && mouseY > 145)
    {
      backgroundR++;
    }
    strokeWeight(3);
    fill(#ff0000);
    rect(10, 225, 70, 70);
    strokeWeight(10);
    stroke(255);
    line(30, 260, 60, 260);
    strokeWeight(3);
    if (mousePressed && mouseX < 80 && mouseX > 10 && mouseY < 295 && mouseY > 225)
    {
      backgroundR--;
    }
    if (backgroundR < 0)
    {
      backgroundR = 0;
    }
    if (backgroundR > 255)
    {
      backgroundR = 255;
    }
    fill(255);
    text(backgroundR, 10, 335);
    
    fill(#00ff00);
    rect(90, 145, 70, 70);
    if (mousePressed && mouseX < 160 && mouseX > 90 && mouseY < 215 && mouseY > 145)
    {
      backgroundG++;
    }
    strokeWeight(10);
    stroke(255);
    line(125, 165, 125, 195);
    line(110, 180, 140, 180);
    fill(#00ff00);
    strokeWeight(3);
    rect(90, 225, 70, 70);
    strokeWeight(10);
    stroke(255);
    fill(#00ff00);
    line(110, 260, 140, 260);
    strokeWeight(3);
    if (mousePressed && mouseX < 160 && mouseX > 90 && mouseY < 295 && mouseY > 225)
    {
      backgroundG--;
    }
    if (backgroundG < 0)
    {
      backgroundG = 0;
    }
    if (backgroundG > 255)
    {
      backgroundG = 255;
    }
    fill(255);
    text(backgroundG, 90, 335);
    
    fill(#0000ff);
    rect(170, 145, 70, 70);
    if (mousePressed && mouseX < 230 && mouseX > 170 && mouseY < 215 && mouseY > 145)
    {
      backgroundB++;
    }
    fill(#0000ff);
    rect(170, 225, 70, 70);
    strokeWeight(10);
    stroke(255);
    line(205, 165, 205, 195);
    line(190, 180, 220, 180);
    line(190, 260, 220, 260);
    strokeWeight(3);
    if (mousePressed && mouseX < 230 && mouseX > 170 && mouseY < 295 && mouseY > 225)
    {
      backgroundB--;
    }
    if (backgroundB < 0)
    {
      backgroundB = 0;
    }
    if (backgroundB > 255)
    {
      backgroundB = 255;
    }
    fill(255);
    text(backgroundB, 170, 335);
  }
  
  if(pause && !settings && !start)
  {/*
    fill(255);
    strokeJoin(ROUND);
    triangle(width - 35, 10, width - 35, 40, width - 10, 25);
    //reset();
    */
    pauseButton = new button(width-100, 0, 100, 100, "pause_button_pause.png", 1);
  }
  else if(!pause && !settings && !start)
  {/*
    line(width - 30, 15, width - 30, 35);
    line(width - 20, 15, width - 20, 35);
    */
    
    pauseButton = new button(width-100, 0, 100, 100, "pause_button_running.png", 1);
    
    if(debug == true)
    {
      fill(255);
      textSize(10);
      text(round(frameRate), 0, 10);
    }
  }
}
