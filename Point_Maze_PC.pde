/* Ersteller: Jonathan Litzelmann
 Mit freundlicher Unterstützung von Kai Krull*/

import websockets.*;

//Variablen
float cX;
float cY;
float[] cClientX = new float[2];
float[] cClientY = new float[2];
boolean start = true;
boolean debug = false;
boolean settings = false;
boolean reset = false;
color tStrokeColor = #00ff00;
color tFillColor = #00ff00;
color hStrokeColor = #ff0000;
color hFillColor = #ff0000;
color cStrokeColor = #ffffff;
color cFillColor = #ffffff;
int backgroundR = 0;
int backgroundG = 0;
int backgroundB = 0;
int timer = 0;
int win = 0;
int q = 30;
int s = 25;
int cRadius;
String serverMode = "";
String serverAdress = "192.168.1.1";
PImage a;
PImage b;
PImage c;
PImage icon;
PImage cursor;
button settingsButton;
button pauseButton;
button resetButton;
button resetConfirmButton;
button resetDeclineButton;

WebsocketServer server;
WebsocketClient client;


//String[] save = new String[12];
//String[] load = new String[12];

JSONObject saveObject = new JSONObject();
JSONObject loadObject = new JSONObject();

ArrayList<Level> levels = new ArrayList<Level>();
int level = 0;

