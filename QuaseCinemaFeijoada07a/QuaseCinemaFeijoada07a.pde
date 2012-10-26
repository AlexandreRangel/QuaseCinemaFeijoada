//
// Quase-Cinema Feijoada Remix 0.7a
//
// Alexandre Rangel - VJ Xorume
// www.quasecinema.org
//

import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*; // controlP5 2.0.3 http://www.sojamo.de/libraries/controlP5
import processing.video.*;
import sojamo.drop.*; // sDrop 0.1.4 http://www.sojamo.de/libraries/drop
import ddf.minim.*; // minim http://code.compartmental.net/tools/minim
import ddf.minim.analysis.*;
import themidibus.*; MidiBus myBus; // The MidiBus http://smallbutdigital.com/themidibus.php
import codeanticode.syphon.*; SyphonServer syphon; // Syphon http://interfaze.info/
//import rvg.keystone20.*; // mapping


String defaultFolderPath, defaultFolderPathMp3, defaultFolderPathImage;

public int outputWidth = 800; public int outputHeight = 600; // output size
public int outputYpos = 0; public int outputXpos = 640; // public int outputXpos = 1440; 
int posX, posY, whatWidth, whatHeight;
public int outputGLw = 640; public int outputGLh = 480; // openGL buffer size

int layerOpacity1 = 255; int layerOpacity2 = 255; int layerOpacity3 = 255; int layerOpacity4 = 255;
int layerComposite1select=0; int layerComposite2select=0; int layerComposite3select=0; int layerComposite4select=0;
int doRandomize = 100; 
int doRandomizeDir = 100; // 100 = don't do it
//boolean reloadIcons1 = false; boolean reloadIcons2 = false; boolean reloadIcons3 = false; boolean reloadIcons4 = false;
int iconLoadingLayer1 = 0; int iconLoadingLayer2 = 0; int iconLoadingLayer3 = 0; int iconLoadingLayer4 = 0;

// controlP5
private ControlP5 cp5;
ControlFrame cf;
ControlFont font;
ColorPicker colorPicker1, colorPicker2, colorPicker3, colorPicker4;
DropdownList layerComposite1Menu, layerComposite2Menu, layerComposite3Menu, layerComposite4Menu;
ListBox outputResolutionList, languageList;
Numberbox outputXposNumberBox, outputYposNumberBox;
RadioButton layerContentButton1, layerContentButton2, layerContentButton3, layerContentButton4;
Button randomDir1, randomMov1; 
Button randomDirButton1, randomDirButton2, randomDirButton3, randomDirButton4, 
randomMovButton1, randomMovButton2, randomMovButton3, randomMovButton4;
Textarea textHelp;
//Toggle invertToggle1, invertToggle2, invertToggle3, invertToggle4;

// preview image buffers
PImage iconLayer1 = createImage(160, 120, RGB);
PImage iconLayer2 = createImage(160, 120, RGB);
PImage iconLayer3 = createImage(160, 120, RGB);
PImage iconLayer4 = createImage(160, 120, RGB);
PImage previewFullScreen = createImage(640, 480, RGB);
PImage previewSmall = createImage(240, 180, RGB);

// movies at directory icons
// PImage[] directoryIcons1 = new PImage[32];
// PImage[] directoryIcons2 = new PImage[32];
// PImage[] directoryIcons3 = new PImage[32];
// PImage[] directoryIcons4 = new PImage[32];

boolean showIcons = false;
boolean showDirectoryIcons1 = false; boolean showDirectoryIcons2 = false;
boolean showDirectoryIcons3 = false; boolean showDirectoryIcons4 = false;

int maxIconsLayer1, maxIconsLayer2, maxIconsLayer3, maxIconsLayer4; // maximum icons at dir page

int previewType = 1; 

public int fpsValue; // fps slider value

Movie myMovie1, myMovie2, myMovie3, myMovie4; // movies
Capture webcam;
//Movie[] movieForIcons = new Movie[32];
// GSMovieMaker mm;
boolean generateIcon1 = false; boolean generateIcon2 = false;
boolean generateIcon3 = false; boolean generateIcon4 = false;

//PGraphics3D tex;

String newMovie = "";
boolean changeMovie1 = false; boolean changeMovie2 = false;
boolean changeMovie3 = false; boolean changeMovie4 = false;

SDrop drop;
//MyDropListener m;

//WiiController wiiController;

// OS variables
public String OSname; 
public String OSseparator;

// dirs pre setup
public String[] fileNames1, fileNames2, fileNames3, fileNames4;
public String folderPath = " ";
int dirClicked = 1;
public String rootFolder;

String dirs1[] = new String[200]; 
String dirs2[] = new String[200]; 
String dirs3[] = new String[200]; 
String dirs4[] = new String[200];
int fileCounter1 = 0; int fileCounter2 = 0; int fileCounter3 = 0; int fileCounter4 = 0;
int fileCounter1limit = 21; int fileCounter2limit = 21; int fileCounter3limit = 21; int fileCounter4limit = 21;
int selectedDir1 = 1; int selectedDir2 = 2; int selectedDir3 = 3; int selectedDir4 = 4; // start dirs
int dirPages1 = 0; int dirPages2 = 0; int dirPages3 = 0; int dirPages4 = 0; // dirs total pages
int dirPageSelected1 = 0; int dirPageSelected2 = 0; int dirPageSelected3 = 0; int dirPageSelected4 = 0; // dirs selected pages
PFont debugFont;
public String tempString;

// audio pre setup
Minim minim;
//ddf.minim.AudioPlayer audio1;
ddf.minim.AudioInput audioIn;
FFT fft;
int audioBarWidth;

// mp3 pre setup
public String[] fileNamesMp3;
String dirsMp3[] = new String[200];
int selectedDirMp3;
int fileCounterMp3 = 0; 
int fileCounterLimitMp3 = 20; 

// mapping pre setup
//Keystone20 ks;
//CornerPinSurface surface;

// masks
PImage mascara1, mascara2, mascara3, mascara4, mascara5, mascara6, mascara7, mascara8;

