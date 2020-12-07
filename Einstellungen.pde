void settings_()
{
  button settingsButtonRedPlus = new button(10, 145, 70, 70, color(#ff0000), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonRedMinus = new button(10, 225, 70, 70, color(#ff0000), color(#ffffff), "minus_sign_41x11.png");
  button settingsButtonGreenPlus = new button(90, 145, 70, 70, color(#00ff00), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonGreenMinus = new button(90, 225, 70, 70, color(#00ff00), color(#ffffff), "minus_sign_41x11.png");
  button settingsButtonBluePlus = new button(170, 145, 70, 70, color(#0000ff), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonBlueMinus = new button(170, 225, 70, 70, color(#0000ff), color(#ffffff), "minus_sign_41x11.png");
  
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
    
    settingsButtonRedPlus.activate();
    settingsButtonRedMinus.activate();
    settingsButtonGreenPlus.activate();
    settingsButtonGreenMinus.activate();
    settingsButtonBluePlus.activate();
    settingsButtonBlueMinus.activate();
    if (!reset)
    {
      if (settingsButtonRedPlus.isPressed())
      {
        backgroundR++;
      }
      if (settingsButtonRedMinus.isPressed())
      {
        backgroundR--;
      }
      if (settingsButtonGreenPlus.isPressed())
      {
        backgroundG++;
      }
      if (settingsButtonGreenMinus.isPressed())
      {
        backgroundG--;
      }
      if (settingsButtonBluePlus.isPressed())
      {
        backgroundB++;
      }
      if (settingsButtonBlueMinus.isPressed())
      {
        backgroundB--;
      }
      
      if (backgroundG < 0)
      {
        backgroundG = 0;
      }
      if (backgroundG > 255)
      {
        backgroundG = 255;
      }
      if (backgroundR < 0)
      {
        backgroundR = 0;
      }
      if (backgroundR > 255)
      {
        backgroundR = 255;
      }
      if (backgroundB < 0)
      {
        backgroundB = 0;
      }
      if (backgroundB > 255)
      {
        backgroundB = 255;
      }
    }
    
    fill(255);
    text(backgroundR, 10, 335);
    text(backgroundG, 90, 335);
    text(backgroundB, 170, 335);
    
    // Reset
    if (!reset)
    {
      resetButton.activate();
    }
    if (resetButton.isPressed())
    {
      reset = true;
    }
    if (reset)
    {
      settingsButtonRedPlus.deactivate();
      settingsButtonRedMinus.deactivate();
      settingsButtonGreenPlus.deactivate();
      settingsButtonGreenMinus.deactivate();
      settingsButtonBluePlus.deactivate();
      settingsButtonBlueMinus.deactivate();
      resetButton.deactivate();
      fill(#000000);
      strokeJoin(ROUND);
      rect(40, 40, width-80, height-80);
      textAlign(LEFT, TOP);
      text("WOLLEN SIE WIRKLICH DEN GESAMTEN SPIELSTAND UNWIEDERRUFLICH LÖSCHEN?", 80, 80);
      println("resetConfirm");
      resetConfirmButton.activate();
      if (resetConfirmButton.isPressed())
      {
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
        save[11] = "0";
        saveStrings(dataPath("") + "\\save.txt", save);
        loadLevel();
        resetConfirmButton.deactivate();
        reset = false;
      }
    }
  }
  
  if(pause && !settings && !start)
  {
    //pauseButton = new button(width-100, 0, 100, 100, "pause_button_pause.png", 1);
    pauseButton.changeSymbol("pause_button_pause.png");
    pauseButton.activate();
  }
  else if(!pause && !settings && !start)
  {
    //pauseButton = new button(width-100, 0, 100, 100, "pause_button_running.png", 1);
    pauseButton.changeSymbol("pause_button_running.png");
    pauseButton.activate();
    
    if(debug == true)
    {
      fill(255);
      textSize(10);
      text(round(frameRate), 0, 10);
    }
  }
}


void resetConfirm()
{
  
}
