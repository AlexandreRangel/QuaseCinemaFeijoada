//
// Quase-Cinema Feijoada Remix 0.01
// Alexandre Rangel
// www.quasecinema.org
//
// built with Processing 2.0 alpha 4
//

// libraries
import controlP5.*; // controlP5 0.6.12 http://www.sojamo.de/libraries/controlP5
import codeanticode.gsvideo.*; // GSvideo 1.0.0 http://gsvideo.sourceforge.net/
import javax.media.opengl.GL; // openGL
import processing.opengl.*; // openGL
import sojamo.drop.*; // sDrop 0.1.4 http://www.sojamo.de/libraries/drop
import mappingtools.*; // mappingtools 0.0.2 http://www.patricksaintdenis.com
import ddf.minim.analysis.*; // minim library
import ddf.minim.*;

// controlP5
ControlP5 controlP5;
ControlWindow controlWindow;
ControlWindowCanvas cc;

ColorPicker colorPicker1, colorPicker2, colorPicker3, colorPicker4;
ListBox outputResolutionList;
Numberbox outputXposNumberBox, outputYposNumberBox;
RadioButton layerContentButton1, layerContentButton2, layerContentButton3, layerContentButton4;
RadioButton layerBlendButton1, layerBlendButton2, layerBlendButton3, layerBlendButton4;

public int fpsValue = 0; // fps slider value

// movies
public GSMovie myMovie1, myMovie2, myMovie3, myMovie4;

String newMovie = "";
public boolean changeMovie = false;

SDrop drop;

// dirs pre setup
public String[] fileNames;
public String folderPath = " ";
//ListBox dirListBox;
int dirClicked = 1;
public String rootFolder;

// ------ default folder path ------
//String defaultFolderPath = System.getProperty("user.home")+"/Desktop";
String defaultFolderPath = "/Users/rangel/Documents/QC_Performance/bin/data/_videos";
//String defaultFolderPath = "/data/";
//String defaultFolderPath = "/Users/admin/Desktop";
//String defaultFolderPath = "C:\\windows";
String dirs1[] = new String[200]; String dirs2[] = new String[200];
String dirs3[] = new String[200]; String dirs4[] = new String[200];
int fileCounter1 = 0; int fileCounter2 = 0; int fileCounter3 = 0; int fileCounter4 = 0;
int fileCounter1limit = 20; int fileCounter2limit = 20; int fileCounter3limit = 20; int fileCounter4limit = 20;
int selectedDir1 = 1; int selectedDir2 = 2; int selectedDir3 = 3; int selectedDir4 = 4;
PFont debugFont;
public String tempString;

// mp3 pre setup
public String[] fileNamesMp3;
String defaultFolderPathMp3 = "/Users/rangel/Documents/MP3-Performance";
String dirsMp3[] = new String[200];
int selectedDirMp3 = 0;
int fileCounterMp3 = 0; 
int fileCounterLimitMp3 = 20; 


//  quad mapping pre setup
String configFile = "data/quadsconfig.txt";
ProjectedQuads projectedQuads;
PGraphics quadGraphics1, quadGraphics2, quadGraphics3, quadGraphics4;

// berzier mapping pre setup
BezierWarp bw1, bw2, bw3, bw4;

// timer pre setup
int layer1bpmVisLastTime = 0; int layer2bpmVisLastTime = 0; int layer3bpmVisLastTime = 0; int layer4bpmVisLastTime = 0;
int layer1bpmTimeLastTime = 0; int layer2bpmTimeLastTime = 0; int layer3bpmTimeLastTime = 0; int layer4bpmTimeLastTime = 0;
int layer1bpmMovieLastTime = 0; int layer2bpmMovieLastTime = 0; int layer3bpmMovieLastTime = 0; int layer4bpmMovieLastTime = 0;

// audio pre setup
Minim minim;
ddf.minim.AudioPlayer audio1;
FFT fft;

// variables pre setup
public int selectedLayer = 0;
//int myColorBackground = color(0,0,0);
int interfaceWidth = 1024;
int columnWidth = int (interfaceWidth/4);

float fade = 0.0;

public int changeResolution = 100; // changeResolution = 100 means don't change resolution on the draw loop
//public int outputWidth = 1024; public int outputHeight = 768;
public int outputWidth = 1280; public int outputHeight = 1024;

