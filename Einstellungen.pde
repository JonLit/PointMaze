void settings_()
{
  button settingsButtonRedPlus = new button(10, 145, 70, 70, color(#ff0000), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonRedMinus = new button(10, 225, 70, 70, color(#ff0000), color(#ffffff), "minus_sign_41x11.png");
  button settingsButtonGreenPlus = new button(90, 145, 70, 70, color(#00ff00), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonGreenMinus = new button(90, 225, 70, 70, color(#00ff00), color(#ffffff), "minus_sign_41x11.png");
  button settingsButtonBluePlus = new button(170, 145, 70, 70, color(#0000ff), color(#ffffff), "plus_sign_41x41.png");
  button settingsButtonBlueMinus = new button(170, 225, 70, 70, color(#0000ff), color(#ffffff), "minus_sign_41x11.png");
  button serverModeSelectButton = new button(10, 500, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "Server Modus");
  button clientModeSelectButton = new button(10, 610, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "Client Modus");
  
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
      resetDeclineButton.activate();
      if (resetConfirmButton.isPressed())
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
        saveObject.setInt("Level", 0);
        saveJSONObject(saveObject, "data/save.json");
        loadLevel();
        resetConfirmButton.deactivate();
        reset = false;
      }
      else if(resetDeclineButton.isPressed())
      {
        reset = false;
      }
    }
    
    // Multiplayer
    textAlign(TOP, LEFT);
    text("Multiplayer Modus", 10, 470);
    serverModeSelectButton.activate();
    clientModeSelectButton.activate();
    
    if (serverModeSelectButton.isPressed())
    {
      if (client != null)
      {
        client.dispose();
      }
      server = new WebsocketServer(this, 8025, "/pointmaze");
      client = null;
      serverModeSelectButton.setFillColor(#0000ff);
      clientModeSelectButton.setFillColor(#000000);
      serverMode = "server";
    }
    else if (clientModeSelectButton.isPressed())
    {
      if (server != null)
      {
        server.dispose();
      }
      server = null;
      client = new WebsocketClient(this, "ws://192.168.1.3:8025/pointmaze");
      serverModeSelectButton.setFillColor(#000000);
      clientModeSelectButton.setFillColor(#0000ff);
      serverMode = "client";
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
