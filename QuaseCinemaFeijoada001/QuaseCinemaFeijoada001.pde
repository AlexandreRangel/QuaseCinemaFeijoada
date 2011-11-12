//
// Quase-Cinema Feijoada 0.01
// Alexandre Rangel
// www.quasecinema.org
//
// built with Processing 2.0 alpha 2
// 2011.11.12
//

import controlP5.*; // controlP5 library
import codeanticode.gsvideo.*; // GSvideo library

import javax.media.opengl.GL; // openGL library
import processing.opengl.*; // openGL library

import sojamo.drop.*; // sDrop library


// controlP5
ControlP5 controlP5;
ControlWindow controlWindow;
ControlWindowCanvas cc;

ColorPicker colorPicker1, colorPicker2, colorPicker3, colorPicker4;

ListBox outputResolutionList;

public int fpsValue = 0;

// movies
public GSMovie myMovie, myMovie2, myMovie3, myMovie4;

// directory
//public String[] fileNames;
//public String folderPath = " ";
//ListBox dirListBox;

String newMovie = "";
boolean change1 = false; boolean change2 = false; boolean change3 = false; boolean change4 = false;

SDrop drop;

// file filter
//java.io.FilenameFilter txtFilter = new java.io.FilenameFilter() {
//  boolean accept(File dir, String name) {
//    return name.toLowerCase().endsWith(".mov")
//    || name.toLowerCase().endsWith(".avi")
//    || name.toLowerCase().endsWith(".mp4")
//    || name.toLowerCase().endsWith(".ogg")
//    || name.toLowerCase().endsWith(".mpg");
//  }
//};

// variables
int selectedLayer = 1;
//int myColorBackground = color(0,0,0);
int interfaceWidth = 1024;
int columnWidth = int (interfaceWidth/4);

float fade = 0.0;

public int changeResolution = 100;
public int outputWidth = 1024; public int outputHeight = 768;

boolean  layer1visibility = true;
boolean  layer2visibility = false;
boolean  layer3visibility = false;
boolean  layer4visibility = false;

int layer1bpmVis, layer2bpmVis, layer3bpmVis, layer4bpmVis;

float layer1speed = 1.0; float layer2speed = 1.0; float layer3speed = 1.0; float layer4speed = 1.0;
//float layer1transparency = 255; float layer2transparency = 255; float layer3transparency = 255; float layer4transparency = 255;
public float layer1playback, layer2playback, layer3playback, layer4playback;

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
// interface canvas
//

class MyCanvas extends ControlWindowCanvas {
  public void draw(PApplet theApplet) {
    theApplet.fill(128);
    
    if (frameCount > 1) {
      theApplet.rect(8,22,164,124);
      theApplet.image(myMovie, 10, 24, 160, 120);
      theApplet.rect(8+(columnWidth*1),22,164,124);
      theApplet.image(myMovie2, 10+(columnWidth*1), 24, 160, 120);
      theApplet.rect(8+(columnWidth*2),22,164,124);
      theApplet.image(myMovie3, 10+(columnWidth*2), 24,160, 120);
      theApplet.rect(8+(columnWidth*3),22,164,124);
      theApplet.image(myMovie4, 10+(columnWidth*3), 24,160, 120);
    }
    

    
//    if(theApplet.mousePressed) {
//      theApplet.fill(255,0,0,155);
//      theApplet.ellipse(theApplet.mouseX,theApplet.mouseY,20,20);
//    }

  //dropArea1.draw();
    
  }
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

// select an input dir
//File[] listFiles(String dir) {
//  
//    File file = new File(dir);
//
//    if (file.isDirectory()) {
//	File[] files = file.listFiles();
//	return files;
//    } else {
//	// If it's not a directory
//	return null;
//    }
//}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


void setup() {
  size(1024,748, OPENGL);
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  frame.setResizable(true);
  frameRate(60);
  //frame.setLocation(screen.width,0);
  //frame.setLocation(1440,0);
  frame.setLocation(1024,0);
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  controlP5 setup
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("Quase-Cinema Feijoada VJ 0.01",0,0,1024,748); 
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(40));
  // for continuous update use ControlWindow.NORMAL  to update a control
  // window only when it is in focus, use ControlWindow.ECONOMIC is the default update value.
  //controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.setUpdateMode(ControlWindow.ECONOMIC);
    
