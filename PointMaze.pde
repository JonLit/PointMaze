/* Ersteller: Jonathan Litzelmann //<>// //<>// //<>//
 Mit freundlicher Unterstützung von Kai Krull*/

import websockets.*;
import java.net.*;

//Variablen
float cX;
float cY;
float vX;
float vY;
float abstand;
float[] cClientX = new float[2];
float[] cClientY = new float[2];
boolean start = true;
boolean debug = false;
boolean settings = false;
boolean reset = false;
boolean serverStarting;
boolean clientStarting;
boolean startedClient;
boolean clientStartError = false;
boolean gettingAddress = false;
boolean imagesLoaded = false;
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
int q = 60;
int s = 25;
int cRadius;
int tryingAddressNumber;
int timeNow;
String serverMode = null;
String serverAddress = "192.168.1.1";
String foundAddress = null;
String tryingAddress = "";
PImage a;
PImage b;
PImage c;
PImage icon;
PImage cursor;
Button settingsButton;
Button pauseButton;
Button mainMenuButton;
Button resetButton;
Button resetConfirmButton;
Button resetDeclineButton;
Button clientStartErrorOKButton;

WebsocketServer server;
WebsocketClient client;
ServerSocket testServer;


//String[] save = new String[12];
//String[] load = new String[12];

JSONObject saveObject = new JSONObject();
JSONObject loadObject = new JSONObject();

ArrayList<Level> levels = new ArrayList<Level>();
ArrayList<LevelTile> levelTiles = new ArrayList<LevelTile>();
int level = 0;
int topLevel = 0;