// timer pre setup
int layer1bpmVisLastTime = 0; 
int layer2bpmVisLastTime = 0; 
int layer3bpmVisLastTime = 0; 
int layer4bpmVisLastTime = 0;
int layer1bpmTimeLastTime = 0; 
int layer2bpmTimeLastTime = 0; 
int layer3bpmTimeLastTime = 0; 
int layer4bpmTimeLastTime = 0;
int layer1bpmMovieLastTime = 0; 
int layer2bpmMovieLastTime = 0; 
int layer3bpmMovieLastTime = 0; 
int layer4bpmMovieLastTime = 0;

// variables pre setup
public int selectedLayer = 0;
int interfaceWidth = 1024; // only space for 4 tabs
public int columnWidth = int (interfaceWidth/4);
float fade;

public int changeResolution = 100; // changeResolution = 100 means don't change resolution on the draw loop
public int language = 0;

boolean syphonOutput = false;

boolean layer1visibility = true; 
boolean layer2visibility = false; 
boolean layer3visibility = false; 
boolean layer4visibility = false;
boolean layer1loop=true; boolean layer2loop=true; boolean layer3loop=true; boolean layer4loop=true;

float myMovie1time, myMovie2time, myMovie3time, myMovie4time;
float layer1in, layer2in, layer3in, layer4in;
float layer1out, layer2out, layer3out, layer4out;
float layer1length, layer2length, layer3length, layer4length;
boolean layer1pingPong=false; boolean layer2pingPong=false; boolean layer3pingPong=false; boolean layer4pingPong=false;

int layerContent1, layerContent2, layerContent3, layerContent4;

boolean mapping1 = false; 
boolean mapping2 = false; 
boolean mapping3 = false; 
boolean mapping4 = false; // quad mappings
boolean mappingMask = false; // mapping mask
int mappingMaskIndex = 1;

// show FFT
boolean audioAnalysis1 = false; boolean audioAnalysis2 = false; 
boolean audioAnalysis3 = false; boolean audioAnalysis4 = false;
int FFTband1 = 0;
int FFTband2 = 20;
int FFTband3 = 35;
int FFTband4 = 50;

float FFTbandScale1 = 10.0; float FFTbandScale2 = 10.0; float FFTbandScale3 = 10.0; float FFTbandScale4 = 10.0;

public int layer1bpmVis, layer2bpmVis, layer3bpmVis, layer4bpmVis;
int layer1bpmTime, layer2bpmTime, layer3bpmTime, layer4bpmTime;
int layer1bpmMovie, layer2bpmMovie, layer3bpmMovie, layer4bpmMovie;

float layer1speed = 1.0; float layer2speed = 1.0; float layer3speed = 1.0; float layer4speed = 1.0;

public float layer1playback, layer2playback, layer3playback, layer4playback;

float layer1volume = 0.0; float layer2volume = 0.0; float layer3volume = 0.0; float layer4volume = 0.0;

boolean paint1=false; boolean paint2=false; boolean paint3=false; boolean paint4=false;

boolean scratch1=false; boolean scratch2=false; boolean scratch3=false; boolean scratch4=false;
int scratchPos1, scratchPos2, scratchPos3, scratchPos4;

// effects pre setup
boolean effectInvert1 = false; boolean effectInvert2 = false;
boolean effectInvert3 = false; boolean effectInvert4 = false; 

boolean effectPosterize1 = false; boolean effectPosterize2 = false;
boolean effectPosterize3 = false; boolean effectPosterize4 = false;

boolean effectPaint1 = false; boolean effectPaint2 = false;
boolean effectPaint3 = false; boolean effectPaint4 = false;

boolean effectRG1 = false; boolean effectRG2 = false;
boolean effectRG3 = false; boolean effectRG4 = false;

boolean effectRB1 = false; boolean effectRB2 = false;
boolean effectRB3 = false; boolean effectRB4 = false;

boolean effectBG1 = false; boolean effectBG2 = false;
boolean effectBG3 = false; boolean effectBG4 = false;

boolean effectBW1 = false; boolean effectBW2 = false;
boolean effectBW3 = false; boolean effectBW4 = false;
int effectBWlimit1 = 127; int effectBWlimit2 = 127; 
int effectBWlimit3 = 127; int effectBWlimit4 = 127;
boolean effectBWaudio1 = false; boolean effectBWaudio2 = false;
boolean effectBWaudio3 = false; boolean effectBWaudio4 = false;

boolean effectContrast1 = false; boolean effectContrast2 = false;
boolean effectContrast3 = false; boolean effectContrast4 = false;
float effectContrastLimit1 = 1.0; float effectContrastLimit2 = 1.0;
float effectContrastLimit3 = 1.0; float effectContrastLimit4 = 1.0;
boolean effectContrastAudio1 = false; boolean effectContrastAudio2 = false;
boolean effectContrastAudio3 = false; boolean effectContrastAudio4 = false;

boolean effectSaturation1 = false; boolean effectSaturation2 = false;
boolean effectSaturation3 = false; boolean effectSaturation4 = false;
float effectSaturationLimit1 = 1.0; float effectSaturationLimit2 = 1.0;
float effectSaturationLimit3 = 1.0; float effectSaturationLimit4 = 1.0;
boolean effectSaturationAudio1 = false; boolean effectSaturationAudio2 = false;
boolean effectSaturationAudio3 = false; boolean effectSaturationAudio4 = false;

boolean effectHue1 = false; boolean effectHue2 = false;
boolean effectHue3 = false; boolean effectHue4 = false;
int effectHueLimit1 = 0; int effectHueLimit2 = 0;
int effectHueLimit3 = 0; int effectHueLimit4 = 0;
boolean effectHueAudio1 = false; boolean effectHueAudio2 = false;
boolean effectHueAudio3 = false; boolean effectHueAudio4 = false;

int paintAmount1 = 0; int paintAmount2 = 0; int paintAmount3 = 0; int paintAmount4 = 0;

boolean effectAnaglyph1 = false; boolean effectAnaglyph2 = false;
boolean effectAnaglyph3 = false; boolean effectAnaglyph4 = false;
int effectAnaglyphAmount1 = 0; int effectAnaglyphAmount2 = 0;
int effectAnaglyphAmount3 = 0; int effectAnaglyphAmount4 = 0;
boolean effectAnaglyphAudio1 = false; boolean effectAnaglyphAudio2 = false;
boolean effectAnaglyphAudio3 = false; boolean effectAnaglyphAudio4 = false;