  cc = new MyCanvas(); // create a control window canvas
  cc.pre(); // use cc.post(); to draw on top of the controllers.
  controlWindow.addCanvas(cc);
  
  // tabs
  controlWindow.tab("default").setLabel(" Main ");
  controlWindow.addTab("Effects"); controlWindow.tab("Effects").setLabel(" Effects ");
  controlWindow.addTab("Rhythm"); controlWindow.tab("Rhythm").setLabel(" Rhythm ");
  controlWindow.addTab("Sequencer"); controlWindow.tab("Sequencer").setLabel(" Sequencer ");
  controlWindow.addTab("Mapping"); controlWindow.tab("Mapping").setLabel(" Mapping ");
  controlWindow.addTab("3D"); controlWindow.tab("3D").setLabel(" 3D ");
  controlWindow.addTab("Playlist"); controlWindow.tab("Playlist").setLabel(" Playlist ");
  controlWindow.addTab("Prefs"); controlWindow.tab("Prefs").setLabel(" Prefs ");
  
//  controlP5.trigger();
//  
//  controlP5.tab("default").activateEvent(true);
//  controlP5.tab("default").setLabel("main");
//  controlP5.tab("default").setId(1);
//  //controlP5.tab("default").setWindow(controlWindow);
//  
//  controlP5.tab("effects").activateEvent(true);
//  controlP5.tab("effects").setId(2);
  
  // interface global
  controlP5.Controller faderSlider = controlP5.addSlider("fade",0,100,0,(columnWidth*3),733,int(columnWidth*0.88),10);
  faderSlider.setLabel("fade"); faderSlider.moveTo(controlWindow,"global");
  
  controlP5.Controller myFPS = controlP5.addSlider("fpsValue",0,60,0,(columnWidth*2),733,int(columnWidth*0.88),10);
  myFPS.moveTo(controlWindow,"global"); myFPS.captionLabel().set("fps");
  
  //
  // interface
  // main tab
  //
  
  // interface main - directory
  controlP5.ListBox dirListBox = controlP5.addListBox("dirList",10,screenHeight/2,columnWidth,screenHeight/2);
  dirListBox.setLabel("dirs"); dirListBox.moveTo(controlWindow);
  dirListBox.setItemHeight(15); dirListBox.setBarHeight(15);
  dirListBox.captionLabel().style().marginTop = 3;
//  for(int i=0;i<fileNames.length;i++) { //
//    dirListBox.addItem(fileNames[i],i);
//  }
  
  // interface main - column 1
  controlP5.Controller visibilityToggle1 = controlP5.addToggle("layer1visibility",true,180+(columnWidth*0),20,20,20);
  visibilityToggle1.setLabel("visible"); visibilityToggle1.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider1 = controlP5.addSlider("layer1playback",0,1.0,0.0,10+(columnWidth*0),200,int(columnWidth*0.7),14);
  playbackSlider1.setLabel("playback"); playbackSlider1.moveTo(controlWindow);
  
  controlP5.Controller mySlider = controlP5.addSlider("layer1speed",0,5.0,1.0,10+(columnWidth*0),220,int(columnWidth*0.7),14);
  mySlider.setLabel("speed"); mySlider.moveTo(controlWindow);
  
  // interface main - column 2
  controlP5.Controller visibilityToggle2 = controlP5.addToggle("layer2visibility",false,180+(columnWidth*1),20,20,20);
  visibilityToggle2.setLabel("visible"); visibilityToggle2.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider2 = controlP5.addSlider("layer2playback",0,1.0,0.0,10+(columnWidth*1),200,int(columnWidth*0.7),14);
  playbackSlider2.setLabel("playback"); playbackSlider2.moveTo(controlWindow);
  