boolean layer1visibility = true;
boolean layer2visibility = false; boolean layer3visibility = false; boolean layer4visibility = false;

int layerContent1, layerContent2, layerContent3, layerContent4;

boolean mapping1 = false; boolean mapping2 = false; boolean mapping3 = false; boolean mapping4 = false;
boolean bmapping1 = false; boolean bmapping2 = false; boolean bmapping3 = false; boolean bmapping4 = false;

int layer1bpmVis, layer2bpmVis, layer3bpmVis, layer4bpmVis;
int layer1bpmTime, layer2bpmTime, layer3bpmTime, layer4bpmTime;
int layer1bpmMovie, layer2bpmMovie, layer3bpmMovie, layer4bpmMovie;

float layer1speed = 1.0; float layer2speed = 1.0; float layer3speed = 1.0; float layer4speed = 1.0;
//float layer1transparency = 255; float layer2transparency = 255; float layer3transparency = 255; float layer4transparency = 255;
public float layer1playback, layer2playback, layer3playback, layer4playback;

// effects pre setup
public boolean effectInvert1 = false; public boolean effectInvert2 = false;
public boolean effectInvert3 = false; public boolean effectInvert4 = false; 

public boolean effectPosterize1 = false; public boolean effectPosterize2 = false;
public boolean effectPosterize3 = false; public boolean effectPosterize4 = false;

public boolean effectRG1 = false; public boolean effectRG2 = false;
public boolean effectRG3 = false; public boolean effectRG4 = false;

public boolean effectRB1 = false; public boolean effectRB2 = false;
public boolean effectRB3 = false; public boolean effectRB4 = false;

public boolean effectBG1 = false; public boolean effectBG2 = false;
public boolean effectBG3 = false; public boolean effectBG4 = false;

public boolean effectBW1 = false; public boolean effectBW2 = false;
public boolean effectBW3 = false; public boolean effectBW4 = false;
public int effectBWlimit1 = 127; public int effectBWlimit2 = 127;
public int effectBWlimit3 = 127; public int effectBWlimit4 = 127;

public boolean effectContrast1 = false; public boolean effectContrast2 = false;
public boolean effectContrast3 = false; public boolean effectContrast4 = false;
public int effectContrastLimit1 = 0; public int effectContrastLimit2 = 0;
public int effectContrastLimit3 = 0; public int effectContrastLimit4 = 0;

public boolean effectSaturation1 = false; public boolean effectSaturation2 = false;
public boolean effectSaturation3 = false; public boolean effectSaturation4 = false;
public int effectSaturationLimit1 = 0; public int effectSaturationLimit2 = 0;
public int effectSaturationLimit3 = 0; public int effectSaturationLimit4 = 0;

public boolean effectHue1 = false; public boolean effectHue2 = false;
public boolean effectHue3 = false; public boolean effectHue4 = false;
public int effectHueLimit1 = 0; public int effectHueLimit2 = 0;
public int effectHueLimit3 = 0; public int effectHueLimit4 = 0;

