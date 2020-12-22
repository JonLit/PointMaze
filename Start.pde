void start_()
{
  strokeWeight(3);
    stroke(255);
    fill(0);
    rect(0, 0, width-1, height-1);

    fill(#ff0000);
    textSize(100);
    textAlign(CENTER, BOTTOM);
    text("POINT MAZE", width/2, 100);
    textAlign(CENTER, CENTER);
    text("Klicken zum starten", width/2, height/2);
    textAlign(LEFT, CENTER);
    
    if (mousePressed && mouseX < width-100 && mouseY > 100)
    {
      start = false;
    }
    
    // REINITIALIZING SOME BUTTONS
    pauseButton.changePos(width-100, 0);
}
