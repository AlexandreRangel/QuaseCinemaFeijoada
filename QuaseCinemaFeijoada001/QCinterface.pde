//
// interface draw canvas draw and click
//

//
// interface canvas screen draw
//

class MyCanvas extends ControlWindowCanvas {
  
  public void draw(PApplet theApplet) {
    
    // layer column
    
    if (controlWindow.currentTab().id() < 8) {
      // not selected layers
      for(int i = 0; i< 4; i++) {
        theApplet.fill(30); theApplet.rect(1+(columnWidth*i),20,int(columnWidth*0.97),700);
      } // end for
      // selected layer
      theApplet.fill(40); theApplet.stroke(#E8E8E8);
      theApplet.rect(1+(columnWidth*selectedLayer),20,int(columnWidth*0.97),700); theApplet.noStroke();
    }
    
    if (controlWindow.currentTab().id() > 7) {
      // all layers at top
      theApplet.fill(40); theApplet.rect(5,20,interfaceWidth-10,140);
    }
    
    // layer icons
    if (frameCount > 1) {
      theApplet.fill(128);
      theApplet.rect(8+(columnWidth*0), 24, 164, 124);
      theApplet.image(myMovie1, 10+(columnWidth*0), 26, 160, 120);
      theApplet.rect(8+(columnWidth*1), 24, 164, 124);
      theApplet.image(myMovie2, 10+(columnWidth*1), 26, 160, 120);
      theApplet.rect(8+(columnWidth*2), 24, 164, 124);
      theApplet.image(myMovie3, 10+(columnWidth*2), 26, 160, 120);
      theApplet.rect(8+(columnWidth*3), 24, 164, 124);
      theApplet.image(myMovie4, 10+(columnWidth*3), 26, 160, 120);
    }
  
  
  //
  // dir draw
  //
  
  if (controlWindow.currentTab().id()==1) { // if main tab  
    if (fileCounter1 > 0) {
      for(int i = 0; i< fileCounter1limit; i++) {
        if (i == selectedDir1) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs1[i], 10+(columnWidth*0), 350+(18*i));
      } // end for
    } //end if fileCounter1
    if (fileCounter2 > 0) {
      for(int i = 0; i< fileCounter2limit; i++) {
        if (i == selectedDir2) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs2[i], 10+(columnWidth*1), 350+(18*i));
      } // end for
    } //end if fileCounter2
    if (fileCounter3 > 0) {
      for(int i = 0; i< fileCounter3limit; i++) {
        if (i == selectedDir3) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs3[i], 10+(columnWidth*2), 350+(18*i));
      } // end for
    } //end if fileCounter3
    if (fileCounter4 > 0) {
      for(int i = 0; i< fileCounter4limit; i++) {
        if (i == selectedDir4) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs4[i], 10+(columnWidth*3), 350+(18*i));
      } // end for
    } //end if fileCounter4
  } // end if main tab
  
  
  //
  // dirs click check 
  //
  if(theApplet.mousePressed) {
    
    //
    // dir click
    //  
    
    // if main tab, column 1
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*0) && theApplet.mouseX < (columnWidth*1) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter1limit; i++) {
          if ((theApplet.mouseY < (350+(18*i))) && (theApplet.mouseY > (332+(18*(i))))) {
            dirClicked = i;
            selectedDir1 = dirClicked;
            // println (theApplet.mouseY + "  dir: " + dirClicked + ", " + dirs1[dirClicked]);
          } // end if mouse loc
        } // end for
      //} //end if fileCounter1
    } // end if main tab, column 1
    
    // if main tab, column 2
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*1) && theApplet.mouseX < (columnWidth*2) ) {  
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter2limit; i++) {
          if ((theApplet.mouseY < (350+(18*i))) && (theApplet.mouseY > (332+(18*(i))))) {
            selectedDir2 = i;
          } // end if mouse loc
        } // end for
      //} //end if fileCounter2
    } // end if main tab, column 2
    
    // if main tab, column 3
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*2) && theApplet.mouseX < (columnWidth*3) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter3limit; i++) {
          if ((theApplet.mouseY < (350+(18*i))) && (theApplet.mouseY > (332+(18*(i))))) {
            selectedDir3 = i;
          } // end if mouse loc
        } // end for
      //} //end if fileCounter3
    } // end if main tab, column 3
    
    // if main tab, column 4
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*3) && theApplet.mouseX < (columnWidth*4) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter4limit; i++) {
          if ((theApplet.mouseY < (350+(18*i))) && (theApplet.mouseY > (332+(18*(i))))) {
            selectedDir4 = i;
          } // end if mouse loc
        } // end for
      //} //end if fileCounter4  
    } // end if main tab, column 4
    
  } // end if theApplet.mousePressed


  // 
  // audio draw
  //
  
  if (controlWindow.currentTab().id()==8) { // if audio tab
  
    // mp3 dir draw
    if (fileNamesMp3.length > 0) {
      for(int i = 0; i< fileNamesMp3.length; i++) { // TODO: use limit
        if (i == selectedDirMp3) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(fileNamesMp3[i], 10+(columnWidth*0), 350+(18*i));
      } // end for
    } //end if fileCounter1
    
    
    //rectMode(CORNERS);
    //theApplet.fill(255);
    // perform a forward FFT on the samples in jingle's mix buffer
    // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
    //fft.forward(audio1.mix);
    // avgWidth() returns the number of frequency bands each average represents
    // we'll use it as the width of our rectangles
    
    //int w = int(200/fft.avgSize());
    //for(int i = 0; i < fft.avgSize(); i++) {
      // draw a rectangle for each average, multiply the value by 5 so we can see it better
     // theApplet.rect(i*w, theApplet.screenHeight, i*w + w, theApplet.screenHeight - fft.getAvg(i)*5);
    //} // end for
    
    //fft.getAvg(0)
    
    
    
  } // end if audio tab
  
  
  // dropArea1.draw();
    
  }
}