void setup()
{
  loadLevel();
  
  //fullScreen();
  size(1920, 1080);
  frameRate(q);
  reset();
  orientation(LANDSCAPE);
  icon = loadImage("icon.png");
  surface.setIcon(icon);
  cursor = loadImage("cursor.png");
  cursor(cursor);

  if (displayWidth == 1280)
  {
    s = 25;
  } else if (displayWidth == 1920)
  {
    s = 35;
  }
  //else if (displayWidth == )

  cRadius = int(s);

  a = loadImage("settings_button.png");
  a.resize(2*s, 2*s);
  /*b = loadImage("background.jpg");
  b.resize(displayWidth, displayHeight);*/
  
  // BUTTONS
  settingsButton = new button(width-200, 0, 100, 100, "settings_button.png", 1);
  pauseButton = new button(width-100, 0, 100, 100, "pause_button_running.png", 1);

  resetButton = new button(50, height-150, 1000, 100, color(#000000), color(#ffffff), color(#ffffff), "GESAMTEN SPIELFORTSCHRITT LÖSCHEN");
  resetConfirmButton = new button(width-380, height-180, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "JA, LÖSCHEN");
  resetDeclineButton = new button(width-720, height-180, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "NICHT LÖSCHEN");
  
  ArrayList<Hindernis> h0 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h1 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h2 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h3 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h4 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h5 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h6 = new ArrayList<Hindernis>();
  ArrayList<Hindernis> h7 = new ArrayList<Hindernis>();
  //ArrayList<Hindernis> h8 = new ArrayList<Hindernis>();

  //Hindernisse level 0
  h0.add(new Hindernis(width / 2, 0, 50, height / 2 - 20));
  h0.add(new Hindernis(width / 2, height / 2 + 20, 50, height / 2 - 20));

  //Hindernisse level 1
  h1.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h1.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h1.add(new Hindernis(width / 2 - 150, height / 2 -25, 50, 50));

  //Hindernisse level 2
  h2.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h2.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h2.add(new Hindernis(width / 2 - 150, height / 4, 50, height / 2));
  h2.add(new Hindernis(100, height / 2 - 50, 50, 100));

  //Hindernisse level 3
  h3.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h3.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h3.add(new Hindernis(width / 2 - 150, height / 4, 50, height / 2));
  h3.add(new Hindernis(100, height / 2 - 50, width / 2 - 200, 100));

  //Hindernisse level 4
  h4.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h4.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h4.add(new Hindernis(width / 2 - 150, height / 4, 50, height / 2));
  h4.add(new Hindernis(100, height / 2 - 50, width / 2 - 200, 100));
  h4.add(new Hindernis(0, 0, width, height / 5));
  h4.add(new Hindernis(0, height / 5 * 4, width, width / 5));

  //Hindernisse level 5
  h5.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h5.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h5.add(new Hindernis(width / 2 - 150, height / 4, 50, height / 2));
  h5.add(new Hindernis(100, height / 2 - 50, width / 2 - 200, 100));
  h5.add(new Hindernis(0, 0, width, height / 5 ));
  h5.add(new Hindernis(0, height / 5 * 4, width, height / 5));
  h5.add(new Hindernis(width - 150, height / 5, 150, height / 5 * 3));
  h5.add(new Hindernis(300, height / 6, 50, height / 6));
  h5.add(new Hindernis(300, height / 3 * 2, 50, height / 6));

  //Hindernisse level 6
  h6.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h6.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h6.add(new Hindernis(width / 2 - 150, height / 4, 50, height / 2));
  h6.add(new Hindernis(100, height / 2 - 50, width / 2 - 200, 100));
  h6.add(new Hindernis(0, 0, width, height / 5 ));
  h6.add(new Hindernis(0, height / 5 * 4, width, height / 5));
  h6.add(new Hindernis(width - 150, height / 5, 150, height / 5 * 3));
  h6.add(new Hindernis(300, height / 6, 50, height / 6));
  h6.add(new Hindernis(300, height / 3 * 2, 50, height / 6));
  h6.add(new Hindernis(150, height / 4, 50, height / 2));

  //Hindernisse level 7
  h7.add(new Hindernis(width / 2 - 25, 0, 50, height / 2 - 25));
  h7.add(new Hindernis(width / 2 - 25, height / 2 + 25, 50, height / 2 - 25));
  h7.add(new Hindernis(width / 2 - 225, height / 4, width / 8, height / 2));
  h7.add(new Hindernis(100, height / 2 - 50, width / 2 - 200, 100));
  h7.add(new Hindernis(0, 0, width, height / 5 ));
  h7.add(new Hindernis(0, height / 5 * 4, width, height / 5));
  h7.add(new Hindernis(width - 150, height / 5, 150, height / 5 * 3));
  h7.add(new Hindernis(300, height / 6, 50, height / 6));
  h7.add(new Hindernis(300, height / 3 * 2, 50, height / 6));
  h7.add(new Hindernis(150, height / 4, 50, height / 2));

  //Hindernisse level 8
  //h8.add(new Hindernis(

  levels.add(new Level(h0));
  levels.add(new Level(h1));
  levels.add(new Level(h2));
  levels.add(new Level(h3));
  levels.add(new Level(h4));
  levels.add(new Level(h5));
  levels.add(new Level(h6));
  levels.add(new Level(h7));
  //levels.add(new Level(h8));
}

void draw()
{
  frameRate(q);

  if (settings == false && pause == false && start == false)
  {

    float vX = cX - mouseX;
    float vY = cY - mouseY;
    float abstand = sqrt(vX * vX + vY * vY);

    timer++;
    if (timer == 59)
    {
      timer = 0;
    }

    if (abstand == 0)
    {
      abstand = 1.0f;
    }

    cX = cX + vX / abstand / abstand * 2500;
    cY = cY + vY / abstand / abstand * 2500;

    if (cX < 5.0f)
    {
      cX = 5.0f;
    }

    if (cX > width - 5.0f)
    {
      cX = width - 5.0f;
    }

    if (cY < 5.0f)
    {
      cY = 5.0f;
    }

    if (cY > height - 5.0f)
    {
      cY = height - 5.0f;
    }
  }

  levels.get(level).update();

  if (win == 1)
  {
    if (level < levels.size()-1)
    {
      level++;
      saveLevel();
    }
    reset();
  }

  if (win > 0)
  {
    win--;
  }

  background(backgroundR, backgroundG, backgroundB);

  levels.get(level).render();

  // Kreis
  fill(cFillColor);
  stroke(cStrokeColor);
  ellipse(cX, cY, 0.5*s, 0.5*s);
  
  // Kreise von Mitspielern
  fill(#550000);
  stroke(#ffffff);
  if (cClientX != null)
  {
    for (int i = 0; i < cClientX.length; i++)
    {
      ellipse(cClientX[i], cClientY[i], 0.5*s, 0.5*s);
    }
  }

  if (win > 0)
  {
    fill(#00ff00);
    textSize(10*s);
    textAlign(CENTER, CENTER);
    text("WIN", width / 2, height / 2);
    textAlign(LEFT, BOTTOM);
  }

  if (start == true)
  {
    start_();
  }
  
  pause();
  
  settings_();
  
  if (!settings && !start)
  {
    pauseButton.activate();
  }
  
  if (pause == true && !start)
  {
    settingsButton.activate();
  }
  
  if (debug == true)
  {
    text(timer, 10, 20);
  }
  
  if (win <= 100 && win > 0)
  {
    if (level == levels.size()-1)
    {
      //image(c, 0, 0, 1280, 720);
    }
  }
  
  // Multiplayer stuff
  if (serverMode == "server")
  {
    server.sendMessage(str(cX) + ";" + str(cY));
  }
  else if (serverMode == "client")
  {
    client.sendMessage(str(cX) + ";" + str(cY));
  }
}

void webSocketEvent(String msg)
{
  if (serverMode == "client")
  {
    String[] manage = new String[2];
    println(msg);
    manage = split(msg, ";");
    cClientX[0] = float(manage[0]);
    cClientY[0] = float(manage[1]);
  }
}

void webSocketServerEvent(String msg) 
{
  if (serverMode == "server")
  {
    String[] manage = new String[2];
    println(msg);
    manage = split(msg, ";");
    cClientX[0] = float(manage[0]);
    cClientY[0] = float(manage[1]);
  }
}

void reset()
{
  cX = width * 0.75;
  cY = height / 2;
}

void win()
{
  if (win <= 0)
  {
    win = 120;
  }
  if (win > 115 || win < 110 && win > 105)
  {
  }
}

void mousePressed()
{
  reset();
  if (settings == false && start == false)
  {
    if (pauseButton.isPressed())
    {
      pause = !pause;
    }
  }

  if (pause == true)
  {
    if (settingsButton.isPressed())
    {
      settings = !settings;
    }
  }
}