boolean effectLumaKey1 = false; boolean effectLumaKey2 = false;
boolean effectLumaKey3 = false; boolean effectLumaKey4 = false;
int effectLumaKeyAmount1 = 127; int effectLumaKeyAmount2 = 127;
int effectLumaKeyAmount3 = 127; int effectLumaKeyAmount4 = 127;


// transform pre setup

// pos H
boolean posH1 = false; boolean posH2 = false; boolean posH3 = false; boolean posH4 = false;
float posH1value = 0.0; float posH2value = 0.0; float posH3value = 0.0; float posH4value = 0.0;
boolean posH1audio = false; boolean posH2audio = false;boolean posH3audio = false; boolean posH4audio = false;

// pos V
boolean posV1 = false; boolean posV2 = false;boolean posV3 = false; boolean posV4 = false;
float posV1value = 0.0; float posV2value = 0.0; float posV3value = 0.0; float posV4value = 0.0;
boolean posV1audio = false; boolean posV2audio = false; boolean posV3audio = false; boolean posV4audio = false;

// size H
boolean sizeH1 = false; boolean sizeH2 = false; boolean sizeH3 = false; boolean sizeH4 = false;
float sizeH1value = 0.0; float sizeH2value = 0.0; float sizeH3value = 0.0; float sizeH4value = 0.0;
boolean sizeH1audio = false; boolean sizeH2audio = false; boolean sizeH3audio = false; boolean sizeH4audio = false;

// size V
boolean sizeV1 = false; boolean sizeV2 = false; boolean sizeV3 = false; boolean sizeV4 = false;
float sizeV1value = 0.0; float sizeV2value = 0.0; float sizeV3value = 0.0; float sizeV4value = 0.0;
boolean sizeV1audio = false; boolean sizeV2audio = false;boolean sizeV3audio = false; boolean sizeV4audio = false;

// rot X
boolean rotX1 = false; boolean rotX2 = false; boolean rotX3 = false; boolean rotX4 = false;
int rotX1value = 0; int rotX2value = 0; int rotX3value = 0; int rotX4value = 0;
boolean rotX1audio = false; boolean rotX2audio = false; boolean rotX3audio = false; boolean rotX4audio = false;

// rot Y
boolean rotY1 = false; boolean rotY2 = false; boolean rotY3 = false; boolean rotY4 = false;
int rotY1value = 0; int rotY2value = 0; int rotY3value = 0; int rotY4value = 0;
boolean rotY1audio = false; boolean rotY2audio = false; boolean rotY3audio = false; boolean rotY4audio = false;

// rot Z
boolean rotZ1 = false; boolean rotZ2 = false; boolean rotZ3 = false; boolean rotZ4 = false;
int rotZ1value = 0; int rotZ2value = 0; int rotZ3value = 0; int rotZ4value = 0;
boolean rotZ1audio = false; boolean rotZ2audio = false; boolean rotZ3audio = false; boolean rotZ4audio = false;

String clock;

PImage myImage1, myImage2, myImage3, myImage4; // images

PImage myKeyImage; // images for movie keying

boolean recordingMovie = false;

PGraphicsOpenGL outputGL;

//PShader fisheye;
//PShader  shaderEdges;
//PShader  shaderDeform;
//PShader  shaderStar;
//PShader  shaderTwist;
//PShader  shaderKaleidoscope;
//PShader  shaderPulse;
//PShader  shaderTunnel;
//PShader  shaderSquareTunnel;
PShader  shaderContrast;


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//
// setup
//
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

void init() { 
frame.removeNotify(); frame.setUndecorated(true); frame.addNotify(); super.init();
} // end init

