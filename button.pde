class button //<>//
{
  public int x;
  public int y;
  public int w;
  public int h;
  private int aX;
  private int aY;
  private int aW;
  private int aH;
  private int m;
  private color fC;
  private color sC;
  private color tC;
  private String txt;
  private String symName;
  private PShape buttonShape;
  private PImage sym;
  private boolean noFill;
  private boolean noStroke;
  private boolean symbolLoaded;
  
  public boolean active;
  
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, color fillColor, color strokeColor, color textColor, String text)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.fC = fillColor;
    this.sC = strokeColor;
    this.tC = textColor;
    this.txt = text;
    noFill = false;
    noStroke = false;
  }
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, color strokeColor, String text)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.txt = text;
    this.sC = strokeColor;
    noFill = true;
    noStroke = false;
  }
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, String text)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.txt = text;
    noFill = true;
    noStroke = true;
  }
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, color fillColor, color strokeColor, String symbolName)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.fC = fillColor;
    this.sC = strokeColor;
    this.m = 1;
    this.symName = symbolName;
    noFill = false;
    noStroke = false;
  }
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, color strokeColor, String symbolName, int mode)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.sC = strokeColor;
    this.m = mode;
    this.symName = symbolName;
    noFill = true;
    noStroke = false;
  }
  button(int PosX, int PosY, int buttonWidth, int buttonHeight, String symbolName, int mode)
  {
    this.x = PosX;
    this.y = PosY;
    this.w = buttonWidth;
    this.h = buttonHeight;
    this.aX = PosX;
    this.aY = PosY;
    this.aW = buttonWidth;
    this.aH = buttonHeight;
    this.m = mode;
    this.symName = symbolName;
    noFill = true;
    noStroke = true;
  }
  
  
  public void activate()
  {
    active = true;
    pushMatrix();
    translate(x, y);
    buttonShape = createShape(RECT, 0, 0, w, h);
    
    if (!noFill)
    {
      buttonShape.setFill(fC);
    }
    else if (noFill)
    {
      buttonShape.setFill(false);
    }
    
    if (!noStroke)
    {
      buttonShape.setStroke(sC);
    }
    else
    {
      buttonShape.setStroke(false);
    }
    
    shape(buttonShape);
    if (m == 0)
    {
      fill(tC);
      textAlign(CENTER, CENTER);
      text(txt, w/2, h/2);
    }
    else if (m == 1)
    {
      if (!symbolLoaded)
      {
        sym = loadImage(symName);
        if (sym.width > 0)
        {
          symbolLoaded = true;
          println(symName + " loaded succesfully");
        }
      }
      
      if (sym.width > 0)
      {
        imageMode(CENTER);
        image(sym, w/2, h/2);
      }
      else if (!symbolLoaded)
      {
        println("IMAGE NOT LOADED " + symName);
      }
      else if (sym.width < 0)
      {
        println("ERROR LOADING IMAGE " + symName);
      }
    }
    else
    {
      println("ERROR ON SOME BUTTON: INVALID MODE");
    }
    
    popMatrix();
  }
  
  public void deactivate()
  {
    active = false;
  }
  
  public void setActiveArea(int x, int y, int w, int h)
  {
    this.aX = x;
    this.aY = y;
    this.aW = w;
    this.aH = h;
  }
  
  public void changeSymbol(String symbolName)
  {
    this.symName = symbolName;
    sym = loadImage(symName);
    println(symName + " loaded and changed succesfully");
  }
  
  public void changePos(int xPos, int yPos)
  {
    this.x = xPos;
    this.y = yPos;
  }
  
  public void setFillColor(color newFillColor)
  {
    this.fC = newFillColor;
    this.noFill = false;
  }
  
  public void setNoFill()
  {
    this.noFill = true;
  }
  
  public void setStrokeColor(color newStrokeColor)
  {
    this.sC = newStrokeColor;
    this.noStroke = false;
  }
  
  public void setNoStroke()
  {
    this.noStroke = true;
  }
  
  public void setTextColor(color newTC)
  {
    this.tC = newTC;
  }
  
  public boolean isPressed()
  {
    if (active && mousePressed && mouseX >= this.aX && mouseX <= this.aX+this.aW && mouseY >= this.aY && mouseY <= this.aY+this.aH)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public boolean hover()
  {
    if (active && mouseX >= this.aX && mouseX <= this.aX+this.aW && mouseY >= this.aY && mouseY <= this.aY+this.aH)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
