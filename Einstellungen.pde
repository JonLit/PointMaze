void settings_()
{
  Button settingsButtonRedPlus = new Button(10, 145, 70, 70, color(#ff0000), color(#ffffff), "plus_sign_41x41.png");
  Button settingsButtonRedMinus = new Button(10, 225, 70, 70, color(#ff0000), color(#ffffff), "minus_sign_41x11.png");
  Button settingsButtonGreenPlus = new Button(90, 145, 70, 70, color(#00ff00), color(#ffffff), "plus_sign_41x41.png");
  Button settingsButtonGreenMinus = new Button(90, 225, 70, 70, color(#00ff00), color(#ffffff), "minus_sign_41x11.png");
  Button settingsButtonBluePlus = new Button(170, 145, 70, 70, color(#0000ff), color(#ffffff), "plus_sign_41x41.png");
  Button settingsButtonBlueMinus = new Button(170, 225, 70, 70, color(#0000ff), color(#ffffff), "minus_sign_41x11.png");
  Button serverModeSelectButton = new Button(10, 500, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "Server Modus");
  Button clientModeSelectButton = new Button(320, 500, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "Client Modus");
  Button multiplayerStopButton = new Button(10, 610, 610, 100, color(#000000), color(#ffffff), color(#ffffff), "Multiplayer Beenden");
  
  
  
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
    
    // Multiplayer
    
    textAlign(TOP, LEFT);
    text("Multiplayer Modus", 10, 470);
    if (serverMode != "server")
    {
      serverModeSelectButton.activate();
    }
    
    if (serverMode != "client")
    {
      clientModeSelectButton.activate();
    }
    
    if (serverModeSelectButton.isPressed() && serverMode != "server")
    {
      if (!serverStarting)
      {
        if (client != null)
        {
          client.dispose();
        }
        client = null;
        thread("startWebSocketsServer");
      }
    }
    if (serverStarting)
    {
      settingsButtonRedPlus.deactivate();
      settingsButtonRedMinus.deactivate();
      settingsButtonGreenPlus.deactivate();
      settingsButtonGreenMinus.deactivate();
      settingsButtonBluePlus.deactivate();
      settingsButtonBlueMinus.deactivate();
      serverModeSelectButton.deactivate();
      clientModeSelectButton.deactivate();
      multiplayerStopButton.deactivate();
      resetButton.deactivate();
      fill(#000000);
      strokeJoin(ROUND);
      rect(40, 40, width-80, height-80);
      textAlign(CENTER, CENTER);
      fill(#ffffff);
      text("SERVER WIRD GESTARTET...", width/2, height/2);
    }
    
    else if (clientModeSelectButton.isPressed())
    {
      
      settingsButtonRedPlus.deactivate();
      settingsButtonRedMinus.deactivate();
      settingsButtonGreenPlus.deactivate();
      settingsButtonGreenMinus.deactivate();
      settingsButtonBluePlus.deactivate();
      settingsButtonBlueMinus.deactivate();
      serverModeSelectButton.deactivate();
      clientModeSelectButton.deactivate();
      multiplayerStopButton.deactivate();
      resetButton.deactivate();
      
      if (!clientStarting && !startedClient)
      {
        if (server != null)
        {
          server.dispose();
        }
        server = null;
        clientStarting = true;
        thread("startClient");
      }
    }
    
    if (gettingAddress)
    {
      
      if (tryingAddressNumber == 1)
      {
        timeNow = millis();
      }
      fill(#000000);
      strokeJoin(ROUND);
      rect(40, 40, width-80, height-80);
      textAlign(CENTER, CENTER);
      fill(#ffffff);
      text("VERBINDEN ZUM HOST...\nBITTE NICHT AUF DEN BILDSCHIRM TIPPEN\nDER PROZESS KANN EINIGE ZEIT IN ANSPRUCH NEHMEN\n\ndurchsuche Addresse " + tryingAddress + "\n(" + tryingAddressNumber + " von 65 536)\n" + str((millis() - timeNow) / 1000), width/2, height/2);
      //println("starting Client");
    }
    
    if (clientStartError == true)
    {
      fill(#000000);
      strokeJoin(ROUND);
      rect(40, 40, width-80, height-80);
      textAlign(CENTER, CENTER);
      fill(#ff0000);
      text("FEHLER, KEIN HOST GEFUNDEN!", width/2, height/2);
      //println("ERROR, Server not found!");
      clientStartErrorOKButton.activate();
      if (clientStartErrorOKButton.isPressed())
      {
        clientStartError = false;
      }
    }
    
    if (serverMode != null)
    {
      multiplayerStopButton.activate();
      if (multiplayerStopButton.isPressed())
      {
        serverMode = null;
        try 
        {
          if (server != null) server.dispose();
          if (client != null) server.dispose();
        }catch (Exception e){}
        server = null;
        client = null;
      }
    }
    else 
    {
      multiplayerStopButton.deactivate();
    }
    
    // Reset
    
    if (!reset && !serverStarting && !clientStartError && !clientStarting)
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
      serverModeSelectButton.deactivate();
      clientModeSelectButton.deactivate();
      multiplayerStopButton.deactivate();
      resetButton.deactivate();
      fill(#000000);
      strokeJoin(ROUND);
      rect(40, 40, width-80, height-80);
      textAlign(LEFT, TOP);
      fill(#ffffff);
      text("WOLLEN SIE WIRKLICH DEN GESAMTEN SPIELSTAND UNWIEDERRUFLICH LÖSCHEN?", 80, 80);
      //println("resetConfirm");
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
        saveObject.setInt("topLevel", 2);
        saveJSONObject(saveObject, "data/save.json");
        thread("loadLevel");
        resetConfirmButton.deactivate();
        reset = false;
      }
      else if(resetDeclineButton.isPressed())
      {
        reset = false;
      }
    } //<>//
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