void setup() {
size(outputWidth, outputHeight, P3D);
frame.setResizable(true); frameRate(60); frame.setLocation(outputXpos, outputYpos);
background(0,0,0);


//
// openGL setup
//
outputGL = (PGraphicsOpenGL) createGraphics(outputGLw, outputGLh, OPENGL);


//
// movies at directory icons setup
//

// for (int i = 0; i<18; i++){
//   directoryIcons1[i] = createImage(72, 54, RGB);
//   directoryIcons2[i] = createImage(72, 54, RGB);
//   directoryIcons3[i] = createImage(72, 54, RGB);
//   directoryIcons4[i] = createImage(72, 54, RGB);
// }

// PImage[] directoryIcons2[32];
// PImage[] directoryIcons3[32];
// PImage[] directoryIcons4[32];

////////////////////////////////////////
//  interface setup
////////////////////////////////////////

cf = addControlFrame("Quase-Cinema Feijoada Remix 0.07");


////////////////////////////////////////
//  os setup
////////////////////////////////////////

OSname = System.getProperty("os.name");
System.out.println("OS Name: "+OSname+", version: "+System.getProperty("os.version")+", " + System.getProperty("os.arch"));
if (OSname.indexOf("Mac") != -1) { OSseparator = System.getProperty("file.separator");
} else if (OSname.indexOf("Windows") != -1) { OSseparator = System.getProperty("file.separator"); } // end if separator
println(PGraphicsOpenGL.OPENGL_RENDERER+", "+PGraphicsOpenGL.OPENGL_VERSION);




////////////////////////////////////////
//  movies setup
////////////////////////////////////////

if (System.getProperty("user.name").equals("rangel")) { // my folders
  defaultFolderPath = "/Volumes/SSD-Dados/QC_Performance/bin/data/_videos";
  defaultFolderPathImage = "/Volumes/SSD-Dados/QC_Performance/bin/data/_images";
  defaultFolderPathMp3 = "/Volumes/SSD-Dados/QC_Performance/bin/data/_audio";
} else {
  defaultFolderPath = dataPath("_videos"); // relative path
  defaultFolderPathImage = dataPath("_images"); // relative path
  defaultFolderPathMp3 = dataPath("_audio"); // relative path 
} // end if os


////////////////////////////////////////
//  directories setup
////////////////////////////////////////

for (int i = 0; i< 150; i++) { dirs1[i]=""; } // 200 max dirs
setInputFolder(defaultFolderPath);
debugFont = createFont("Arial", 14);
//ControlFont font = new ControlFont(debugFont,);
textFont(debugFont); 


// video 1
tempString = rootFolder + dirs1[selectedDir1] + OSseparator;
fileNames1 = listFileNames(tempString, txtFilter);
tempString = rootFolder + dirs1[selectedDir1] + OSseparator + fileNames1[int(random(fileNames1.length)-1)];
println ("\nvideo 1: "+ tempString);
myMovie1 = new Movie(this, tempString); myMovie1.play();
layer1in = 0; layer1out = myMovie1.duration(); // layer in and out
if (layer1loop) { myMovie1.loop(); }

// video 2
tempString = rootFolder + dirs2[selectedDir2] + OSseparator;
fileNames2 = listFileNames(tempString, txtFilter);
tempString = rootFolder + dirs2[selectedDir2] + OSseparator + fileNames2[int(random(fileNames2.length)-1)];
println ("\nvideo 2: "+ tempString);
myMovie2 = new Movie(this, tempString); myMovie2.play(); 
layer2in = 0; layer2out = myMovie2.duration(); // layer in and out
if (layer2loop) { myMovie2.loop(); }

// video 3
tempString = rootFolder + dirs3[selectedDir3] + OSseparator;
fileNames3 = listFileNames(tempString, txtFilter);
tempString = rootFolder + dirs3[selectedDir3] + OSseparator + fileNames3[int(random(fileNames3.length)-1)];
println ("\nvideo 3: "+ tempString);
myMovie3 = new Movie(this, tempString); myMovie3.play(); 
layer3in = 0; layer3out = myMovie3.duration(); // layer in and out
if (layer3loop) { myMovie3.loop(); }

// video 4
tempString = rootFolder + dirs4[selectedDir4] + OSseparator;
fileNames4 = listFileNames(tempString, txtFilter);
tempString = rootFolder + dirs4[selectedDir4] + OSseparator + fileNames4[int(random(fileNames4.length)-1)];
println ("\nvideo 4: "+ tempString);
myMovie4 = new Movie(this, tempString); myMovie4.play(); 
layer4in = 0; layer4out = myMovie4.duration(); // layer in and out
if (layer4loop) { myMovie4.loop(); }

// webcam setup  
webcam = new Capture(this, 320, 240);


////////////////////////////////////////
//  masks setup
////////////////////////////////////////

mascara1 = loadImage("mask1.png"); // load mask
mascara2 = loadImage("mask2.png"); // load mask
mascara3 = loadImage("mask3.png"); // load mask
mascara4 = loadImage("mask4.png"); // load mask
mascara5 = loadImage("mask5.png"); // load mask
mascara6 = loadImage("mask6.png"); // load mask
mascara7 = loadImage("mask7.png"); // load mask
mascara8 = loadImage("mask8.png"); // load mask


////////////////////////////////////////
//  timer setup
////////////////////////////////////////

layer1bpmVisLastTime=millis(); 
layer2bpmVisLastTime=millis(); 
layer3bpmVisLastTime=millis(); 
layer4bpmVisLastTime=millis();
layer1bpmTimeLastTime=millis(); 
layer2bpmTimeLastTime=millis(); 
layer3bpmTimeLastTime=millis(); 
layer4bpmTimeLastTime=millis();
layer1bpmMovieLastTime=millis(); 
layer2bpmMovieLastTime=millis(); 
layer3bpmMovieLastTime=millis(); 
layer4bpmMovieLastTime=millis();


////////////////////////////////////////
//  audio input setup
////////////////////////////////////////

minim = new Minim(this); 
audioIn = minim.getLineIn(Minim.STEREO, 512);
fft = new FFT(audioIn.bufferSize(), audioIn.sampleRate());
fft.logAverages(60, 7);
//audioBarWidth = width/fft.avgSize();
audioBarWidth = 222/fft.avgSize();


////////////////////////////////////////
//  midi setup
////////////////////////////////////////

MidiBus.list(); myBus = new MidiBus(this, 0, 0);


////////////////////////////////////////
//  shader setup
////////////////////////////////////////

shaderContrast = loadShader("contrast.glsl");
shaderContrast.set("contrast", 1.0);
shaderContrast.set("saturation", 1.0);  


////////////////////////////////////////
//  mapping setup
////////////////////////////////////////
//ks = new Keystone20(this);
//surface = ks.createCornerPinSurface(640, 480, 20);
 

} // end setup





























////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  draw
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  //background(0,0,255);
  
  // glsl
// shaderDeform.set("time", millis() / 1000.0);
// shaderDeform.set("mouse", float(mouseX), float(mouseY));

  // shaderContrast.set("contrast", map(effectContrastLimit1, 0, 200, 1, 3));
  // shaderContrast.set("saturation", map(effectSaturationLimit1, 0, 256, 1, 3));

  

// memory garbage collection
if (frameCount % 10800 == 0) { // each 3 minutes
  System.gc();
  DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
  Date d = new Date(); clock = formatter.format(d);
  println("Memory garbage collection done at "+clock+"."); }


//
// fps updates
//

//if (random(10)>5) { fpsValue = int(frameRate); }

fpsValue = ( (fpsValue*9) + int(frameRate) ) / 10; // smooth fps value

//
// change movie
// drop movie
//

if (changeMovie1) {
  //myMovie1.delete();
  myMovie1.stop(); myMovie1 = null;
  myMovie1 = new Movie(this, newMovie);
  myMovie1.read(); myMovie1.loop();
  layer1in = 0; layer1length = myMovie1.duration(); layer1out = layer1length;
  changeMovie1 = false;
} else if (changeMovie2) {
  myMovie2.stop(); myMovie2 = null;
  myMovie2 = new Movie(this, newMovie); 
  myMovie2.read(); myMovie2.loop();
  layer2in = 0; layer2length = myMovie2.duration(); layer2out = layer2length;
  changeMovie2 = false;
} else if (changeMovie3) {
  myMovie3.stop(); myMovie3 = null;
  myMovie3 = new Movie(this, newMovie); 
  myMovie3.read(); myMovie3.loop();
  layer3in = 0; layer3length = myMovie3.duration(); layer3out = layer3length;
  changeMovie3 = false;
} else if (changeMovie4) {
  myMovie4.stop(); myMovie4 = null;
  myMovie4 = new Movie(this, newMovie); 
  myMovie4.read(); myMovie4.loop();
  layer4in = 0; layer4length = myMovie4.duration(); layer4out = layer4length;
  changeMovie4 = false;
}