public void init(){
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

//
// interface draw canvas screen
//

class MyCanvas extends ControlWindowCanvas {
  
  public void draw(PApplet theApplet) {
    
    
    // layer base
    theApplet.fill(40);
    theApplet.rect(1+(columnWidth*selectedLayer),20,columnWidth,700);
    
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
  // audio tab draw
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


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


void setup() {
  size(outputWidth, outputHeight, OPENGL);
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  frame.setResizable(false);
  frameRate(60);
  frame.setLocation(screen.width,0);
  //frame.setLocation(1024,0);
  frame.setLocation(1440,0);
  
  // variables setup
  QCsetupInterface();
  
  
  //
  // projectedQuads setup
  //
  
  projectedQuads = new ProjectedQuads();  
  projectedQuads.load(configFile);  
  
  //we want to display 3 quads so if there was no config file or less than 3 were defined we increase num to 3
  if (projectedQuads.getNumQuads() < 4) { projectedQuads.setNumQuads(4); }
  
  quadGraphics1 = createGraphics(640, 480, OPENGL);
  quadGraphics2 = createGraphics(640, 480, OPENGL);
  quadGraphics3 = createGraphics(640, 480, OPENGL);
  quadGraphics4 = createGraphics(640, 480, OPENGL);
  
  projectedQuads.getQuad(0).setTexture(quadGraphics1); 
  projectedQuads.getQuad(1).setTexture(quadGraphics2);
  projectedQuads.getQuad(2).setTexture(quadGraphics3); 
  projectedQuads.getQuad(3).setTexture(quadGraphics4); 
  
  
  // berzier mapping setup
  bw1 = new BezierWarp(this, 16);
  bw2 = new BezierWarp(this, 16);
  bw3 = new BezierWarp(this, 16);
  bw4 = new BezierWarp(this, 16);
  
  
  // drop setup
  drop = new SDrop(controlWindow.component(),this);
  
  
  // dirs setup
  for(int i = 0; i< 200; i++) { dirs1[i]=""; }
  setInputFolder(defaultFolderPath);
  debugFont = createFont("Arial", 14);
  textFont(debugFont);
  
  // mp3 setup
  for(int i = 0; i< 200; i++) { dirsMp3[i]=""; }
  
  tempString = defaultFolderPathMp3 +"/";
  fileNamesMp3 = listFileNames(tempString, txtFilterMp3);
  println(fileNamesMp3);
  
  //
  // GStreamer setup
  //
  
  GSVideo.localGStreamerPath = sketchPath("code/macosx64");
  
  //myMovie1 = new GSMovie(this, "Aviao.mov"); myMovie1.loop();
//  myMovie2 = new GSMovie(this, sketchPath("data/Palatnik1.mov")); myMovie2.loop();
//  myMovie3 = new GSMovie(this, sketchPath("data/Palatnik2.mov")); myMovie3.loop();
//  myMovie4 = new GSMovie(this, sketchPath("data/Palatnik3.mov")); myMovie4.loop();
  
  tempString = rootFolder + dirs1[selectedDir1] +"/";
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames[int(random(fileNames.length))];
  myMovie1 = new GSMovie(this, tempString); myMovie1.read(); myMovie1.play(); myMovie1.loop();
  
  tempString = rootFolder + dirs2[selectedDir2] +"/";
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames[int(random(fileNames.length))];
  myMovie2 = new GSMovie(this, tempString); myMovie2.read(); myMovie2.play(); myMovie2.loop();
  
  tempString = rootFolder + dirs3[selectedDir3] +"/";
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames[int(random(fileNames.length))];
  myMovie3 = new GSMovie(this, tempString); myMovie3.read(); myMovie3.play(); myMovie3.loop();
  
  tempString = rootFolder + dirs4[selectedDir4] +"/";
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames[int(random(fileNames.length))];
  myMovie4 = new GSMovie(this, tempString); myMovie4.read(); myMovie4.play(); myMovie4.loop();
      
  
  // timer setup
  layer1bpmVisLastTime=millis(); layer2bpmVisLastTime=millis(); layer3bpmVisLastTime=millis(); layer4bpmVisLastTime=millis();
  layer1bpmTimeLastTime=millis(); layer2bpmTimeLastTime=millis(); layer3bpmTimeLastTime=millis(); layer4bpmTimeLastTime=millis();
  layer1bpmMovieLastTime=millis(); layer2bpmMovieLastTime=millis(); layer3bpmMovieLastTime=millis(); layer4bpmMovieLastTime=millis();
  
  
  // audio setup
  minim = new Minim(this);
  audio1 = minim.loadFile("audio1.mp3", 2048);
  // loop the file
  audio1.loop();
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fft = new FFT(audio1.bufferSize(), audio1.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  fft.logAverages(22, 3);
  
} // end setup

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

//public void movieEvent(GSMovie gsMovie) {
//  //if (gsMovie.available()) { gsMovie.read(); QCeffects(); }
//}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

void controlEvent(ControlEvent theEvent) {
  // ListBox is if type ControlGroup.
  // 1 controlEvent will be executed, where the event originates from a ControlGroup. therefore
  // you need to check the Event with if (theEvent.isGroup()) to avoid an error message from controlP5.
  
  if (theEvent.isGroup()) {
    // an event from a group e.g. scrollList
    //println(theEvent.group().value()+" from "+theEvent.group());
    
    if (theEvent.group() == outputResolutionList) {
      changeResolution = (int (theEvent.group().value()) );
    }
    
    if (theEvent.group() == layerContentButton1) {
      layerContent1 = int(theEvent.group().value());
      println("layerContent1: "+layerContent1);
    }
    
  }
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


public void draw() {
  
  background(0);
  
  if (myMovie1.available()) { myMovie1.read(); QCeffects1(); }
  if (myMovie2.available()) { myMovie2.read(); QCeffects2(); }
  if (myMovie3.available()) { myMovie3.read(); QCeffects3(); }
  if (myMovie4.available()) { myMovie4.read(); QCeffects4(); }
  
  //
  // drop movie
  //
  
  if (changeMovie && selectedLayer == 0) {
   myMovie1.delete();
   myMovie1 = new GSMovie(this, newMovie); myMovie1.play(); myMovie1.loop(); changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 1) {
   myMovie2.delete();
   myMovie2 = new GSMovie(this, newMovie); myMovie2.play(); myMovie2.loop(); changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 2) {
   myMovie3.delete();
   myMovie3 = new GSMovie(this, newMovie); myMovie3.play(); myMovie3.loop(); changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 3) {
   myMovie4.delete();
   myMovie4 = new GSMovie(this, newMovie); myMovie4.play(); myMovie4.loop(); changeMovie = false; 
  }
  
  
  
  //
  // interface update values
  //
  
  // fps
  //if (random(100)>50){
  controlP5.controller("fpsValue").setValue(int(frameRate)); //}

  // playback heads
  controlP5.controller("layer1playback").setValue(map(myMovie1.time(),0.0,myMovie1.duration(),0.0,1.0));
  controlP5.controller("layer2playback").setValue(map(myMovie2.time(),0.0,myMovie2.duration(),0.0,1.0));
  controlP5.controller("layer3playback").setValue(map(myMovie3.time(),0.0,myMovie3.duration(),0.0,1.0));
  controlP5.controller("layer4playback").setValue(map(myMovie4.time(),0.0,myMovie4.duration(),0.0,1.0));

  //controlP5.draw();

  //
  // timer update
  //
  
  //
  // bpm visibility
  //
  
  if(layer1bpmVis>0 && millis()-layer1bpmVisLastTime >= map(layer1bpmVis,0,240,1000,10)){ // layer 1
    layer1visibility = !(layer1visibility);
    layer1bpmVisLastTime=millis();
  }
  if(layer2bpmVis>0 && millis()-layer2bpmVisLastTime >= map(layer2bpmVis,0,240,1000,10)){ // layer 2
    layer2visibility = !(layer2visibility);
    layer2bpmVisLastTime=millis();
  }
  if(layer3bpmVis>0 && millis()-layer3bpmVisLastTime >= map(layer3bpmVis,0,240,1000,10)){ // layer 3
    layer3visibility = !(layer3visibility);
    layer3bpmVisLastTime=millis();
  }
  if(layer4bpmVis>0 && millis()-layer4bpmVisLastTime >= map(layer4bpmVis,0,240,1000,10)){ // layer 4
    layer4visibility = !(layer4visibility);
    layer4bpmVisLastTime=millis();
  }
  
  //
  // bpm movie time
  //
  
  if(layer1bpmTime>0 && millis()-layer1bpmTimeLastTime >= map(layer1bpmTime,0,240,1000,10)){ // layer 1
    myMovie1.jump(random(myMovie1.duration()));
    layer1bpmTimeLastTime=millis();
  }
  if(layer2bpmTime>0 && millis()-layer2bpmTimeLastTime >= map(layer2bpmTime,0,240,1000,10)){ // layer 2
    myMovie2.jump(random(myMovie2.duration()));
    layer2bpmTimeLastTime=millis();
  }
  if(layer3bpmTime>0 && millis()-layer3bpmTimeLastTime >= map(layer3bpmTime,0,240,1000,10)){ // layer 3
    myMovie3.jump(random(myMovie3.duration()));
    layer3bpmTimeLastTime=millis();
  }
  if(layer4bpmTime>0 && millis()-layer4bpmTimeLastTime >= map(layer4bpmTime,0,240,1000,10)){ // layer 4
    myMovie4.jump(random(myMovie4.duration()));
    layer4bpmTimeLastTime=millis();
  }
  
  
  //
  // bpm change movie
  //
  
  if(layer1bpmMovie>0 && millis()-layer1bpmMovieLastTime >= map(layer1bpmMovie,0,240,1000,10)){ // layer 1
    // change movie
    String tempString = rootFolder + dirs1[selectedDir1] +"/";
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames[int(random(fileNames.length))];
    myMovie1.delete(); myMovie1 = new GSMovie(this, tempString); myMovie1.read(); myMovie1.play(); myMovie1.loop();
    myMovie1.jump(random(myMovie1.duration()));
    layer1bpmMovieLastTime=millis();
  }
  if(layer2bpmMovie>0 && millis()-layer2bpmMovieLastTime >= map(layer2bpmMovie,0,240,1000,10)){ // layer 2
    // change movie
    String tempString = rootFolder + dirs2[selectedDir2] +"/";
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames[int(random(fileNames.length))];
    myMovie2.delete(); myMovie2 = new GSMovie(this, tempString); myMovie2.read(); myMovie2.play(); myMovie2.loop();
    myMovie2.jump(random(myMovie2.duration()));
    layer2bpmMovieLastTime=millis();
  }
  if(layer3bpmMovie>0 && millis()-layer3bpmMovieLastTime >= map(layer3bpmMovie,0,240,1000,10)){ // layer 3
    // change movie
    String tempString = rootFolder + dirs3[selectedDir3] +"/";
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames[int(random(fileNames.length))];
    myMovie3.delete(); myMovie3 = new GSMovie(this, tempString); myMovie3.read(); myMovie3.play(); myMovie3.loop();
    myMovie3.jump(random(0,myMovie3.duration()));
    layer3bpmMovieLastTime=millis();
  }
  if(layer4bpmMovie>0 && millis()-layer4bpmMovieLastTime >= map(layer4bpmMovie,0,240,1000,10)){ // layer 4
    // change movie
    String tempString = rootFolder + dirs4[selectedDir4] +"/";
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames[int(random(fileNames.length))];
    myMovie4.delete(); myMovie4 = new GSMovie(this, tempString); myMovie4.read(); myMovie4.play(); myMovie4.loop();
    myMovie4.jump(random(0,myMovie4.duration()));
    layer4bpmMovieLastTime=millis();
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  output draw
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // pre-render layer 1
  if (layer1visibility) {
    //tint(fft.getAvg(5)*255, green(colorPicker1.getColorValue()), 0);
    tint(colorPicker1.getColorValue());
    myMovie1.play();
    myMovie1.speed(layer1speed);
    if (mapping1) { // quad mapping
      quadGraphics1.beginDraw();
      image(myMovie1, 0, 0, 640, 480); 
      quadGraphics1.endDraw();
     } else if (bmapping1) {  // berzier mapping
      quadGraphics1.beginDraw();
      image(myMovie1, 0, 0, 640, 480); 
      quadGraphics1.endDraw();
      bw1.render(quadGraphics1);
     } else { // no mapping
      image(myMovie1, 0, 0, outputWidth, outputHeight); 
    } // end if mapping
  } else {
     myMovie1.stop();
  }// end if layer1visibility
  
  // pre-render layer 2
  if (layer2visibility) {
    tint(colorPicker2.getColorValue());
    myMovie2.play();
    myMovie2.speed(layer2speed);
    if (mapping2) { // quad mapping
      quadGraphics2.beginDraw();
      image(myMovie2, 0, 0, 640, 480); 
      quadGraphics2.endDraw();
     } else if (bmapping2) {  // berzier mapping
      quadGraphics2.beginDraw();
      image(myMovie2, 0, 0, 640, 480); 
      quadGraphics2.endDraw();
      bw2.render(quadGraphics2);
     } else { // no mapping
      image(myMovie2, 0, 0, outputWidth, outputHeight); 
    } // end if mapping
  } else {
     myMovie2.stop();
  }// end if layer2visibility
  
  
  // pre-render layer 3
  if (layer3visibility) {
    tint(colorPicker3.getColorValue());
    myMovie3.play();
    myMovie3.speed(layer3speed);
    if (mapping3) { // quad mapping
      quadGraphics3.beginDraw();
      image(myMovie3, 0, 0, 640, 480); 
      quadGraphics3.endDraw();
     } else if (bmapping3) {  // berzier mapping
      quadGraphics3.beginDraw();
      image(myMovie3, 0, 0, 640, 480); 
      quadGraphics3.endDraw();
      bw3.render(quadGraphics3);
     } else { // no mapping
      image(myMovie3, 0, 0, outputWidth, outputHeight); 
    } // end if mapping
  } else {
     myMovie3.stop();
  }// end if layer3visibility
  
  // pre-render layer 4
  if (layer4visibility) {
    tint(colorPicker4.getColorValue());
    myMovie4.play();
    myMovie4.speed(layer4speed);
    if (mapping4) { // quad mapping
      quadGraphics4.beginDraw();
      image(myMovie4, 0, 0, 640, 480); 
      quadGraphics4.endDraw();
     } else if (bmapping4) {  // berzier mapping
      quadGraphics4.beginDraw();
      image(myMovie4, 0, 0, 640, 480); 
      quadGraphics4.endDraw();
      bw4.render(quadGraphics4);
     } else { // no mapping
      image(myMovie4, 0, 0, outputWidth, outputHeight); 
    } // end if mapping
  } else {
     myMovie4.stop();
  }// end if layer4visibility
  
  // mapping draw
  if (mapping1 || mapping2 || mapping3 || mapping4) {
    projectedQuads.draw();
  }
  
  
  // render fade
  if (fade > 0.0) {
    fill(0,0,0,map(fade,0.0,100.0,0,255));
    rect(0,0,outputWidth,outputHeight);
  } 
  
  if (changeResolution != 100) { QCchangeResolution(); }
  
} // end draw




// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


//int mX;
//int mY;

void mousePressed(){
  
  // quad mapping click
  projectedQuads.mousePressed();
  
  //mX = mouseX;
  //mY = mouseY;
}

void mouseDragged(){
  
  projectedQuads.mouseDragged();
  
  //frame.setLocation(MouseInfo.getPointerInfo().getLocation().x-mX, MouseInfo.getPointerInfo().getLocation().y-mY);
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

void keyPressed(){
 
  projectedQuads.keyPressed();
  
  switch(key) {
    case '1':
       selectedLayer = 0; break; 
    case '2':
       selectedLayer = 1; break;
    case '3':
       selectedLayer = 2; break;
    case '4':
       selectedLayer = 3; break;
       
    case 'd':
      for(int i = 0; i< 200; i++) { dirs1[i]=""; } // clear dirs
      setInputFolder(selectFolder("select library master folder"));
  
      //String folderPath = selectFolder();
//    if (folderPath == null) {
//      println("No folder was selected..."); // if no folder was selected
//    } 
//    else {
//      // println(folderPath);
//      fileNames = listFileNames(folderPath, txtFilter);
//      println("filenames: \n"+ fileNames[0]);
//      //dirListBox.addItem(fileNames[0],0);
////      for(int i=0;i<fileNames.length;i++) { //
////        dirListBox.addItem(fileNames[i],i);
////      }
//      
//    }
break; // break 'd'
    
  case 'u':
    //myMovie.stop(); myMovie2.delete();
    myMovie1 = new GSMovie(this, "Palatnik2.mov");
    //myMovie1.read(); myMovie1.play();
    //file = File.getParentFile();
    //myMovie1.loadMovie();
    
    break; // break 'u'
    
  case 'r': //r
    println("rootFolder: "+rootFolder+"\n");
    
    //String tempString = rootFolder + "/" + fileNames[int(random(fileNames.length))]; // works if master root is selected
    
    switch (selectedLayer) { 
    
    case 0: // layer 1
      tempString = rootFolder + dirs1[selectedDir1] +"/";
      println ("tempString: "+tempString+"\n");
      fileNames = listFileNames(tempString, txtFilter);
      tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames[int(random(fileNames.length))];
      //println ("tempString: "+tempString+"\n");
      myMovie1.delete(); myMovie1 = new GSMovie(this, tempString); myMovie1.read(); myMovie1.play(); myMovie1.loop();
      break; // break layer 1
    case 1: // layer 2
      tempString = rootFolder + dirs2[selectedDir2] +"/";
      fileNames = listFileNames(tempString, txtFilter);
      tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames[int(random(fileNames.length))];
      //println ("tempString: "+tempString+"\n");
      myMovie2.delete(); myMovie2 = new GSMovie(this, tempString); myMovie2.read(); myMovie2.play(); myMovie2.loop();
      break; // break layer 2
    case 2: // layer 3
      tempString = rootFolder + dirs3[selectedDir3] +"/";
      fileNames = listFileNames(tempString, txtFilter);
      tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames[int(random(fileNames.length))];
      //println ("tempString: "+tempString+"\n");
      myMovie3.delete(); myMovie3 = new GSMovie(this, tempString); myMovie3.read(); myMovie3.play(); myMovie3.loop();
      break; // break layer 3
    case 3: // layer 4
      tempString = rootFolder + dirs4[selectedDir4] +"/";
      fileNames = listFileNames(tempString, txtFilter);
      tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames[int(random(fileNames.length))];
      //println ("tempString: "+tempString+"\n");
      myMovie4.delete(); myMovie4 = new GSMovie(this, tempString); myMovie4.read(); myMovie4.play(); myMovie4.loop();
      break; // break layer 2
    } // end switch selectedLayer
    
    break; // break 'r'
    
  case 'i': //
   effectInvert1 = !(effectInvert1);
  break; // break 'i'
    
  } // end switch key
  
  if (key == CODED) {
      if (keyCode == KeyEvent.VK_F1) { controlWindow.activateTab("default"); }
      if (keyCode == KeyEvent.VK_F2) { controlWindow.activateTab("Effects"); }
      if (keyCode == KeyEvent.VK_F3) { controlWindow.activateTab("Rhythm"); }
      if (keyCode == KeyEvent.VK_F4) { controlWindow.activateTab("Sequencer"); }
      if (keyCode == KeyEvent.VK_F5) { controlWindow.activateTab("Mapping"); }
      if (keyCode == KeyEvent.VK_F6) { controlWindow.activateTab("3D"); }
      if (keyCode == KeyEvent.VK_F7) { controlWindow.activateTab("Playlist"); }
      if (keyCode == KeyEvent.VK_F8) { controlWindow.activateTab("Audio"); }
      if (keyCode == KeyEvent.VK_F9) { controlWindow.activateTab("Prefs"); }
      if (keyCode == KeyEvent.VK_F10) { controlWindow.activateTab("Help"); }
    } // end if keyCoded  
    
} // end keyPressed


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

  void dropEvent(DropEvent theDropEvent) {
    if(theDropEvent.isFile()) {
      File myFile = theDropEvent.file();
      if(myFile.isFile()) {
        println("toString()\t"+theDropEvent.toString());
        newMovie = theDropEvent.toString();
        changeMovie = true;
      }
    } // end theDropEvent.isFile()   
  } // end dropEvent


//class MyDropListener2 extends DropListener {
//  MyDropListener2() { setTargetRect(columnWidth*1,20,columnWidth*2,screenHeight); }
//  void dropEvent(DropEvent theEvent) {
//    if(theEvent.isFile()) {
//      File myFile = theEvent.file();
//      if(myFile.isFile()) {
//        println("toString()\t"+theEvent.toString());
//        newMovie = theEvent.toString();
//        change2 = true;
//      }
//    } // end theDropEvent.isFile()   
//  } // end dropEvent
//} // end class myDropListener
  
  
  
public void stop() {
  myMovie1.stop(); myMovie2.stop(); myMovie3.stop(); myMovie4.stop(); 
  myMovie1.delete(); myMovie2.delete(); myMovie3.delete(); myMovie4.delete();
  
  audio1.close(); minim.stop();
  
  super.stop();
} 
  
      
      //println(myMouseX);
//      if ((mouseX - controlWindow.position()) < (columnWidth*2) ) {
//          myMovie2 = new GSMovie(this, theDropEvent.toString()); myMovie2.read();
//      } else if (mouseX > (columnWidth*2) && mouseX < (columnWidth*3) ) {
//          myMovie3 = new GSMovie(this, theDropEvent.toString()); myMovie3.read();
//      } else if (mouseX > (columnWidth*3) && mouseX < (columnWidth*4) ) {
//          myMovie4 = new GSMovie(this, theDropEvent.toString()); myMovie4.read();
//      }
//    }
//  }
//}