  controlP5.Controller speedSlider2 = controlP5.addSlider("layer2speed",0,5.0,1.0,10+(columnWidth*1),220,int(columnWidth*0.7),14);
  speedSlider2.setLabel("speed"); speedSlider2.moveTo(controlWindow);
  
  
  // interface main - column 3
  controlP5.Controller visibilityToggle3 = controlP5.addToggle("layer3visibility",false,180+(columnWidth*2),20,20,20);
  visibilityToggle3.setLabel("visible"); visibilityToggle3.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider3 = controlP5.addSlider("layer3playback",0,1.0,0.0,10+(columnWidth*2),200,int(columnWidth*0.7),14);
  playbackSlider3.setLabel("playback"); playbackSlider3.moveTo(controlWindow);
  
  controlP5.Controller speedSlider3 = controlP5.addSlider("layer3speed",0,5.0,1.0,10+(columnWidth*2),220,int(columnWidth*0.7),14);
  speedSlider3.setLabel("speed"); speedSlider3.moveTo(controlWindow);
  
  
  // interface main - column 4
  controlP5.Controller visibilityToggle4 = controlP5.addToggle("layer4visibility",false,180+(columnWidth*3),20,20,20);
  visibilityToggle4.setLabel("visible"); visibilityToggle4.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider4 = controlP5.addSlider("layer4playback",0,1.0,0.0,10+(columnWidth*3),200,int(columnWidth*0.7),14);
  playbackSlider4.setLabel("playback"); playbackSlider4.moveTo(controlWindow);
  
  controlP5.Controller speedSlider4 = controlP5.addSlider("layer4speed",0,5.0,1.0,10+(columnWidth*3),220,int(columnWidth*0.7),14);
  speedSlider4.setLabel("speed"); speedSlider4.moveTo(controlWindow);
  
  //
  // interface
  // effects tab
  //
  
  // interface effects - column 1
  colorPicker1 = controlP5.addColorPicker("layer1color",10+(columnWidth*0),200,int(columnWidth*0.9),20);
  colorPicker1.moveTo(controlWindow,"Effects");
  
  // interface effects - column 2
  colorPicker2 = controlP5.addColorPicker("layer2color",10+(columnWidth*1),200,int(columnWidth*0.9),20);
  colorPicker2.moveTo(controlWindow,"Effects");
  
  // interface effects - column 3
  colorPicker3 = controlP5.addColorPicker("layer3color",10+(columnWidth*2),200,int(columnWidth*0.9),20);
  colorPicker3.moveTo(controlWindow,"Effects");
  
  // interface effects - column 4
  colorPicker4 = controlP5.addColorPicker("layer4color",10+(columnWidth*3),200,int(columnWidth*0.9),20);
  colorPicker4.moveTo(controlWindow,"Effects");
  
  //
  // interface
  // bpm tab
  //
  
  // interface bpm - column 1
  controlP5.Controller bpmVisSlider1 = controlP5.addSlider("layer1bpmVis",0,240,120,10+(columnWidth*0),220,int(columnWidth*0.7),14);
  bpmVisSlider1.setLabel("bpm vis"); bpmVisSlider1.moveTo(controlWindow,"Rhythm");
  
  // interface bpm - column 2  
  controlP5.Controller bpmVisSlider2 = controlP5.addSlider("layer2bpmVis",0,240,120,10+(columnWidth*1),220,int(columnWidth*0.7),14);
  bpmVisSlider2.setLabel("bpm vis"); bpmVisSlider2.moveTo(controlWindow,"Rhythm");
  
  
  // interface bpm - column 3
  controlP5.Controller bpmVisSlider3 = controlP5.addSlider("layer3bpmVis",0,240,120,10+(columnWidth*2),220,int(columnWidth*0.7),14);
  bpmVisSlider3.setLabel("bpm vis"); bpmVisSlider3.moveTo(controlWindow,"Rhythm");
  
  
  // interface bpm - column 4
  controlP5.Controller bpmVisSlider4 = controlP5.addSlider("layer4bpmVis",0,240,120,10+(columnWidth*3),220,int(columnWidth*0.7),14);
  bpmVisSlider4.setLabel("bpm vis"); bpmVisSlider4.moveTo(controlWindow,"Rhythm");
  
  
  //
  // interface
  // sequencer tab
  //
  