//
// webcam update
//

if (layerContent1==2 || layerContent2==2 || layerContent3==2 || layerContent4==2){ // any webcam?
  webcam.read();
}


//
// movies update
//

//
// movie 1
//
if (layer1visibility && layerContent1 == 0) {
  myMovie1.speed(layer1speed); myMovie1.play();

  // loop check
  if (myMovie1.time() <= layer1in && layer1speed < 0) { // checks loop backward
    
    if (layer1pingPong) { layer1speed = -layer1speed; } // ping pong play
    else { myMovie1.speed(-layer1speed); myMovie1.jump(layer1out); myMovie1.speed(layer1speed); } // reset play
    
  } else if (( myMovie1.time() >= layer1out || myMovie1.time()==myMovie1.duration()-1 ) && layer1speed > 0) { // checks loop foward
    
    if (layer1pingPong) { layer1speed = -layer1speed; } // ping pong play
    else { myMovie1.jump(layer1in); myMovie1.speed(layer1speed); } // reset play
    
  } // end loop check
           
  if (myMovie1.available()) {
    myMovie1time = map(myMovie1.time(), 0.0, myMovie1.duration(), 0.0, 1.0);
    if (scratch1) { myMovie1.jump(scratchPos1); } // end if scratch
    myMovie1.read(); myMovie1.play();
    QCeffects1(); // do effects
  } // end if movie available
} // end if movie 1 update

//
// movie 2
//
if (layer2visibility && layerContent2 == 0) {
  myMovie2.speed(layer2speed); myMovie2.play();

  // loop check
  if (myMovie2.time() <= layer2in && layer2speed < 0) { // checks loop backward

    if (layer2pingPong) { layer2speed = -layer2speed; } // ping pong play
    else { myMovie2.speed(-layer2speed); myMovie2.jump(layer2out); myMovie2.speed(layer2speed); } // reset play

  } else if (( myMovie2.time() >= layer2out || myMovie2.time()==myMovie2.duration()-1 ) && layer2speed > 0) { // checks loop foward

    if (layer2pingPong) { layer2speed = -layer2speed; } // ping pong play
    else { myMovie2.jump(layer2in); myMovie2.speed(layer2speed); } // reset play

  } // end loop check
        
  if (myMovie2.available()) {
    myMovie2time = map(myMovie2.time(), 0.0, myMovie2.duration(), 0.0, 1.0);
    if (scratch2) { myMovie2.jump(scratchPos2); } // end if scratch
    myMovie2.read(); myMovie2.play();
    QCeffects2();  // do effects
  } // end if movie available
} // end if movie 2 update

// movie 3
if (layer3visibility && layerContent3 == 0) {
  myMovie3.speed(layer3speed); myMovie3.play();

  // loop check
  if (myMovie3.time() <= layer3in && layer3speed < 0) { // checks loop backward

    if (layer3pingPong) { layer3speed = -layer3speed; } // ping pong play
    else { myMovie3.speed(-layer3speed); myMovie3.jump(layer3out); myMovie3.speed(layer3speed); } // reset play

  } else if (( myMovie3.time() >= layer3out || myMovie3.time()==myMovie3.duration()-1 ) && layer3speed > 0) { // checks loop foward

    if (layer3pingPong) { layer3speed = -layer3speed; } // ping pong play
    else { myMovie3.jump(layer2in); myMovie3.speed(layer3speed); } // reset play

  } // end loop check
          
  if (myMovie3.available()) {
    myMovie3time = map(myMovie3.time(), 0.0, myMovie3.duration(), 0.0, 1.0);
    if (scratch3) { myMovie3.jump(scratchPos3); } // end if scratch
    myMovie3.read(); myMovie3.play();
    QCeffects3();
  } // end if movie available
} // end if movie 3 update

//
// movie 4
//
if (layer4visibility && layerContent4 == 0) {
  myMovie4.speed(layer4speed); myMovie4.play();

  // loop check
  if (myMovie4.time() <= layer4in && layer4speed < 0) { // checks loop backward
    if (layer4pingPong) { layer4speed = -layer4speed; } // ping pong play
    else { myMovie4.speed(-layer4speed); myMovie4.jump(layer4out); myMovie4.speed(layer4speed); } // reset play
  } else if (( myMovie4.time() >= layer4out || myMovie4.time()==myMovie4.duration()-1 ) && layer4speed > 0) { // checks loop foward
    if (layer4pingPong) { layer4speed = -layer4speed; } // ping pong play
    else { myMovie4.jump(layer4in); myMovie4.speed(layer4speed); } // reset play
  } // end loop check
          
  if (myMovie4.available()) {
    myMovie4time = map(myMovie4.time(), 0.0, myMovie4.duration(), 0.0, 1.0);
    if (scratch4) { myMovie4.jump(scratchPos4); } // end if scratch
    myMovie4.read(); myMovie4.play();
    QCeffects4();  // do effects
  } // end if movie available
} // end if movie 4 update


//
// reload movie at directory icons?
//


// load directory icons layer 4
// if (reloadIcons4 && random(10)>9){
//   if (fileNames4.length > 32) { maxIconsLayer4 = 31; } else { maxIconsLayer4 = fileNames4.length; } // number of icons

//   println("fileNames4.length: " + fileNames4.length);

//   tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames4[iconLoadingLayer4];
//   println ("loading icon: "+tempString);
//   //if (movieForIcons != null) { movieForIcons.stop(); movieForIcons = null; println("killing movie");} 
//   movieForIcons[iconLoadingLayer4] = new Movie(this, tempString);
//   movieForIcons[iconLoadingLayer4].read(); movieForIcons[iconLoadingLayer4].play();

//   //image(movieForIcons, 0, 0, 60, 45);
//   //directoryIcons4[iconLoadingLayer4].loadPixels();
//   //directoryIcons4[iconLoadingLayer4].copy(movieForIcons[iconLoadingLayer4], 0, 0, movieForIcons[iconLoadingLayer4].width, movieForIcons[iconLoadingLayer4].height, 0, 0, 60, 45);
//   //directoryIcons4[iconLoadingLayer4].updatePixels();