void setup()
{
  thread("loadLevel");
  thread("loadImages");
  do 
  {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(#990000);
    text("LOADING...", width/2, height/2);
  }
  while(!imagesLoaded);
  fullScreen();
  //size(1920, 1080);
  frameRate(q);
  reset();
  orientation(LANDSCAPE);
  surface.setIcon(icon);
  cursor(cursor);

  if (displayWidth == 1280)
  {
    s = 25;
  } 
  else if (displayWidth == 1920)
  {
    s = 35;
  }

  cRadius = int(s);
  
  // BUTTONS
  settingsButton = new Button(width-200, 0, 100, 100, "settings_button.png", 1);
  pauseButton = new Button(width-100, 0, 100, 100, "pause_button_running.png", 1);
  mainMenuButton = new Button(0, 0, 100, 100, "backButton.png", 1);

  resetButton = new Button(50, height-150, 1000, 100, color(#000000), color(#ffffff), color(#ffffff), "GESAMTEN SPIELFORTSCHRITT LÖSCHEN");
  resetConfirmButton = new Button(width-380, height-180, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "JA, LÖSCHEN");
  resetDeclineButton = new Button(width-720, height-180, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "NICHT LÖSCHEN");
  
  clientStartErrorOKButton = new Button(width-380, height-180, 300, 100, color(#000000), color(#ffffff), color(#ffffff), "OK");
  
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

    vX = cX - mouseX;
    vY = cY - mouseY;
    abstand = sqrt(vX * vX + vY * vY);

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
      if (level == topLevel-1)  topLevel++;
      thread("saveLevel");
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
  if (debug)
  {
    stroke(255);
    fill(255);
    strokeWeight(3);
    line(mouseX, mouseY, cX + vX / abstand / abstand * 2500, cY + vY / abstand / abstand * 2500);
  }
  
  // Kreise von Mitspielern
  if (serverMode != null)
  {
    fill(55, 0, 0, 40);
    stroke(255, 40);
    if (cClientX != null)
    {
      for (int i = 0; i < cClientX.length; i++)
      {
        ellipse(cClientX[i], cClientY[i], 0.5*s, 0.5*s);
      }
    }
    fill(0, 0, 0, 255);
    stroke(0, 255);
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
  
  if (!start && !settings && !pause)
  {
    mainMenuButton.activate();
    if (mainMenuButton.isPressed())
    {
      start = true;
    }
  }
  
  if (pause && !start && !serverStarting && !clientStartError && !reset)
  {
    settingsButton.activate();
  }
  
  if (debug == true)
  {
    fill(255);
    textSize(20);
    textAlign(TOP, LEFT);
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
    try 
    {
      server.sendMessage(str(cX) + ";" + str(cY));
    }
    catch (Exception e)
    {
      serverMode = null;
      try 
      {
        if (server != null) server.dispose();
        if (client != null) server.dispose();
      }
      catch (Exception f){}
      server = null;
      client = null;
    }
  }
  else if (serverMode == "client")
  {
    try 
    {
      client.sendMessage(str(cX) + ";" + str(cY));
    }
    catch (Exception e)
    {
      serverMode = null;
      try 
      {
        if (server != null) server.dispose();
        if (client != null) server.dispose();
      }
      catch (Exception f){}
      server = null;
      client = null;
    }
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

void loadImages()
{
  a = loadImage("settings_button.png");
  a.resize(2*s, 2*s);
  /*b = loadImage("background.jpg");
  b.resize(displayWidth, displayHeight);*/
  cursor = loadImage("cursor.png");
  icon = loadImage("icon.png");
  imagesLoaded = true;
}


boolean isServerRunning(String host)
{
  // Assume no connection is possible.
  boolean result = false;

  try 
  {
    (new Socket(host, 8026)).close();
    result = true;
  }
  catch(SocketException e) 
  {
    // Could not connect.
  }
  catch(Exception e)
  {
    println("Other error while checking Serveravailibility: ");
    e.printStackTrace();
  }

  return result;
}

void startClient()
{
  serverAddress = getServerAddress();
  if (serverAddress != null && isServerRunning(serverAddress))
  {
    thread("startWebSocketsClient");
    startedClient =  true;
  }
  else
  {
    println("ERROR, Server not availible");
    serverMode = null;
    startedClient =  false;
    clientStartError = true;
    clientStarting = false;
  }
}

String getServerAddress()
{
  gettingAddress = true;
  Socket socket = new Socket();
  for (int i = 0; i < 256 || foundAddress != null; i++)
  {
    for (int j = 0; j < 256 || foundAddress != null; j++)
    {
      tryHost(socket, i, j);
      if (foundAddress != null)
      {
        return foundAddress;
      }
    }
  }
  try //<>//
  { //<>//
    socket.connect(new InetSocketAddress("127.0.0.1", 8026), 10); //<>// //<>//
    socket.close(); //<>//
    println("found running PointMaze Server at localhost"); //<>//
    return "127.0.0.1"; //<>//
  } //<>//
  catch (Exception e) //<>//
  {
    println("sadly didnt even found a running PointMaze server at localhost");
    try
    {
      socket.close();
    }
    catch (Exception f)
    {
      println("something went terribly wrong!");
      f.printStackTrace();
    }
  }
  
  gettingAddress = false;
  println("SERVER NOT FOUND");
  return null;
}

void tryHost(Socket socket, int i, int j)
{
  try 
  {
    socket = new Socket();
    tryingAddress = "192.168." + str(i) + "." + str(j);
    tryingAddressNumber++;
    socket.connect(new InetSocketAddress("192.168." + str(i) + "." + str(j), 8026), 10);
    socket.close();
    println("found running PointMaze Server at 192.168." + str(i) + "." + str(j));
    gettingAddress = false;
    foundAddress =  "192.168." + str(i) + "." + str(j);
  }
  catch (Exception e)
  {
    /*println("checked 192.168." + str(i) + "." + str(j) + " for running PointMaze server, but nothing found");
    try
    {
      socket.close();
    }
    catch (Exception f)
    {
      f.printStackTrace();
      println("something went terribly wrong");
    }*/
  }
}

void startWebSocketsServer()
{
  serverStarting = true;
  server = new WebsocketServer(this, 8025, "/pointmaze");
  try
  {
    testServer = new ServerSocket(8026);
    println("testServer started");
  }
  catch (Exception e)
  {
    e.printStackTrace();
  }
  serverMode = "server";
  serverStarting = false;
}

void startWebSocketsClient()
{
  client = new WebsocketClient(this, "ws://" + serverAddress + ":8025/pointmaze");
  serverMode = "client";
  clientStarting = false;
}
