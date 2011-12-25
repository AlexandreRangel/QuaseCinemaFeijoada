//
// Quase-Cinema Feijoada Remix 0.01+
// Alexandre Rangel
// www.quasecinema.org
//
// built with Processing 2.0 alpha 4
//

String defaultFolderPath, defaultFolderPathMp3;

// set to output size (can be changed prefs tab, while running). See also frame.setLocation
public int outputWidth = 1024; public int outputHeight = 768;
public int outputXpos = 1440; public int outputYpos = 0;


// libraries
import controlP5.*; // controlP5 0.6.12 http://www.sojamo.de/libraries/controlP5
import codeanticode.gsvideo.*; // GSvideo 1.0.0 http://gsvideo.sourceforge.net/
import processing.opengl.*; import javax.media.opengl.GL; // openGL
import sojamo.drop.*; // sDrop 0.1.4 http://www.sojamo.de/libraries/drop
import mappingtools.*; // mappingtools 0.0.2 http://www.patricksaintdenis.com
import ddf.minim.*; import ddf.minim.analysis.*; // minim http://code.compartmental.net/tools/minim
import themidibus.*; MidiBus myBus; // The MidiBus http://smallbutdigital.com/themidibus.php

// controlP5
ControlP5 controlP5; ControlWindow controlWindow; ControlWindowCanvas cc;

ColorPicker colorPicker1, colorPicker2, colorPicker3, colorPicker4;
int layerOpacity1 = 255; int layerOpacity2 = 255; int layerOpacity3 = 255; int layerOpacity4 = 255;
DropdownList layerComposite1Menu, layerComposite2Menu, layerComposite3Menu, layerComposite4Menu;
int layerComposite1select=0; int layerComposite2select=0; int layerComposite3select=0; int layerComposite4select=0;
ListBox outputResolutionList;
Numberbox outputXposNumberBox, outputYposNumberBox;
RadioButton layerContentButton1, layerContentButton2, layerContentButton3, layerContentButton4;
Button randomDir1, randomMov1; 
Button randomDirButton1, randomDirButton2, randomDirButton3, randomDirButton4,
       randomMovButton1, randomMovButton2, randomMovButton3, randomMovButton4;
int doRandomize = 100; int doRandomizeDir = 100; // 100 = don't do it

Textarea textHelp;

public int fpsValue = 0; // fps slider value

public GSMovie myMovie1, myMovie2, myMovie3, myMovie4; // movies

String newMovie = "";
public boolean changeMovie = false;

GSPipeline pipeline; // camera

SDrop drop;

// OS variables
public String OSname;
public String OSseparator;

// dirs pre setup
public String[] fileNames;
public String folderPath = " ";
int dirClicked = 1;
public String rootFolder;

String dirs1[] = new String[200]; String dirs2[] = new String[200];
String dirs3[] = new String[200]; String dirs4[] = new String[200];
int fileCounter1 = 0; int fileCounter2 = 0; int fileCounter3 = 0; int fileCounter4 = 0;
int fileCounter1limit = 21; int fileCounter2limit = 21; int fileCounter3limit = 21; int fileCounter4limit = 21;
int selectedDir1 = 1; int selectedDir2 = 2; int selectedDir3 = 3; int selectedDir4 = 4;
int dirPages1 = 0; int dirPages2 = 0; int dirPages3 = 0; int dirPages4 = 0;
int dirPageSelected1 = 0; int dirPageSelected2 = 0; int dirPageSelected3 = 0; int dirPageSelected4 = 0;
PFont debugFont;
public String tempString;

// mp3 pre setup
public String[] fileNamesMp3;
String dirsMp3[] = new String[200];
int selectedDirMp3;
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

boolean layer1visibility=true; boolean layer2visibility=false; boolean layer3visibility=false; boolean layer4visibility=false;
boolean layer1loop=true; boolean layer2loop=true; boolean layer3loop=true; boolean layer4loop=true;

int layerContent1, layerContent2, layerContent3, layerContent4;