//   //directoryIcons4[iconLoadingLayer4] = movieForIcons.get(0, 0, 60, 45);
//   //directoryIcons4[iconLoadingLayer4].resize(60, 45);

//   //directoryIcons4[iconLoadingLayer4].copy(myMovie1, 0, 0, myMovie1.width, myMovie1.height, 0, 0, 60, 45);

//   println("iconLoadingLayer4: "+ iconLoadingLayer4);
//   iconLoadingLayer4 = iconLoadingLayer4 + 1;


//   if (iconLoadingLayer4 == maxIconsLayer4) { reloadIcons4 = false; iconLoadingLayer4 = 0; } // done loading these icons
//   //xxxx
// }




















//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////  output draw
////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



outputGL.beginDraw();

outputGL.blendMode(BLEND);


// clears background
if (!effectPaint1 && !effectPaint2 && !effectPaint3 && !effectPaint4) {

  //hint(DISABLE_DEPTH_TEST);
  outputGL.fill(0);
  outputGL.rect(0, 0, outputGLw, outputGLh); 
  } else {
  outputGL.fill(0, 0, 0, map(paintAmount1, 0.0, 256.0, 15.0, 0.0));
  outputGL.rect(0, 0, outputGLw, outputGLh); 
} // end if light paint


//
// layer 1 draw
//