  controlP5.Controller sequencerSlider1 = controlP5.addMatrix("layer1sequencer", 8, 4, 20, 240, 400, 300);
  sequencerSlider1.setLabel("sequencer"); sequencerSlider1.moveTo(controlWindow,"Sequencer");
  
  
  //
  // interface
  // prefs tab
  //
  
  outputResolutionList = controlP5.addListBox("outputResolution",10,200,int(columnWidth*0.9),180);
  outputResolutionList.setLabel("output resolution");
  outputResolutionList.moveTo(controlWindow,"Prefs");
  
  outputResolutionList.addItem("240 x 180",0);
  outputResolutionList.addItem("320 x 240",1);
  outputResolutionList.addItem("640 x 480",2);
  outputResolutionList.addItem("800 x 600",3);
  outputResolutionList.addItem("1024 x 768",4);
  outputResolutionList.addItem("1280 x 720",5);
  outputResolutionList.addItem("1920 x 1080",6);
  outputResolutionList.addItem("1600 x 1200",7);
  outputResolutionList.addItem("1280 x 480, dual 640 x 480)",8);
  outputResolutionList.addItem("1600 x 600, dual 800 x 600)",9);
  outputResolutionList.addItem("2048 x 768, dual 1024 x 768)",10);
  outputResolutionList.addItem("1920 x 480, triple 640 x 480)",11);
  outputResolutionList.addItem("2400 x 600, triple 800 x 600)",12);
  outputResolutionList.addItem("3072 x 768, triple 1024 x 768)",13);
  
  
  // GStreamer setup
  
  GSVideo.localGStreamerPath = "/Users/rangel/Documents/processing/libraries/GSVideo/library/gstreamer/macosx32";
  
  myMovie = new GSMovie(this, "Aviao.mov");
  myMovie.loop();
  
  myMovie2 = new GSMovie(this, sketchPath("data/Palatnik1.mov"));
  myMovie2.loop();
  
  myMovie3 = new GSMovie(this, sketchPath("data/Palatnik2.mov"));
  myMovie3.loop();
  
  myMovie4 = new GSMovie(this, sketchPath("data/Palatnik3.mov"));
  myMovie4.loop();
  
  drop = new SDrop(controlWindow.component(),this);
  
} // end setup

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

public void movieEvent(GSMovie myMovie) {
  myMovie.read();
}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

// update resolution

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
  }
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