boolean mapping1 = false; boolean mapping2 = false; boolean mapping3 = false; boolean mapping4 = false;
boolean bmapping1 = false; boolean bmapping2 = false; boolean bmapping3 = false; boolean bmapping4 = false;

int layer1bpmVis, layer2bpmVis, layer3bpmVis, layer4bpmVis;
int layer1bpmTime, layer2bpmTime, layer3bpmTime, layer4bpmTime;
int layer1bpmMovie, layer2bpmMovie, layer3bpmMovie, layer4bpmMovie;

float layer1speed = 1.0; float layer2speed = 1.0; float layer3speed = 1.0; float layer4speed = 1.0;
public float layer1playback, layer2playback, layer3playback, layer4playback;

float layer1volume = 0.0; float layer2volume = 0.0; float layer3volume = 0.0; float layer4volume = 0.0;

boolean paint1=false; boolean paint2=false; boolean paint3=false; boolean paint4=false;

// effects pre setup
public boolean effectInvert1 = false; public boolean effectInvert2 = false;
public boolean effectInvert3 = false; public boolean effectInvert4 = false; 

public boolean effectPosterize1 = false; public boolean effectPosterize2 = false;
public boolean effectPosterize3 = false; public boolean effectPosterize4 = false;

public boolean effectPaint1 = false; public boolean effectPaint2 = false;
public boolean effectPaint3 = false; public boolean effectPaint4 = false;

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

public int paintAmount1 = 0; public int paintAmount2 = 0;
public int paintAmount3 = 0; public int paintAmount4 = 0;

