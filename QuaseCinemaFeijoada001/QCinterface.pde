
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface draw canvas draw, click check and interface events
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface screen draw (canvas)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class MyCanvas extends ControlWindowCanvas {
  
  public void draw(PApplet theApplet) {
    
    // layer column
      
    if (controlWindow.currentTab().id() < 8) {
      // not selected layers columns
      for(int i = 0; i< 4; i++) { theApplet.fill(25); theApplet.rect(1+(columnWidth*i),20,int(columnWidth*0.98),700,6,6); } // end for
      // selected layer columns
      theApplet.fill(38); theApplet.stroke(#FF0000); theApplet.strokeWeight(2); theApplet.smooth();
      theApplet.rect(1+(columnWidth*selectedLayer),20,int(columnWidth*0.98),700,6,6);
      theApplet.strokeWeight(1); theApplet.noStroke(); theApplet.noSmooth();
    }
    
    if (controlWindow.currentTab().id() == 8) { // audio tab
      theApplet.fill(40); theApplet.rect(5,20,interfaceWidth-10,200); // all layers top box
    }
    
    if (controlWindow.currentTab().id() > 8) {
      theApplet.fill(40); theApplet.rect(5,20,interfaceWidth-10,140); // all layers top box
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
  
  
  if (controlWindow.currentTab().id()==1) { // main tab  
    
    //
    // dir draw
    //
    
    // dir 1 draw
    if (fileCounter1 > 0) {
      // dir text
      for(int i = 0; i< fileCounter1limit; i++) {
        if(i+(dirPageSelected1*21) == fileCounter1){break;}
        if (i+(dirPageSelected1*21) == selectedDir1) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs1[i+(dirPageSelected1*21)], 10+(columnWidth*0), 302+(18*i));
      } // end for
      
      // dir pages draw
      dirPages1 = (fileCounter1/fileCounter1limit)+1;
      for(int i = 0; i< (dirPages1); i++) {
        if (i==dirPageSelected1) {theApplet.stroke(255,0,0);theApplet.fill(200,0,0);} else {theApplet.stroke(0,255,0);theApplet.fill(0,200,0);} // page icon color
        theApplet.ellipse(10+(columnWidth*0)+(i*17),700,13,13);
      } // end for
    
    } //end if fileCounter1
    
    
    
    // dir 2 draw
    if (fileCounter2 > 0) {
      // dir text
      for(int i = 0; i< fileCounter2limit; i++) {
        if(i+(dirPageSelected2*21) == fileCounter2){break;}
        if (i+(dirPageSelected2*21) == selectedDir2) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs2[i+(dirPageSelected2*21)], 10+(columnWidth*1), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages2 = (fileCounter2/fileCounter2limit)+1;
      for(int i = 0; i< (dirPages2); i++) {
        if (i==dirPageSelected2) {theApplet.stroke(255,0,0);theApplet.fill(200,0,0);} else {theApplet.stroke(0,255,0);theApplet.fill(0,200,0);} // page icon color
        theApplet.ellipse(10+(columnWidth*1)+(i*17),700,13,13);
      } // end for
      
    } //end if fileCounter2
    
    // dir 3 draw
    if (fileCounter3 > 0) {
      // dir text
      for(int i = 0; i< fileCounter3limit; i++) {
        if(i+(dirPageSelected3*21) == fileCounter3){break;}
        if (i+(dirPageSelected1*21) == selectedDir3) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs3[i+(dirPageSelected3*21)], 10+(columnWidth*2), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages3 = (fileCounter3/fileCounter3limit)+1;
      for(int i = 0; i< (dirPages3); i++) {
        if (i==dirPageSelected3) {theApplet.stroke(255,0,0);theApplet.fill(200,0,0);} else {theApplet.stroke(0,255,0);theApplet.fill(0,200,0);} // page icon color
        theApplet.ellipse(10+(columnWidth*2)+(i*17),700,13,13);
      } // end for
      
    } //end if fileCounter3
    
    // dir 4 draw
    if (fileCounter4 > 0) {
      for(int i = 0; i< fileCounter4limit; i++) {
        // dir text
        if(i+(dirPageSelected4*21) == fileCounter4){break;}
        if (i+(dirPageSelected4*21) == selectedDir4) {theApplet.fill(255, 0, 0);} else {theApplet.fill(0, 255, 0);} // text color
        theApplet.text(dirs4[i+(dirPageSelected4*21)], 10+(columnWidth*3), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages4 = (fileCounter4/fileCounter4limit)+1;
      for(int i = 0; i< (dirPages4); i++) {
        if (i==dirPageSelected4) {theApplet.stroke(255,0,0);theApplet.fill(200,0,0);} else {theApplet.stroke(0,255,0);theApplet.fill(0,200,0);} // page icon color
        theApplet.ellipse(10+(columnWidth*3)+(i*17),700,13,13);
      } // end for
      
    } //end if fileCounter4
    
    // in - out marks draw
    theApplet.stroke(255,0,0); theApplet.fill(160,0,0);
    // layer 1
    theApplet.triangle(11+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 199,
                       11+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 193,
                       14+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 196);
    theApplet.triangle(9+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 199,
                       9+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 193,
                       6+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 196);
    // layer 2
    theApplet.triangle(11+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 199,
                       11+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 193,
                       14+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 196);
    theApplet.triangle(9+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 199,
                       9+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 193,
                       6+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 196);
    // layer 3
    theApplet.triangle(11+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 199,
                       11+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 193,
                       14+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 196);
    theApplet.triangle(9+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 199,
                       9+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 193,
                       6+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 196);
    // layer 4
    theApplet.triangle(11+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 199,
                       11+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 193,
                       14+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 196);
    theApplet.triangle(9+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 199,
                       9+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 193,
                       6+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 196);
    
    
      //10+(columnWidth*i)+int(columnWidth*0.7)
      //10+(columnWidth*0),200,int(columnWidth*0.7)
    
  } // end if main tab
  
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  mouse click checks
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
  if(theApplet.mousePressed) {
    
    //
    // dir click check
    //  
    
    // if main tab, column 1
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*0) && theApplet.mouseX < (columnWidth*1) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter1limit; i++) {
          if ((theApplet.mouseY < (320+(18*i))) && (theApplet.mouseY > (302+(18*(i))))) { selectedDir1 = i+(dirPageSelected1*21); } // end if mouse loc
        } // end for
      //} //end if fileCounter1
    } // end if main tab, column 1
    
    // if main tab, column 2
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*1) && theApplet.mouseX < (columnWidth*2) ) {  
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter2limit; i++) {
          if ((theApplet.mouseY < (320+(18*i))) && (theApplet.mouseY > (302+(18*(i))))) { selectedDir2 = i+(dirPageSelected2*21); } // end if mouse loc
        } // end for
      //} //end if fileCounter2
    } // end if main tab, column 2
    
    // if main tab, column 3
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*2) && theApplet.mouseX < (columnWidth*3) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter3limit; i++) {
          if ((theApplet.mouseY < (320+(18*i))) && (theApplet.mouseY > (302+(18*(i))))) { selectedDir3 = i+(dirPageSelected3*21); } // end if mouse loc
        } // end for
      //} //end if fileCounter3
    } // end if main tab, column 3
    
    // if main tab, column 4
    if (controlWindow.currentTab().id()==1  && theApplet.mouseX > (columnWidth*3) && theApplet.mouseX < (columnWidth*4) ) { 
      //if (fileCounter1 > 0) {
        for(int i = 0; i< fileCounter4limit; i++) {
          if ((theApplet.mouseY < (320+(18*i))) && (theApplet.mouseY > (302+(18*(i))))) { selectedDir4 = i+(dirPageSelected4*21); } // end if mouse loc
        } // end for
      //} //end if fileCounter4  
    } // end if main tab, column 4
    
    //
    // dir pages click check
    //
    
    // dir pages layer 1
    if (controlWindow.currentTab().id()==1  && theApplet.mouseY > 700) {
      for(int i = 0; i< (dirPages1); i++) {
        if (theApplet.mouseX > (10+(columnWidth*0)+(i*17)) && theApplet.mouseX < (23+(columnWidth*0)+(i*17)) ) {dirPageSelected1=i;}
      } // end for
    } // end if
    
    // dir pages layer 2
    if (controlWindow.currentTab().id()==1  && theApplet.mouseY > 700) {
      for(int i = 0; i< (dirPages2); i++) {
        if (theApplet.mouseX > (10+(columnWidth*1)+(i*17)) && theApplet.mouseX < (23+(columnWidth*1)+(i*17)) ) {dirPageSelected2=i;}
      } // end for
    } // end if
    
    // dir pages layer 3
    if (controlWindow.currentTab().id()==1  && theApplet.mouseY > 700) {
      for(int i = 0; i< (dirPages3); i++) {
        if (theApplet.mouseX > (10+(columnWidth*2)+(i*17)) && theApplet.mouseX < (23+(columnWidth*2)+(i*17)) ) {dirPageSelected3=i;}
      } // end for
    } // end if
    
    // dir pages layer 4
    if (controlWindow.currentTab().id()==1  && theApplet.mouseY > 700) {
      for(int i = 0; i< (dirPages4); i++) {
        if (theApplet.mouseX > (10+(columnWidth*3)+(i*17)) && theApplet.mouseX < (23+(columnWidth*3)+(i*17)) ) {dirPageSelected4=i;}
      } // end for
    } // end if
    
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


} // end MyCanvas 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// controlP5 interface events
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void controlEvent(ControlEvent theEvent) {
  // ListBox is if type ControlGroup.
  // 1 controlEvent will be executed, where the event originates from a ControlGroup. therefore
  // you need to check the Event with if (theEvent.isGroup()) to avoid an error message from controlP5.
  
  if (theEvent.isGroup()) {
    // an event from a group e.g. scrollList
    //println(theEvent.group().value()+" from "+theEvent.group());
    
    // change resolution event
    if (theEvent.group() == outputResolutionList) {
      changeResolution = (int (theEvent.group().value()) );
    }
    
    // change language event
    if (theEvent.group() == languageList) {
      language = (int (theEvent.group().value()) );
      if (language == 4) { controlP5.setControlFont(new ControlFont(createFont("Hei",12, true), 12)); }
      else { controlP5.setControlFont(new ControlFont(createFont("Helvetica",12, true), 12)); }
      QCtranslate();
    }
    
    // layer content 1 event
    if (theEvent.group() == layerContentButton1) { layerContent1 = int(theEvent.group().value()); }
    if (theEvent.group() == layerContentButton2) { layerContent2 = int(theEvent.group().value()); }
    if (theEvent.group() == layerContentButton3) { layerContent3 = int(theEvent.group().value()); }
    if (theEvent.group() == layerContentButton4) { layerContent4 = int(theEvent.group().value()); }
    
    // composite
    if (theEvent.group().name() == "layerComposite1") { layerComposite1select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite2") { layerComposite2select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite3") { layerComposite3select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite4") { layerComposite4select = int(theEvent.group().value()); }
    
    // color
    if (theEvent.group().name() == "layer1color") { layerComposite1select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layer2color") { layerComposite2select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layer3color") { layerComposite3select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layer4color") { layerComposite4select = int(theEvent.group().value()); }
    
       
  } // end if event is group
  
  
  if(theEvent.isController()) { 
    
    // move output event
    if(theEvent.controller().name()=="outputXpos" || theEvent.controller().name()=="outputYpos") {
      QCmoveOutput();
    }
    
    if(theEvent.controller().name()=="layer1loop"){ if(layer1loop){ myMovie1.loop(); } else { myMovie1.noLoop(); } }
    if(theEvent.controller().name()=="layer2loop"){ if(layer2loop){ myMovie2.loop(); } else { myMovie2.noLoop(); } }
    if(theEvent.controller().name()=="layer3loop"){ if(layer3loop){ myMovie3.loop(); } else { myMovie3.noLoop(); } }
    if(theEvent.controller().name()=="layer4loop"){ if(layer4loop){ myMovie4.loop(); } else { myMovie4.noLoop(); } }
    
    // controller light paint toggle
    if(theEvent.controller().name()=="effectPaint1"){ if(effectPaint1){ layerComposite1select=1; } else { layerComposite1select=0; } }
    if(theEvent.controller().name()=="effectPaint2"){ if(effectPaint2){ layerComposite2select=1; } else { layerComposite2select=0; } }
    if(theEvent.controller().name()=="effectPaint3"){ if(effectPaint3){ layerComposite3select=1; } else { layerComposite3select=0; } }
    if(theEvent.controller().name()=="effectPaint4"){ if(effectPaint4){ layerComposite4select=1; } else { layerComposite4select=0; } }
    
    // black and white amount turns effect on/off
    if(theEvent.controller().name()=="effectBWlimit1"){ if(theEvent.controller().value() != 0){ effectBW1 = true; controlP5.controller("effectBW1").setValue(1); } }
    if(theEvent.controller().name()=="effectBWlimit2"){ if(theEvent.controller().value() != 0){ effectBW2 = true; controlP5.controller("effectBW2").setValue(1); } }
    if(theEvent.controller().name()=="effectBWlimit3"){ if(theEvent.controller().value() != 0){ effectBW3 = true; controlP5.controller("effectBW3").setValue(1); } }
    if(theEvent.controller().name()=="effectBWlimit4"){ if(theEvent.controller().value() != 0){ effectBW4 = true; controlP5.controller("effectBW4").setValue(1); } }
    
    // contrast amount turns effect on/off
    if(theEvent.controller().name()=="effectContrastLimit1"){ if(theEvent.controller().value()!=0){ effectContrast1=true; controlP5.controller("effectContrast1").setValue(1);}
      else { effectContrast1=false; controlP5.controller("effectContrast1").setValue(0); } }
    if(theEvent.controller().name()=="effectContrastLimit2"){ if(theEvent.controller().value()!=0){ effectContrast2=true; controlP5.controller("effectContrast2").setValue(1);}
      else { effectContrast2=false; controlP5.controller("effectContrast2").setValue(0); } }
    if(theEvent.controller().name()=="effectContrastLimit3"){ if(theEvent.controller().value()!=0){ effectContrast3=true; controlP5.controller("effectContrast3").setValue(1);}
      else { effectContrast3=false; controlP5.controller("effectContrast3").setValue(0); } }
    if(theEvent.controller().name()=="effectContrastLimit4"){ if(theEvent.controller().value()!=0){ effectContrast4=true; controlP5.controller("effectContrast4").setValue(1);}
      else { effectContrast4=false; controlP5.controller("effectContrast4").setValue(0); } }
    
  } // end if controllers
  
} // end controlEvent
  


// roor dir button
public void rootDirBut(int theValue) { setInputFolder(selectFolder("select library master folder")); }


// random dir buttons - randomize dir and movie
public void randomDir1(int theValue) { doRandomizeDir = 0; }
public void randomDir2(int theValue) { doRandomizeDir = 1; }
public void randomDir3(int theValue) { doRandomizeDir = 2; }
public void randomDir4(int theValue) { doRandomizeDir = 3; }


// random movie buttons - randomize dir and movie
public void randomMov1(int theValue) { doRandomize = 0; }
public void randomMov2(int theValue) { doRandomize = 1; }
public void randomMov3(int theValue) { doRandomize = 2; }
public void randomMov4(int theValue) { doRandomize = 3; }