if (layer1visibility) {
  //outputGL.tint(red(colorPicker1.getColorValue()), green(colorPicker1.getColorValue()), blue(colorPicker1.getColorValue()), layerOpacity1);
  
  // Shaders layer 1
  // || effectSaturation1
  if (effectContrast1) {
    outputGL.shader(shaderContrast);
    shaderContrast.set("contrast", effectContrastLimit1);
    
    //shaderContrast.set("saturation", effectSaturationLimit1);
    
    //if (effectContrastLimit1 > 0) { shaderContrast.set("contrast", map(effectContrastLimit1, 0, 200, 1, 3)); } 
    //if (effectSaturationLimit1 > 0) { shaderContrast.set("saturation", map(effectSaturationLimit1, 0, 256, 1, 3)); }
  } else {
    outputGL.resetShader();
  }

    if (effectAnaglyph1) { // anaglyph
      outputGL.tint(255, 0, 0); // red
      outputGL.image(myMovie1, effectAnaglyphAmount1, 0, outputGLw, outputGLh);
      outputGL.tint(0, 255, 255); // cyan
      outputGL.blendMode(ADD);
      outputGL.image(myMovie1, 0, 0, outputGLw, outputGLh);
      outputGL.tint(255, 255, 255); outputGL.blendMode(BLEND);
      //QCdrawLayer(1, -(effectAnaglyphAmount1), 0, outputWidth, outputHeight);
    } 
    else { // no anaglyph --- simple movie draw

      outputGL.blendMode(BLEND); // only for layer 1
      //QCeffects1();
      outputGL.tint(red(colorPicker1.getColorValue()), green(colorPicker1.getColorValue()), blue(colorPicker1.getColorValue()), layerOpacity1);

      // transforms layer 1
      posX = 0; posY = 0; whatWidth = outputWidth; whatHeight = outputHeight;
      if (posH1) { posX = int(outputWidth * posH1value); }
      if (posV1) { posY = int(outputHeight * posV1value); }
      if (sizeH1) { whatWidth = int(outputWidth * sizeH1value); }
      if (sizeV1) { whatHeight = int(outputHeight * sizeV1value); }
      if (rotX1) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateX(radians(rotX1value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY1) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateY(radians(rotY1value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ1) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateZ(radians(rotZ1value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      
      // draw layer 1
      switch (layerContent1) {
        case 0: // movie
           outputGL.image(myMovie1, posX, posY, outputGLw, outputGLh);
           // icon movie
           if ((frameCount+1)%5==0 && previewType > 0) { iconLayer1.copy(myMovie1, 0, 0, myMovie1.width, myMovie1.height, 0, 0, 160, 120); }
           break;
        case 1: // still image
          outputGL.image(myImage1, posX, posY, outputGLw, outputGLh); break; // image
        case 2: // camera
          outputGL.image(webcam, posX, posY, outputGLw, outputGLh);
          // icon webcam
          if ((frameCount+1)%5==0 && previewType > 0) { iconLayer1.copy(webcam, 0, 0, webcam.width, webcam.height, 0, 0, 160, 120); }
          break;
      } // end switch layerContent1
      outputGL.blendMode(BLEND); // resets blend

    } // end if anaglyph

} else {
  myMovie1.pause();
}// end if layer1visibility


//
// layer 2 draw
//

if (layer2visibility) {
  //outputGL.tint(red(colorPicker2.getColorValue()), green(colorPicker2.getColorValue()), blue(colorPicker2.getColorValue()), layerOpacity2);
   
  // Shaders layer 2
  if (effectContrast2) {
    outputGL.shader(shaderContrast);
    shaderContrast.set("contrast", effectContrastLimit2);
  } else {
    outputGL.resetShader();
  }

    // openGL compositing layer 2
    if (layerComposite2select == 0) { outputGL.blendMode(BLEND); }
    else if (layerComposite2select == 1) { outputGL.blendMode(ADD); }
    else if (layerComposite2select == 2) { outputGL.blendMode(SCREEN); }
    else if (layerComposite2select == 3) { outputGL.blendMode(LIGHTEST); }
    else if (layerComposite2select == 4) { outputGL.blendMode(DARKEST); }
    else if (layerComposite2select == 5) { outputGL.blendMode(DIFFERENCE); }
    else if (layerComposite2select == 6) { outputGL.blendMode(EXCLUSION); }
    else if (layerComposite2select == 7) { outputGL.blendMode(MULTIPLY); }
    else if (layerComposite2select == 8) { outputGL.blendMode(SUBTRACT); }


    if (effectAnaglyph2) { // anaglyph
      outputGL.tint(255, 0, 0); // red
      outputGL.image(myMovie2, effectAnaglyphAmount2, 0, outputGLw, outputGLh); 
      outputGL.tint(0, 255, 255); // cyan
      outputGL.blendMode(ADD);
      outputGL.image(myMovie2, 0, 0, outputGLw, outputGLh);
      outputGL.blendMode(BLEND);
    } 
    else { // no anaglyph --- simple movie draw
      //outputGL.blendMode(BLEND);
      outputGL.tint(red(colorPicker2.getColorValue()), green(colorPicker2.getColorValue()), blue(colorPicker2.getColorValue()), layerOpacity2);

      // transforms layer 2
      posX = 0; posY = 0; whatWidth = outputWidth; whatHeight = outputHeight;
      if (posH2) { posX = int(outputWidth * posH2value); }
      if (posV2) { posY = int(outputHeight * posV2value); }
      if (sizeH2) { whatWidth = int(outputWidth * sizeH2value); }
      if (sizeV2) { whatHeight = int(outputHeight * sizeV2value); }
      if (rotX2) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateX(radians(rotX2value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY2) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateY(radians(rotY2value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ2) { outputGL.translate(outputWidth/2, outputHeight/2); outputGL.rotateZ(radians(rotZ2value)); outputGL.translate(-(outputWidth/2), -(outputHeight/2)); }
      
      // draw layer 2
      switch (layerContent2) {
        case 0: // movie
          outputGL.image(myMovie2, posX, posY, outputGLw, outputGLh);
          // icon movie
          if ((frameCount+2)%5==0 && previewType > 0) { iconLayer2.copy(myMovie2, 0, 0, myMovie2.width, myMovie2.height, 0, 0, 160, 120); }
          break;
        case 1:  // still image
          outputGL.image(myImage2, posX, posY, outputGLw, outputGLh);
          break;
        case 2: // camera
          outputGL.image(webcam, posX, posY, outputGLw, outputGLh);
          // icon webcam
          if ((frameCount+2)%5==0 && previewType > 0) { iconLayer2.copy(webcam, 0, 0, webcam.width, webcam.height, 0, 0, 160, 120); }
          break;
      } // end switch layerContent1
      outputGL.blendMode(BLEND); // resets blend

    } // end if anaglyph


} else {
  myMovie2.pause();
}// end if layer2visibility


//
// layer 3 draw
//

if (layer3visibility) {
  //outputGL.tint(red(colorPicker3.getColorValue()), green(colorPicker3.getColorValue()), blue(colorPicker3.getColorValue()), layerOpacity3);
    //tint(red(colorPicker1.getColorValue()), green(colorPicker1.getColorValue()), blue(colorPicker1.getColorValue()), fft.getAvg(FFTband1)*FFTbandScale1);

   // Shaders layer 3
  if (effectContrast3) {
    outputGL.shader(shaderContrast);
    shaderContrast.set("contrast", effectContrastLimit3);
  } else {
    outputGL.resetShader();
  }

    // openGL compositing layer 3
    if (layerComposite3select == 0) { outputGL.blendMode(BLEND); }
    else if (layerComposite3select == 1) { outputGL.blendMode(ADD); }
    else if (layerComposite3select == 2) { outputGL.blendMode(SCREEN); }
    else if (layerComposite3select == 3) { outputGL.blendMode(LIGHTEST); }
    else if (layerComposite3select == 4) { outputGL.blendMode(DARKEST); }
    else if (layerComposite3select == 5) { outputGL.blendMode(DIFFERENCE); }
    else if (layerComposite3select == 6) { outputGL.blendMode(EXCLUSION); }
    else if (layerComposite3select == 7) { outputGL.blendMode(MULTIPLY); }
    else if (layerComposite3select == 8) { outputGL.blendMode(SUBTRACT); }

    if (effectAnaglyph3) { // anaglyph
      outputGL.tint(255, 0, 0); // red
      outputGL.image(myMovie3, effectAnaglyphAmount3, 0, outputGLw, outputGLh);
      //QCdrawLayer(1, effectAnaglyphAmount1, 0, outputWidth, outputHeight);
      // gl.glDisable(GL.GL_DEPTH_TEST); 
      // gl.glEnable(GL.GL_BLEND); 
      // gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);   
      outputGL.tint(0, 255, 255); // cyan
      outputGL.blendMode(ADD);
      outputGL.image(myMovie3, 0, 0, outputGLw, outputGLh);
      outputGL.blendMode(BLEND);
      //QCdrawLayer(1, -(effectAnaglyphAmount1), 0, outputWidth, outputHeight);
    } 
    else { // no anaglyph --- simple movie draw
      //outputGL.blendMode(BLEND);
      outputGL.tint(red(colorPicker3.getColorValue()), green(colorPicker3.getColorValue()), blue(colorPicker3.getColorValue()), layerOpacity3);

      shaderContrast.set("contrast", map(effectContrastLimit3, 0, 200, 1, 3));
      shaderContrast.set("saturation", map(effectSaturationLimit3, 0, 256, 1, 3));

      // draw layer 3
      switch (layerContent3) {
        case 0: // movie
          outputGL.image(myMovie3, posX, posY, outputGLw, outputGLh);
          // icon movie
          if ((frameCount+3)%5==0 && previewType > 0) { iconLayer3.copy(myMovie2, 0, 0, myMovie3.width, myMovie3.height, 0, 0, 160, 120); }
          break;
        case 1: // still image
          outputGL.image(myImage3, posX, posY, outputGLw, outputGLh);
          break;
        case 2: // camera
          outputGL.image(webcam, posX, posY, outputGLw, outputGLh);
          // icon webcam
          if ((frameCount+3)%5==0 && previewType > 0) { iconLayer3.copy(webcam, 0, 0, webcam.width, webcam.height, 0, 0, 160, 120); }
          break;
      } // end switch layerContent1
      outputGL.blendMode(BLEND); // resets blend

    } // end if anaglyph

} else {
  myMovie3.pause();
}// end if layer3visibility


//
// layer 4 draw
//

if (layer4visibility) {
 // outputGL.tint(red(colorPicker4.getColorValue()), green(colorPicker4.getColorValue()), blue(colorPicker4.getColorValue()), layerOpacity4);
   
  // Shaders layer 4
  if (effectContrast4) {
    outputGL.shader(shaderContrast);
    shaderContrast.set("contrast", effectContrastLimit4);
  } else {
    outputGL.resetShader();
  }
      
    // openGL compositing layer 4
    if (layerComposite4select == 0) { outputGL.blendMode(BLEND); }
    else if (layerComposite4select == 1) { outputGL.blendMode(ADD); }
    else if (layerComposite4select == 2) { outputGL.blendMode(SCREEN); }
    else if (layerComposite4select == 3) { outputGL.blendMode(LIGHTEST); }
    else if (layerComposite4select == 4) { outputGL.blendMode(DARKEST); }
    else if (layerComposite4select == 5) { outputGL.blendMode(DIFFERENCE); }
    else if (layerComposite4select == 6) { outputGL.blendMode(EXCLUSION); }
    else if (layerComposite4select == 7) { outputGL.blendMode(MULTIPLY); }
    else if (layerComposite4select == 8) { outputGL.blendMode(SUBTRACT); }

      if (effectAnaglyph4) { // anaglyph
        outputGL.tint(255, 0, 0); // red
        outputGL.image(myMovie4, effectAnaglyphAmount4, 0, outputGLw, outputGLh);
        //QCdrawLayer(1, effectAnaglyphAmount1, 0, outputWidth, outputHeight);
        // gl.glDisable(GL.GL_DEPTH_TEST); 
        // gl.glEnable(GL.GL_BLEND); 
        // gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);   
        outputGL.tint(0, 255, 255); // cyan
        outputGL.blendMode(ADD);
        outputGL.image(myMovie4, 0, 0, outputGLw, outputGLh);
        outputGL.blendMode(BLEND);
        //QCdrawLayer(1, -(effectAnaglyphAmount1), 0, outputWidth, outputHeight);
      } 
      else { // no anaglyph --- simple movie draw
        //outputGL.blendMode(BLEND);
        outputGL.tint(red(colorPicker4.getColorValue()), green(colorPicker4.getColorValue()), blue(colorPicker4.getColorValue()), layerOpacity4);

        shaderContrast.set("contrast", map(effectContrastLimit4, 0, 200, 1, 3));
        shaderContrast.set("saturation", map(effectSaturationLimit4, 0, 256, 1, 3));

        // draw layer 4
        switch (layerContent4) {
          case 0: // movie
            outputGL.image(myMovie4, posX, posY, outputGLw, outputGLh);
            // icon movie
            if ((frameCount+4)%5==0 && previewType > 0) { iconLayer4.copy(myMovie4, 0, 0, myMovie4.width, myMovie4.height, 0, 0, 160, 120); }
            break; 
          case 1: // still image
            outputGL.image(myImage4, posX, posY, outputGLw, outputGLh);
            break;
          case 2: // camera
            outputGL.image(webcam, posX, posY, outputGLw, outputGLh);
            // icon webcam
            if ((frameCount+4)%5==0 && previewType > 0) { iconLayer4.copy(webcam, 0, 0, webcam.width, webcam.height, 0, 0, 160, 120); }
            break; 
         } // end switch layerContent1

        outputGL.blendMode(BLEND); // resets blend

      } // end if anaglyph

} else {
  myMovie4.pause();
}// end if layer4visibility




// mask draw
if (mappingMask) { // draw mapping mask
  outputGL.blendMode(DARKEST); // blend
  switch (mappingMaskIndex) {
  case 1:
    outputGL.image(mascara1, 0, 0, outputGLw, outputGLh);
    break;
  case 2:
    outputGL.image(mascara2, 0, 0, outputGLw, outputGLh);
    break;
  case 3:
    outputGL.image(mascara3, 0, 0, outputGLw, outputGLh);
    break;
  case 4:
    outputGL.image(mascara4, 0, 0, outputGLw, outputGLh);
    break;
  case 5:
    outputGL.image(mascara5, 0, 0, outputGLw, outputGLh);
    break;
  case 6:
    outputGL.image(mascara6, 0, 0, outputGLw, outputGLh);
    break;
  case 7:
    outputGL.image(mascara7, 0, 0, outputGLw, outputGLh);
    break;
  case 8:
    outputGL.image(mascara8, 0, 0, outputGLw, outputGLh);
    break;
  }//end switch
  outputGL.blendMode(BLEND); // resets blend
} // end if mask

        
// render fade
if (fade > 0.0) { 
  outputGL.fill(0, 0, 0, map(fade, 0.0, 100.0, 0, 255)); 
  outputGL.rect(0, 0, outputGLw, outputGLh); 
} 


outputGL.endDraw();

// draws openGL buffer
//surface.render(outputGL);
image(outputGL, 0, 0, outputWidth, outputHeight);

//if ( previewType > 1 && (frameCount+1)%3==0) { previewFullScreen.copy(outputGL, 0, 0, outputGLw, outputGLh, 0, 0, 320, 240); }
//if ( previewType > 1 ) { previewFullScreen.copy(outputGL, 0, 0, outputGLw, outputGLh, 0, 0, 160, 120); }
//if ( previewType > 1 && (frameCount+1)%3==0) { previewFullScreen.copy(outputGL, 0, 0, outputGLw, outputGLh, 0, 0, 160, 120); }
if ( previewType == 1 && (frameCount)%3==0) { previewSmall.copy(outputGL, 0, 0, outputGLw, outputGLh, 0, 0, 240, 180); }
else if ( previewType == 2 && (frameCount)%3==0) { previewFullScreen.copy(outputGL, 0, 0, outputGLw, outputGLh, 0, 0, 640, 480); }



// Syphon output
if (syphonOutput) { syphon.sendImage(outputGL); }

// needs to change resolution?
if (changeResolution != 100) { QCchangeResolution(); }

  


  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  update
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // needs to randomize movie?
  switch (doRandomize) {
  case 0: 
    QCrandomMov(0); doRandomize=100; 
    break;
  case 1: 
    QCrandomMov(1); doRandomize=100; 
    break;
  case 2: 
    QCrandomMov(2); doRandomize=100; 
    break;
  case 3: 
    QCrandomMov(3); doRandomize=100; 
    break;
  default: 
    break;
  } // end switch doRandomize
  
} // end draw

ControlFrame addControlFrame(String theName) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, 1280, 750);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(0, 0);
  f.setResizable(true);
  f.setVisible(true);
  return p;
}