public void draw() {
  
  // update
  
  // dirs
  
  if (change1 == true && selectedLayer == 1) {
   myMovie = new GSMovie(this, newMovie);
   //myMovie.read();
   myMovie.play();
   myMovie.loop();
   change1 = false; 
  }


//  if (change1 == true && selectedLayer == 2) {
//   myMovie2 = new GSMovie(this, newMovie); myMovie2.read(); myMovie2.loop();
//   change1 = false; 
//  }
//  if (change1 == true && selectedLayer == 3) {
//   myMovie3 = new GSMovie(this, newMovie); myMovie3.read(); myMovie3.loop();
//   change1 = false; 
//  }
//  if (change1 == true && selectedLayer == 4) {
//   myMovie4 = new GSMovie(this, newMovie); myMovie4.read(); myMovie4.loop();
//   change1 = false; 
//  }
  
  
  
  background(0);
  
  
  //
  // interface update
  //
  if (random(100)>50){ controlP5.controller("fpsValue").setValue(int(frameRate)); }

  // playback heads
  controlP5.controller("layer1playback").setValue(map(myMovie.time(),0.0,myMovie.duration(),0.0,1.0));
  controlP5.controller("layer2playback").setValue(map(myMovie2.time(),0.0,myMovie2.duration(),0.0,1.0));
  controlP5.controller("layer3playback").setValue(map(myMovie3.time(),0.0,myMovie3.duration(),0.0,1.0));
  controlP5.controller("layer4playback").setValue(map(myMovie4.time(),0.0,myMovie4.duration(),0.0,1.0));

  
  
  //controlP5.draw();
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  output
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // pre-render layer 1
  if (layer1visibility) {
    //tint(red(colorPicker1.getColorValue()), green(colorPicker1.getColorValue()), blue(colorPicker1.getColorValue()));
    tint(colorPicker1.getColorValue());
    myMovie.play();
    myMovie.speed(layer1speed);
    
    //myMovie.filter(INVERT);
    //myMovie.filter(POSTERIZE,4);
    //myMovie.filter(BLUR,2);
    //myMovie.filter(DILATE);
    
    image(myMovie, 0, 0, outputWidth, outputHeight); 
  } else {
     myMovie.pause();
  }// end if layer1visibility
  
 
 
  // pre-render layer 2
  if (layer2visibility) {
    tint(colorPicker2.getColorValue());
    myMovie2.play();
    myMovie2.speed(layer2speed);
    image(myMovie2, 0, 0, outputWidth, outputHeight);
  } else {
     myMovie2.pause();
  }// end if layer2visibility
  
  
  // pre-render layer 3
  if (layer3visibility) {
    tint(colorPicker3.getColorValue());
    myMovie3.play();
    myMovie3.speed(layer3speed);
    image(myMovie3, 0, 0, outputWidth, outputHeight);
  } else {
     myMovie3.pause();
  }// end if layer3visibility
  
  // pre-render layer 4
  if (layer4visibility) {
    tint(colorPicker4.getColorValue());
    myMovie4.play();
    myMovie4.speed(layer4speed);
    image(myMovie4, 0, 0, outputWidth, outputHeight);
  } else {
     myMovie4.pause();
  }// end if layer4visibility
  
  
  
  // render fade
  if (fade > 0.0) {
    fill(0,0,0,map(fade,0.0,100.0,0,255));
    rect(0,0,screenWidth,screenHeight);
  } 
  
  if (changeResolution != 100) { QCchangeResolution(); }
  
} // end draw




// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


//int mX;
//int mY;

void mousePressed(){
  //mX = mouseX;
  //mY = mouseY;
}

void mouseDragged(){
  //frame.setLocation(MouseInfo.getPointerInfo().getLocation().x-mX, MouseInfo.getPointerInfo().getLocation().y-mY);
}

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------

void keyPressed(){
 
  switch(key) {
     case '1':
       selectedLayer = 1;
       break; 
     case '2':
       selectedLayer = 2;
       break;
     case '3':
       selectedLayer = 3;
       break;
     case '4':
       selectedLayer = 4;
       break;
     
  case 'd': 
//    String folderPath = selectFolder();
//    if (folderPath == null) {
//      println("No folder was selected..."); // if no folder was selected
//    } 
//    else {
//      println(folderPath);
//      fileNames = listFileNames(folderPath, txtFilter);
//      println(fileNames);
//      //for(int i=0;i<fileNames.length;i++) { 
//        //
//      //}
//      //dirListBox.addItem(fileNames[0],0);
//    }
break; // break 'd'
    
  case 'u':
    //myMovie2.stop(); myMovie2.delete();
    myMovie = new GSMovie(this, "Palatnik2.mov");
    myMovie.read(); myMovie.play();
    //file = File.getParentFile();
    //myMovie.loadMovie
    
    break; // break 'd'
    
  case 'r': //xxx
//    String tempString = selectFolder() + fileNames[int(random(fileNames.length))]; 
//    myMovie = new GSMovie(this, tempString);
//    myMovie.loop();
    break; // break 'r'
  } // end switch 
}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------


//// This function returns all the files in a directory as an array of Strings  
//String[] listFileNames(String dir,java.io.FilenameFilter extension) {
//  File file = new File(dir);
//  if (file.isDirectory()) {
//    String names[] = file.list(extension);
//    return names;
//  } else {
//    // If it's not a directory
//    return null;
//  }
//}


// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------



  void dropEvent(DropEvent theDropEvent) {
    if(theDropEvent.isFile()) {
      File myFile = theDropEvent.file();
      if(myFile.isFile()) {
        println("toString()\t"+theDropEvent.toString());
        newMovie = theDropEvent.toString();
        change1 = true;
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