public void init(){
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


void setup() {
  size(outputWidth, outputHeight, OPENGL); //hint(ENABLE_OPENGL_4X_SMOOTH);
  
  frame.setResizable(true);
  frameRate(60);
  // set to output location (position of second display, usually 1440,0)
  frame.setLocation(outputXpos,outputYpos); // maybe frame.setLocation(screen.width,0);
  
  PGraphicsOpenGL pgl = (PGraphicsOpenGL)g;  
  GL gl = pgl.beginGL();
  gl.setSwapInterval(1); // Enable VSync
  pgl.endGL();
  
  // variables setup
  QCsetupInterface();
  
  // SET THE TWO NEXT STRINGS FOR YOUR PATHS:
  // default MP3 directory and
  // default movie folders path (path containing movie directories)

  defaultFolderPath = dataPath("_videos"); // relative path
  //defaultFolderPath = "/Users/rangel/Documents/QC_Performance/bin/data/_videos";
  //String defaultFolderPath = System.getProperty("user.home")+"/Desktop"; // desktop example
  //String defaultFolderPath = "/Users/admin/Desktop"; // Unix path example
  //String defaultFolderPath = "C:\\windows"; // windows path example
  
  // MP3 FILES here (no folders)
  defaultFolderPathMp3 = dataPath("_audio"); // relative path
  
  // Operational System
  OSname = System.getProperty("os.name");
  System.out.println("OS Name: " + OSname);
  System.out.println("OS Architecture: " + System.getProperty("os.arch"));
  System.out.println("OS Version: " + System.getProperty("os.version"));
  
  if (OSname.equals("Mac OS X")) { OSseparator = System.getProperty("file.separator"); }
  
  
  //
  // projectedQuads setup
  //
  
  projectedQuads = new ProjectedQuads();  
  projectedQuads.load(configFile);  
  
  //we want to show 4 quads so if there was no config file or less than 3 quads, increase num to 3
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
 
  
  //
  // GStreamer setup
  //
  if (OSname == "Mac OS X") { GSVideo.localGStreamerPath = sketchPath("code/gstreamer/macosx64"); }
  if (OSname == "Windows") { GSVideo.localGStreamerPath = sketchPath("code\\gstreamer\\windows64"); }
  
  tempString = rootFolder + dirs1[selectedDir1] + OSseparator;
  println (tempString);
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs1[selectedDir1] + OSseparator + fileNames[int(random(fileNames.length))];
  myMovie1 = new GSMovie(this, tempString); myMovie1.read(); myMovie1.play();
  if(layer1loop){ myMovie1.loop(); }
  
  tempString = rootFolder + dirs2[selectedDir2] + OSseparator;
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs2[selectedDir2] + OSseparator + fileNames[int(random(fileNames.length))];
  myMovie2 = new GSMovie(this, tempString); myMovie2.read(); myMovie2.play();
  if(layer2loop){ myMovie2.loop(); }
  
  tempString = rootFolder + dirs3[selectedDir3] + OSseparator;
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs3[selectedDir3] + OSseparator + fileNames[int(random(fileNames.length))];
  myMovie3 = new GSMovie(this, tempString); myMovie3.read(); myMovie3.play();
  if(layer3loop){ myMovie3.loop(); }
  
  tempString = rootFolder + dirs4[selectedDir4] + OSseparator;
  fileNames = listFileNames(tempString, txtFilter);
  tempString = rootFolder + dirs4[selectedDir4] + OSseparator + fileNames[int(random(fileNames.length))];
  myMovie4 = new GSMovie(this, tempString); myMovie4.read(); myMovie4.play();
  if(layer4loop){ myMovie4.loop(); }
      
  
  // timer setup
  layer1bpmVisLastTime=millis(); layer2bpmVisLastTime=millis(); layer3bpmVisLastTime=millis(); layer4bpmVisLastTime=millis();
  layer1bpmTimeLastTime=millis(); layer2bpmTimeLastTime=millis(); layer3bpmTimeLastTime=millis(); layer4bpmTimeLastTime=millis();
  layer1bpmMovieLastTime=millis(); layer2bpmMovieLastTime=millis(); layer3bpmMovieLastTime=millis(); layer4bpmMovieLastTime=millis();
  
  
  // audio setup
  for(int i = 0; i< 200; i++) { dirsMp3[i]=""; }
  
  tempString = defaultFolderPathMp3 + OSseparator;
  fileNamesMp3 = listFileNames(tempString, txtFilterMp3); //println(fileNamesMp3);
  
  //minim = new Minim(this);
  //selectedDirMp3 = int(random(fileNamesMp3.length));
  //tempString = defaultFolderPathMp3 + OSseparator +fileNamesMp3[selectedDirMp3];
  //audio1 = minim.loadFile("audio1.mp3", 2048);
  //audio1 = minim.loadFile(tempString,512);
  //audio1.loop();
  //fft = new FFT(audio1.bufferSize(), audio1.sampleRate());
  //fft.logAverages(22, 3);
  
  // midi setup
  MidiBus.list(); myBus = new MidiBus(this, 1, 1);
  
  // camera setup
  // Camera Mac
  pipeline = new GSPipeline(this, "qtkitvideosrc");
  // Camera Windows - first device:
  // pipeline = new GSPipeline(this, "dshowvideosrc ! decodebin2");
  // Windows - choose the device based on its name property.
  //pipeline = new GSPipeline(this, "dshowvideosrc device-name=\"Sony Visual Communication Camera VGP-VCC7\" ! decodebin2");
  // Camera Linux:
  // pipeline = new GSPipeline(this, "v4l2src");  
  
  
  
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


public void draw() {
  
  // openGL draw setup
  
  PGraphicsOpenGL pgl = (PGraphicsOpenGL)g;  
  GL gl = pgl.beginGL();
  gl.setSwapInterval(1); // Enable VSync
  pgl.endGL();
   
  if (!effectPaint1 && !effectPaint2 && !effectPaint3 && !effectPaint4) { background(0); }
  else {
    fill(0,0,0,map(paintAmount1,0.0,256.0,15.0,0.0));
    rect(0,0,outputWidth,outputHeight);
  } // end if light paint
  
  // movies update
  if (myMovie1.available()) { myMovie1.read(); QCeffects1(); }
  if (myMovie2.available()) { myMovie2.read(); QCeffects2(); }
  if (myMovie3.available()) { myMovie3.read(); QCeffects3(); }
  if (myMovie4.available()) { myMovie4.read(); QCeffects4(); }
  
  // camera update
  if (layerContent1==2 || layerContent2==2 || layerContent3==2 || layerContent4==2) { // camera selected
    if (!pipeline.isPlaying()) { pipeline.play(); }
    //println("Pipeline string: " + pipeline.getPipeline());
    if (pipeline.available()) { pipeline.read(); }
  } // end if camera update
  
  // light paint update (turns on lighten composite mode)
  if (effectPaint1) { layerComposite1select=1; }
  if (effectPaint2) { layerComposite2select=1; }
  if (effectPaint3) { layerComposite3select=1; }
  if (effectPaint4) { layerComposite4select=1; }
  
  //
  // drop movie
  //
  
  if (changeMovie && selectedLayer == 0) {
   myMovie1.delete();
   myMovie1 = new GSMovie(this, newMovie); myMovie1.play();
   if(layer1loop){ myMovie1.loop(); }
   changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 1) {
   myMovie2.delete();
   myMovie2 = new GSMovie(this, newMovie); myMovie2.play();
   if(layer2loop){ myMovie2.loop(); }
   changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 2) {
   myMovie3.delete();
   myMovie3 = new GSMovie(this, newMovie); myMovie3.play();
   if(layer3loop){ myMovie3.loop(); }
   changeMovie = false; 
  }
  if (changeMovie && selectedLayer == 3) {
   myMovie4.delete();
   myMovie4 = new GSMovie(this, newMovie); myMovie4.play();
   if(layer4loop){ myMovie4.loop(); }
   changeMovie = false; 
  }
  
  
  
  //
  // interface update values
  //
  
  // fps
  controlP5.controller("fpsValue").setValue(int(frameRate));

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
    layer1visibility = !(layer1visibility); ((Toggle)controlP5.controller("layer1visibility")).toggle();
    layer1bpmVisLastTime=millis();
  }
  if(layer2bpmVis>0 && millis()-layer2bpmVisLastTime >= map(layer2bpmVis,0,240,1000,10)){ // layer 2
    layer2visibility = !(layer2visibility); ((Toggle)controlP5.controller("layer2visibility")).toggle();
    layer2bpmVisLastTime=millis();
  }
  if(layer3bpmVis>0 && millis()-layer3bpmVisLastTime >= map(layer3bpmVis,0,240,1000,10)){ // layer 3
    layer3visibility = !(layer3visibility); ((Toggle)controlP5.controller("layer3visibility")).toggle();
    layer3bpmVisLastTime=millis();
  }
  if(layer4bpmVis>0 && millis()-layer4bpmVisLastTime >= map(layer4bpmVis,0,240,1000,10)){ // layer 4
    layer4visibility = !(layer4visibility); ((Toggle)controlP5.controller("layer4visibility")).toggle();
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
    String tempString = rootFolder + dirs1[selectedDir1] + OSseparator;
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs1[selectedDir1] + OSseparator + fileNames[int(random(fileNames.length))];
    myMovie1.stop(); myMovie1.delete(); myMovie1 = new GSMovie(this, tempString); myMovie1.read(); myMovie1.play();
    if(layer1loop){ myMovie1.loop(); }
    myMovie1.jump(random(myMovie1.duration()));
    layer1bpmMovieLastTime=millis();
  }
  if(layer2bpmMovie>0 && millis()-layer2bpmMovieLastTime >= map(layer2bpmMovie,0,240,1000,10)){ // layer 2
    // change movie
    String tempString = rootFolder + dirs2[selectedDir2] + OSseparator;
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs2[selectedDir2] + OSseparator + fileNames[int(random(fileNames.length))];
    myMovie2.stop(); myMovie2.delete(); myMovie2 = new GSMovie(this, tempString); myMovie2.read(); myMovie2.play();
    if(layer2loop){ myMovie2.loop(); }
    myMovie2.jump(random(myMovie2.duration()));
    layer2bpmMovieLastTime=millis();
  }
  if(layer3bpmMovie>0 && millis()-layer3bpmMovieLastTime >= map(layer3bpmMovie,0,240,1000,10)){ // layer 3
    // change movie
    String tempString = rootFolder + dirs3[selectedDir3] + OSseparator;
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs3[selectedDir3] + OSseparator + fileNames[int(random(fileNames.length))];
    myMovie3.stop(); myMovie3.delete();myMovie3 = new GSMovie(this, tempString); myMovie3.read(); myMovie3.play();
    if(layer3loop){ myMovie3.loop(); }
    myMovie3.jump(random(0,myMovie3.duration()));
    layer3bpmMovieLastTime=millis();
  }
  if(layer4bpmMovie>0 && millis()-layer4bpmMovieLastTime >= map(layer4bpmMovie,0,240,1000,10)){ // layer 4
    // change movie
    String tempString = rootFolder + dirs4[selectedDir4] + OSseparator;
    fileNames = listFileNames(tempString, txtFilter);
    tempString = rootFolder + dirs4[selectedDir4] + OSseparator + fileNames[int(random(fileNames.length))];
    myMovie4.stop(); myMovie4.delete(); myMovie4 = new GSMovie(this, tempString); myMovie4.read(); myMovie4.play();
    if(layer4loop){ myMovie4.loop(); }
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
    
    // openGL compositing
    if (layerComposite1select != 0) { gl.glDisable(GL.GL_DEPTH_TEST); gl.glEnable(GL.GL_BLEND); } // prepare blend
    if (layerComposite1select == 1) { gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE); } // lighten
    if (layerComposite1select == 2) { gl.glBlendFunc(GL.GL_DST_COLOR, GL.GL_SRC_COLOR);; } // darken
    
    tint(red(colorPicker1.getColorValue()),green(colorPicker1.getColorValue()),blue(colorPicker1.getColorValue()),layerOpacity1);
    //tint(fft.getAvg(5)*255, green(colorPicker1.getColorValue()), 0); // colorPicker1.getColorValue()
    myMovie1.play(); myMovie1.speed(layer1speed);
    if (mapping1) { // quad mapping
      quadGraphics1.beginDraw();
      QCdrawLayer(1,640,480);
      quadGraphics1.endDraw();
     } else if (bmapping1) {  // berzier mapping
      quadGraphics1.beginDraw();
      QCdrawLayer(1,640,480);
      quadGraphics1.endDraw();
      bw1.render(quadGraphics1);
     } else { // no mapping
      QCdrawLayer(1, outputWidth, outputHeight);
    } // end if mapping
    if (layerComposite1select != 0) { pgl.endGL(); }
  } else {
     myMovie1.pause();
  }// end if layer1visibility
  
  // pre-render layer 2
  if (layer2visibility) {
    
    // openGL compositing
    if (layerComposite2select != 0) { gl.glDisable(GL.GL_DEPTH_TEST); gl.glEnable(GL.GL_BLEND); } // prepare blend
    if (layerComposite2select == 1) { gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE); } // lighten
    if (layerComposite2select == 2) { gl.glBlendFunc(GL.GL_DST_COLOR, GL.GL_SRC_COLOR);; } // darken
    
    tint(red(colorPicker2.getColorValue()),green(colorPicker2.getColorValue()),blue(colorPicker2.getColorValue()),layerOpacity2);
    myMovie2.play();
    myMovie2.speed(layer2speed);
    if (mapping2) { // quad mapping
      quadGraphics2.beginDraw();
      QCdrawLayer(2,640,480);
      quadGraphics2.endDraw();
     } else if (bmapping2) {  // berzier mapping
      quadGraphics2.beginDraw();
      QCdrawLayer(2,640,480); 
      quadGraphics2.endDraw();
      bw2.render(quadGraphics2);
     } else { // no mapping
      QCdrawLayer(2, outputWidth, outputHeight);
    } // end if mapping
    if (layerComposite2select != 0) { pgl.endGL(); }
  } else {
     myMovie2.pause();
  }// end if layer2visibility
  
  
  // pre-render layer 3
  if (layer3visibility) {
    
    // openGL compositing
    if (layerComposite3select != 0) { gl.glDisable(GL.GL_DEPTH_TEST); gl.glEnable(GL.GL_BLEND); } // prepare blend
    if (layerComposite3select == 1) { gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE); } // lighten
    if (layerComposite3select == 2) { gl.glBlendFunc(GL.GL_DST_COLOR, GL.GL_SRC_COLOR);; } // darken
    
    tint(red(colorPicker3.getColorValue()),green(colorPicker3.getColorValue()),blue(colorPicker3.getColorValue()),layerOpacity3);
    myMovie3.play();
    myMovie3.speed(layer3speed);
    if (mapping3) { // quad mapping
      quadGraphics3.beginDraw();
      QCdrawLayer(3,640,480);
      quadGraphics3.endDraw();
     } else if (bmapping3) {  // berzier mapping
      quadGraphics3.beginDraw();
      QCdrawLayer(3,640,480);
      quadGraphics3.endDraw();
      bw3.render(quadGraphics3);
     } else { // no mapping
      QCdrawLayer(3, outputWidth, outputHeight);
    } // end if mapping
    if (layerComposite3select != 0) { pgl.endGL(); }
  } else {
     myMovie3.pause();
  }// end if layer3visibility
  
  // pre-render layer 4
  if (layer4visibility) {
    
    // openGL compositing
    if (layerComposite4select != 0) { gl.glDisable(GL.GL_DEPTH_TEST); gl.glEnable(GL.GL_BLEND); } // prepare blend
    if (layerComposite4select == 1) { gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE); } // lighten
    if (layerComposite4select == 2) { gl.glBlendFunc(GL.GL_DST_COLOR, GL.GL_SRC_COLOR);; } // darken
    
    tint(red(colorPicker4.getColorValue()),green(colorPicker4.getColorValue()),blue(colorPicker4.getColorValue()),layerOpacity4);
    myMovie4.play();
    myMovie4.speed(layer4speed);
    if (mapping4) { // quad mapping
      quadGraphics4.beginDraw();
      QCdrawLayer(4,640,480);
      quadGraphics4.endDraw();
     } else if (bmapping4) {  // berzier mapping
      quadGraphics4.beginDraw();
      QCdrawLayer(4,640,480);
      quadGraphics4.endDraw();
      bw4.render(quadGraphics4);
     } else { // no mapping
      QCdrawLayer(4, outputWidth, outputHeight);
    } // end if mapping
    if (layerComposite4select != 0) { pgl.endGL(); }
  } else {
     myMovie4.pause();
  }// end if layer4visibility
  
  // mapping draw
  if (mapping1 || mapping2 || mapping3 || mapping4) {
    projectedQuads.draw();
  }
  
  
  // render fade
  if (fade > 0.0) {
    fill(0,0,0,map(fade,0.0,100.0,0,255)); rect(0,0,outputWidth,outputHeight);
  } 
  
  if (changeResolution != 100) { QCchangeResolution(); }
  
  // midi
  //myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  
  
  // needs to randomize movie?
  switch (doRandomize) {
    case 0: QCrandomMov(0); doRandomize=100; break;
    case 1: QCrandomMov(1); doRandomize=100; break;
    case 2: QCrandomMov(2); doRandomize=100; break;
    case 3: QCrandomMov(3); doRandomize=100; break;
    default: break;
  } // end switch doRandomize
  
  switch (doRandomizeDir) {
    case 0: QCrandomDir(0); doRandomizeDir=100; break;
    case 1: QCrandomDir(1); doRandomizeDir=100; break;
    case 2: QCrandomDir(2); doRandomizeDir=100; break;
    case 3: QCrandomDir(3); doRandomizeDir=100; break;
    default: break;
  } // end switch doRandomize
  
  // memory management
  if (frameCount%600==0) { // clean memory around each 10 seconds
    println (hour()+":"+minute()+":"+second()+" Free Memory: "+Runtime.getRuntime().freeMemory()/1024+" K; Garbage collected;");
    System.gc();
    println (hour()+":"+minute()+":"+second()+" Free Memory: "+Runtime.getRuntime().freeMemory()/1024+" K;\n");
  } // end if 
  
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


