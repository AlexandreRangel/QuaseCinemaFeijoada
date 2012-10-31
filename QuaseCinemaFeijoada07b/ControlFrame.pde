public class ControlFrame extends PApplet {

ControlP5 cp5;

Object parent;

Movie[] movieForIcons1 = new Movie[18];
Movie[] movieForIcons2 = new Movie[18];
Movie[] movieForIcons3 = new Movie[18];
Movie[] movieForIcons4 = new Movie[18];

int w, h;

private ControlFrame() {
}

ControlFrame(Object theParent, int theWidth, int theHeight) {
  parent = theParent; w = theWidth; h = theHeight;
}

public ControlP5 control() { return cp5; }


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface setup
//
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() {

size(w, h); frameRate(30);
cp5 = new ControlP5(this);
cp5.setControlFont(new ControlFont(createFont("Arial",12, true), 12));
//cp5.addSlider("abc").plugTo(parent, "def").setRange(0, 255);


////////////////////////////////////////
//  interface setup
////////////////////////////////////////

cp5.tab("default").setLabel("  Quase-Cinema Feijoada Remix  ").setId(1);
cp5.tab("default").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Effects").setLabel("  effects  ").setId(2);
cp5.tab("Effects").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Rhythm").setLabel("  rhythm  ").setId(3);
cp5.tab("Rhythm").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Transform").setLabel("  transform  ").setId(4);
cp5.tab("Transform").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Sequencer").setLabel("  sequencer  ").setId(5);
cp5.tab("Sequencer").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Mapping").setLabel("  mapping  ").setId(6);
cp5.tab("Mapping").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("3D").setLabel("  3d  ").setId(7);
cp5.tab("3D").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Playlist").setLabel("  playlist  ").setId(8);
cp5.tab("Playlist").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Audio").setLabel("  audio  ").setId(9);
cp5.tab("Audio").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Preferences").setLabel("  preferences  ").setId(10);
cp5.tab("Preferences").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);
cp5.addTab("Help").setLabel("  help  ").setId(11);
cp5.tab("Help").captionLabel().toUpperCase(false).setHeight(23).setWidth(80);


////////////////////////////////////////
//  interface global setup (all tabs)
////////////////////////////////////////

//plugTo(this, "fpsValue")
controlP5.Controller myFPS = cp5.addSlider("myFPS")
.setRange(0, 60).setPosition(1030, 642).setSize(int(columnWidth*0.9), 14);
myFPS.moveTo(this, "global"); myFPS.setLabel("fps"); myFPS.captionLabel().toUpperCase(false);
myFPS.captionLabel().style().marginTop = -14; myFPS.captionLabel().style().marginLeft = -(int(columnWidth*0.9));
myFPS.setDecimalPrecision(0);

controlP5.Controller faderSlider = cp5.addSlider("fade").plugTo(parent, "fade")
.setRange(0, 100).setPosition(1030, 680).setSize(int(columnWidth*0.9), 14);
faderSlider.moveTo(this, "global"); faderSlider.captionLabel().toUpperCase(false);
faderSlider.captionLabel().style().marginTop = -14; faderSlider.captionLabel().style().marginLeft = -(int(columnWidth*0.9));
faderSlider.setDecimalPrecision(0);


////////////////////////////////////////
//  drop setup
////////////////////////////////////////

drop = new SDrop(this);


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  main tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// interface main - column 1

// layer 1 visibility
controlP5.Controller p5visibilityToggle1 = cf.control().addToggle("visibilityToggle1", true, 180+(columnWidth*0), 24, 18, 18);
p5visibilityToggle1.plugTo(parent, "layer1visibility");
p5visibilityToggle1.setLabel("visible"); p5visibilityToggle1.captionLabel().toUpperCase(false);
p5visibilityToggle1.moveTo("global");

// layer 1 content
layerContentButton1 = cf.control().addRadioButton("layerContent1",180+(columnWidth*0),109);
layerContentButton1.setNoneSelectedAllowed(false); layerContentButton1.setItemsPerRow(1);
layerContentButton1.addItem("movie1",0); layerContentButton1.activate(0);
layerContentButton1.addItem("image1",1);
layerContentButton1.addItem("camera1",2);
layerContentButton1.moveTo("global");
layerContentButton1.setSpacingRow(5); layerContentButton1.toUpperCase(false);


controlP5.Controller loopToggle1 = cf.control().addToggle("layer1loop",true,10+(columnWidth*0),160,15,15);
loopToggle1.setLabel("loop"); loopToggle1.moveTo("default");
loopToggle1.captionLabel().toUpperCase(false);
loopToggle1.captionLabel().style().marginTop = -16; loopToggle1.captionLabel().style().marginLeft = 18;


// layer 1 playback head
controlP5.Controller p5layer1playback = cf.control().addSlider("layer1playback").setRange(0.0,1.0).setValue(0.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*0), 200);
p5layer1playback.setLabel("playback"); p5layer1playback.captionLabel().toUpperCase(false);
p5layer1playback.captionLabel().style().marginTop = -14; p5layer1playback.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// layer 1 speed
controlP5.Controller p5layer1speed = cf.control().addSlider("layer1speed").setRange(0.0,4.0).setValue(1.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*0), 230);
p5layer1speed.setLabel("speed"); p5layer1speed.captionLabel().toUpperCase(false);
p5layer1speed.captionLabel().style().marginTop = -14; p5layer1speed.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// random movie layer 1
controlP5.Controller randomDir1 = cf.control().addButton("randomDir1",0,10+(columnWidth*0),250,85,16);
randomDir1.setLabel("random dir"); randomDir1.moveTo("default");
randomDir1.captionLabel().toUpperCase(false);
randomDir1.captionLabel().style().marginTop = -1;

// random directory layer 1
controlP5.Controller randomMov1 = cf.control().addButton("randomMov1",0,110+(columnWidth*0),250,85,16);
randomMov1.setLabel("random mov"); randomMov1.moveTo("default");
randomMov1.captionLabel().toUpperCase(false);
randomMov1.captionLabel().style().marginTop = -1;


//
// interface main - column 2
//

// layer 2 visibility
controlP5.Controller p5visibilityToggle2 = cf.control().addToggle("visibilityToggle2").plugTo(parent, "layer2visibility").setValue(false).setSize(18, 18).setPosition(180+(columnWidth*1), 24);
p5visibilityToggle2.setLabel("visible"); 
p5visibilityToggle2.captionLabel().toUpperCase(false); 
p5visibilityToggle2.moveTo("global");

//  layer 2 content
layerContentButton2 = cf.control().addRadioButton("layerContent2",180+(columnWidth*1),109);
layerContentButton2.setNoneSelectedAllowed(false); layerContentButton2.setItemsPerRow(1);
layerContentButton2.addItem("movie2",0); layerContentButton2.activate(0);
layerContentButton2.addItem("image2",1);
layerContentButton2.addItem("camera2",2);
layerContentButton2.moveTo("global");
layerContentButton2.setSpacingRow(5); layerContentButton2.toUpperCase(false);

controlP5.Controller loopToggle2 = cf.control().addToggle("layer2loop",true,10+(columnWidth*1),160,15,15);
loopToggle2.setLabel("loop"); loopToggle2.moveTo("default");
loopToggle2.captionLabel().toUpperCase(false);
loopToggle2.captionLabel().style().marginTop = -16; loopToggle2.captionLabel().style().marginLeft = 18;


// playback head layer 2
controlP5.Controller p5layer2playback = cf.control().addSlider("layer2playback").setRange(0.0,1.0).setValue(0.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*1), 200);
p5layer2playback.setLabel("playback"); p5layer2playback.captionLabel().toUpperCase(false);
p5layer2playback.captionLabel().style().marginTop = -14; p5layer2playback.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// speed layer 2
controlP5.Controller p5layer2speed = cf.control().addSlider("layer2speed").setRange(0.0,4.0).setValue(1.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*1), 230);
p5layer2speed.setLabel("speed"); p5layer2speed.captionLabel().toUpperCase(false);
p5layer2speed.captionLabel().style().marginTop = -14; p5layer2speed.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

 // random movie layer 2
 controlP5.Controller randomDir2 = cf.control().addButton("randomDir2",0,10+(columnWidth*1),250,85,16);
 randomDir2.setLabel("random dir"); randomDir2.moveTo("default");
 randomDir2.captionLabel().toUpperCase(false);
 randomDir2.captionLabel().style().marginTop = -1;
 
 // random directory layer 2
 controlP5.Controller randomMov2 = cf.control().addButton("randomMov2",0,115+(columnWidth*1),250,85,16);
 randomMov2.setLabel("random mov"); randomMov2.moveTo("default");
 randomMov2.captionLabel().toUpperCase(false);
 randomMov2.captionLabel().style().marginTop = -1;
 


//
// interface main - column 3
//

// visibility layer 3
controlP5.Controller p5visibilityToggle3 = cf.control().addToggle("visibilityToggle3").plugTo(parent, "layer3visibility").setValue(false).setSize(18, 18).setPosition(180+(columnWidth*2), 24);
p5visibilityToggle3.setLabel("visible"); p5visibilityToggle3.captionLabel().toUpperCase(false); 
p5visibilityToggle3.moveTo("global");

//  content layer 3
layerContentButton3 = cf.control().addRadioButton("layerContent3",180+(columnWidth*2),109);
layerContentButton3.setNoneSelectedAllowed(false); layerContentButton3.setItemsPerRow(1);
layerContentButton3.addItem("movie3",0); layerContentButton3.activate(0);
layerContentButton3.addItem("image3",1);
layerContentButton3.addItem("camera3",2);
layerContentButton3.moveTo("global");
layerContentButton3.setSpacingRow(5); layerContentButton3.toUpperCase(false);

 
controlP5.Controller loopToggle3 = cf.control().addToggle("layer3loop",true,10+(columnWidth*2),160,15,15);
loopToggle3.setLabel("loop"); loopToggle3.moveTo("default");
loopToggle3.captionLabel().toUpperCase(false);
loopToggle3.captionLabel().style().marginTop = -16; loopToggle3.captionLabel().style().marginLeft = 18;
 

// playback head layer 3
controlP5.Controller p5layer3playback = cf.control().addSlider("layer3playback").setRange(0.0,1.0).setValue(0.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*2), 200);
p5layer3playback.setLabel("playback"); p5layer3playback.captionLabel().toUpperCase(false); 
p5layer3playback.captionLabel().style().marginTop = -14; p5layer3playback.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// speed layer 3
controlP5.Controller p5layer3speed = cf.control().addSlider("layer3speed").setRange(0.0,4.0).setValue(1.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*2), 230);
p5layer3speed.setLabel("speed"); p5layer3speed.captionLabel().toUpperCase(false);
p5layer3speed.captionLabel().style().marginTop = -14; p5layer3speed.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// random movie layer 3
controlP5.Controller randomDir3 = cf.control().addButton("randomDir3",0,10+(columnWidth*2),250,85,16);
randomDir3.setLabel("random dir"); randomDir3.moveTo("default");
randomDir3.captionLabel().toUpperCase(false);
randomDir3.captionLabel().style().marginTop = -1;

controlP5.Controller randomMov3 = cf.control().addButton("randomMov3",0,115+(columnWidth*2),250,85,16);
randomMov3.setLabel("random mov"); randomMov3.moveTo("default");
randomMov3.captionLabel().toUpperCase(false);
randomMov3.captionLabel().style().marginTop = -1;



//
// interface main - column 4
//

// visibility layer 4
controlP5.Controller p5visibilityToggle4 = cf.control().addToggle("visibilityToggle4").plugTo(parent, "layer4visibility").setValue(false).setSize(18, 18).setPosition(180+(columnWidth*3), 24);
p5visibilityToggle4.setLabel("visible"); p5visibilityToggle4.captionLabel().toUpperCase(false); 
p5visibilityToggle4.moveTo("global");


// content layer 4
layerContentButton4 = cf.control().addRadioButton("layerContent4",180+(columnWidth*3),109);
layerContentButton4.setNoneSelectedAllowed(false); layerContentButton4.setItemsPerRow(1);
layerContentButton4.addItem("movie4",0); layerContentButton4.activate(0);
layerContentButton4.addItem("image4",1);
layerContentButton4.addItem("camera4",2);
layerContentButton4.moveTo("global");
layerContentButton4.setSpacingRow(5); layerContentButton4.toUpperCase(false);

controlP5.Controller loopToggle4 = cf.control().addToggle("layer4loop",true,10+(columnWidth*3),160,15,15);
loopToggle4.setLabel("loop"); loopToggle4.moveTo("default");
loopToggle4.captionLabel().toUpperCase(false);
loopToggle4.captionLabel().style().marginTop = -16; loopToggle4.captionLabel().style().marginLeft = 18;


// playback head layer 4
controlP5.Controller p5layer4playback = cf.control().addSlider("layer4playback").setRange(0.0,1.0).setValue(0.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*3), 200);
p5layer4playback.setLabel("playback"); p5layer4playback.captionLabel().toUpperCase(false); 
p5layer4playback.captionLabel().style().marginTop = -14; p5layer4playback.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// speed layer 4
controlP5.Controller p5layer4speed = cf.control().addSlider("layer4speed").setRange(0.0,4.0).setValue(1.0).setSize(int(columnWidth*0.7), 14).setPosition(10+(columnWidth*3), 230);
p5layer4speed.setLabel("speed"); p5layer4speed.captionLabel().toUpperCase(false);
p5layer4speed.captionLabel().style().marginTop = -14; p5layer4speed.captionLabel().style().marginLeft = -(int(columnWidth*0.7));

// random movie layer 4
controlP5.Controller randomDir4 = cf.control().addButton("randomDir4",0,10+(columnWidth*3),250,85,14);
randomDir4.setLabel("random dir"); randomDir4.moveTo("default");
randomDir4.captionLabel().toUpperCase(false);
randomDir4.captionLabel().style().marginTop = -1;

// random directory layer 4
controlP5.Controller randomMov4 = cf.control().addButton("randomMov4",0,115+(columnWidth*3),250,85,14);
randomMov4.setLabel("random mov"); randomMov4.moveTo("default");
randomMov4.captionLabel().toUpperCase(false);
randomMov4.captionLabel().style().marginTop = -1;




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  effects tab
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface effects - column 1
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// color picker layer 1  
colorPicker1 = cf.control().addColorPicker("colorPicker1").setPosition(10+(columnWidth*0), 190);
//colorPicker1.valueLabel.setWidth(int(columnWidth*0.9));
colorPicker1.setWidth(int(columnWidth*0.9));
colorPicker1.moveTo("Effects");

controlP5.Controller invertToggle1 = cf.control().addToggle("effectInvert1",false,10+(columnWidth*0),270,18,18);
invertToggle1.setLabel("invert"); invertToggle1.moveTo("Effects"); invertToggle1.plugTo(parent,"effectInvert1");
invertToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller posterizeToggle1 = cf.control().addToggle("effectPosterize1",false,50+(columnWidth*0),270,18,18);
posterizeToggle1.setLabel("poster"); posterizeToggle1.moveTo("Effects"); posterizeToggle1.plugTo(parent,"effectPosterize1");
posterizeToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller effectRgToggle1 = cf.control().addToggle("effectRG1",false,10+(columnWidth*0),315,18,18);
effectRgToggle1.setLabel("R-G"); effectRgToggle1.moveTo("Effects");
effectRgToggle1.captionLabel().style().marginTop = -38;

controlP5.Controller effectRbToggle1 = cf.control().addToggle("effectRB1",false,50+(columnWidth*0),315,18,18);
effectRbToggle1.setLabel("R-B"); effectRbToggle1.moveTo("Effects");
effectRbToggle1.captionLabel().style().marginTop = -38;

controlP5.Controller effectGbToggle1 = cf.control().addToggle("effectBG1",false,90+(columnWidth*0),315,18,18);
effectGbToggle1.setLabel("G-B"); effectGbToggle1.moveTo("Effects");
effectGbToggle1.captionLabel().style().marginTop = -38;

// BW
controlP5.Controller effectBWToggle1 = cf.control().addToggle("effectBW1",false,10+(columnWidth*0),360,18,18);
effectBWToggle1.setLabel("BW"); effectBWToggle1.moveTo("Effects");
effectBWToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;
// BW amount
controlP5.Controller effectBWlimit1slider = cf.control().addSlider("effectBWlimit1",0,255,127,40+(columnWidth*0),360,int(columnWidth*0.7),16);
effectBWlimit1slider.setLabel(""); effectBWlimit1slider.moveTo("Effects");
effectBWlimit1slider.valueLabel().style().marginTop = -1;
// BW audio control
controlP5.Controller effectBWaudioToggle1 = cf.control().addToggle("effectBWaudio1",false,int(columnWidth*0.885)+(columnWidth*0),360,18,18);
effectBWaudioToggle1.setLabel("audio"); effectBWaudioToggle1.moveTo("Effects");
effectBWaudioToggle1.captionLabel().toUpperCase(false).style().marginLeft = -13;
effectBWaudioToggle1.captionLabel().style().marginTop = -38;

// contrast layer 1
controlP5.Controller effectContrastToggle1 = cf.control().addToggle("effectContrast1",false,10+(columnWidth*0),405,18,18);
effectContrastToggle1.plugTo(parent,"effectContrast1");
effectContrastToggle1.setLabel("contrast"); effectContrastToggle1.moveTo("Effects");
effectContrastToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;
// contrast amount
controlP5.Controller effectContrastLimit1slider = cf.control().addSlider("effectContrastLimit1",1.0,4.0,0,40+(columnWidth*0),405,int(columnWidth*0.7),16);
effectContrastLimit1slider.plugTo(parent,"effectContrastLimit1");
effectContrastLimit1slider.setLabel(""); effectContrastLimit1slider.moveTo("Effects");
effectContrastLimit1slider.valueLabel().style().marginTop = -1;
// contrast audio control
controlP5.Controller effectContrastAudioToggle1 = cf.control().addToggle("effectContrastAudio1",false,int(columnWidth*0.885)+(columnWidth*0),405,18,18);
effectContrastAudioToggle1.setLabel("audio"); effectContrastAudioToggle1.moveTo("Effects");
effectContrastAudioToggle1.captionLabel().toUpperCase(false);
effectContrastAudioToggle1.captionLabel().style().marginLeft = -13;
effectContrastAudioToggle1.captionLabel().style().marginTop = -38;

// saturation layer 1
controlP5.Controller effectSaturationToggle1 = cf.control().addToggle("effectSaturation1",false,10+(columnWidth*0),450,18,18);
effectSaturationToggle1.plugTo(parent,"effectSaturation1");
effectSaturationToggle1.setLabel("saturation"); effectSaturationToggle1.moveTo("Effects");
effectSaturationToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;
// saturation amount
controlP5.Controller effectSaturationLimit1slider = cf.control().addSlider("effectSaturationLimit1",0.0,3.0,0,40+(columnWidth*0),450,int(columnWidth*0.7),13);
effectSaturationLimit1slider.plugTo(parent,"effectSaturation1");
effectSaturationLimit1slider.setLabel(""); effectSaturationLimit1slider.moveTo("Effects");
effectSaturationLimit1slider.valueLabel().style().marginTop = -1;
// saturation audio control
controlP5.Controller effectSaturationAudioToggle1 = cf.control().addToggle("effectSaturationAudio1",false,int(columnWidth*0.885)+(columnWidth*0),450,18,18);
effectSaturationAudioToggle1.setLabel("audio"); effectSaturationAudioToggle1.moveTo("Effects");
effectSaturationAudioToggle1.captionLabel().toUpperCase(false);
effectSaturationAudioToggle1.captionLabel().style().marginLeft = -13;
effectSaturationAudioToggle1.captionLabel().style().marginTop = -38;

// hue layer 1
controlP5.Controller effectHueToggle1 = cf.control().addToggle("effectHue1",false,10+(columnWidth*0),495,18,18);
effectHueToggle1.plugTo(parent,"effectHue1");
effectHueToggle1.setLabel("hue"); effectHueToggle1.moveTo("Effects");
effectHueToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;
// hue amount
controlP5.Controller effectHueLimit1slider = cf.control().addSlider("effectHueLimit1",0,256,0,40+(columnWidth*0),495,int(columnWidth*0.7),13);
effectHueLimit1slider.setLabel(""); effectHueLimit1slider.moveTo("Effects");
effectHueLimit1slider.valueLabel().style().marginTop = -1;
// hue audio control
controlP5.Controller effectHueAudioToggle1 = cf.control().addToggle("effectHueAudio1",false,int(columnWidth*0.885)+(columnWidth*0),495,18,18);
effectHueAudioToggle1.setLabel("audio"); effectHueAudioToggle1.moveTo("Effects");
effectHueAudioToggle1.captionLabel().toUpperCase(false);
effectHueAudioToggle1.captionLabel().style().marginLeft = -13;
effectHueAudioToggle1.captionLabel().style().marginTop = -38;

// anaglyph layer 1
controlP5.Controller effectAnaglyphToggle1 = cf.control().addToggle("effectAnaglyph1",false,10+(columnWidth*0),540,18,18);
effectAnaglyphToggle1.plugTo(parent,"effectAnaglyph1");
effectAnaglyphToggle1.setLabel("anaglyph"); effectAnaglyphToggle1.moveTo("Effects");
effectAnaglyphToggle1.captionLabel().toUpperCase(false).style().marginTop = -38;
// anaglyth amount
controlP5.Controller effectAnaglyphAmount1slider = cf.control().addSlider("effectAnaglyphAmount1",-64,64,0,40+(columnWidth*0),540,int(columnWidth*0.7),13);
effectAnaglyphAmount1slider.plugTo(parent,"effectAnaglyphAmount1");
effectAnaglyphAmount1slider.setLabel(""); effectAnaglyphAmount1slider.moveTo("Effects");
effectAnaglyphAmount1slider.valueLabel().style().marginTop = -1;
// anaglyth audio control
controlP5.Controller effectAnaglyphAudioToggle1 = cf.control().addToggle("effectAnaglyphAudio1",false,int(columnWidth*0.885)+(columnWidth*0),540,18,18);
effectAnaglyphAudioToggle1.setLabel("audio"); effectAnaglyphAudioToggle1.moveTo("Effects");
effectAnaglyphAudioToggle1.captionLabel().toUpperCase(false);
effectAnaglyphAudioToggle1.captionLabel().style().marginLeft = -13;
effectAnaglyphAudioToggle1.captionLabel().style().marginTop = -38;


//  // luminance key
//  controlP5.Controller effectLumaKeyToggle1 = cf.control().addToggle("effectLumaKey1",false,10+(columnWidth*0),555,18,18);
//  effectLumaKeyToggle1.setLabel("luma key"); effectLumaKeyToggle1.moveTo("Effects");
//  effectLumaKeyToggle1.captionLabel().toUpperCase(false);
//  controlP5.Controller effectLumaKeyAmount1slider = cf.control().addSlider("effectLumaKeyAmount1",0,255,127,40+(columnWidth*0),555,int(columnWidth*0.7),13);
//  effectLumaKeyAmount1slider.moveTo("Effects");
//  effectLumaKeyAmount1slider.setLabel("");
//  effectLumaKeyAmount1slider.valueLabel().style().marginTop = -1;
//
//  
//  controlP5.Controller paintToggle1 = cf.control().addToggle("effectPaint1",false,10+(columnWidth*0),615,18,18);
//  paintToggle1.setLabel("light paint"); paintToggle1.moveTo("Effects");
//  paintToggle1.captionLabel().toUpperCase(false);
//  controlP5.Controller paint1slider = cf.control().addSlider("paintAmount1",0,256,0,40+(columnWidth*0),615,int(columnWidth*0.7),13);
//  paint1slider.moveTo("Effects");
//  paint1slider.setLabel("");
//  paint1slider.valueLabel().style().marginTop = -1;
// 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface effects - column 2
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// color picker layer 2 
colorPicker2 = cf.control().addColorPicker("layer2color").setSize(int(columnWidth*0.85), 14).setPosition(10+(columnWidth*1), 190);
colorPicker2.moveTo("Effects");

controlP5.Controller invertToggle2 = cf.control().addToggle("effectInvert2",false,10+(columnWidth*1),270,18,18);
invertToggle2.setLabel("invert"); invertToggle2.moveTo("Effects");  invertToggle2.plugTo(parent,"effectInvert2");
invertToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller posterizeToggle2 = cf.control().addToggle("effectPosterize2",false,50+(columnWidth*1),270,18,18);
posterizeToggle2.setLabel("poster"); posterizeToggle2.moveTo("Effects"); posterizeToggle2.plugTo(parent,"effectPosterize2");
posterizeToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller paintToggle2 = cf.control().addToggle("effectPaint2",false,90+(columnWidth*1),270,18,18);
paintToggle2.setLabel("light paint"); paintToggle2.moveTo("Effects");
paintToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller effectRgToggle2 = cf.control().addToggle("effectRG2",false,10+(columnWidth*1),315,18,18);
effectRgToggle2.setLabel("R-G"); effectRgToggle2.moveTo("Effects");
effectRgToggle2.captionLabel().style().marginTop = -38;

controlP5.Controller effectRbToggle2 = cf.control().addToggle("effectRB2",false,50+(columnWidth*1),315,18,18);
effectRbToggle2.setLabel("R-B"); effectRbToggle2.moveTo("Effects");
effectRbToggle2.captionLabel().style().marginTop = -38;

controlP5.Controller effectGbToggle2 = cf.control().addToggle("effectBG2",false,90+(columnWidth*1),315,18,18);
effectGbToggle2.setLabel("G-B"); effectGbToggle2.moveTo("Effects");
effectGbToggle2.captionLabel().style().marginTop = -38;

// BW layer 2
controlP5.Controller effectBWToggle2 = cf.control().addToggle("effectBW2",false,10+(columnWidth*1),355,18,18);
effectBWToggle2.setLabel("BW"); effectBWToggle2.moveTo("Effects");
effectBWToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;
// BW amount
controlP5.Controller effectBWlimit2slider = cf.control().addSlider("effectBWlimit2",0,255,127,40+(columnWidth*1),355,int(columnWidth*0.7),16);
effectBWlimit2slider.setLabel(""); effectBWlimit2slider.moveTo("Effects");
effectBWlimit2slider.valueLabel().style().marginTop = -1;
// BW audio control
controlP5.Controller effectBWaudioToggle2 = cf.control().addToggle("effectBWaudio2",false,int(columnWidth*0.885)+(columnWidth*1),355,18,18);
effectBWaudioToggle2.setLabel("audio"); effectBWaudioToggle2.moveTo("Effects");
effectBWaudioToggle2.captionLabel().toUpperCase(false);
effectBWaudioToggle2.captionLabel().style().marginLeft = -13;
effectBWaudioToggle2.captionLabel().style().marginTop = -38;

// contrast layer 2
controlP5.Controller effectContrastToggle2 = cf.control().addToggle("effectContrast2",false,10+(columnWidth*1),395,18,18);
effectContrastToggle2.plugTo(parent,"effectContrast2");
effectContrastToggle2.setLabel("contrast"); effectContrastToggle2.moveTo("Effects");
effectContrastToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;
// contrast amount
controlP5.Controller effectContrastLimit2slider = cf.control().addSlider("effectContrastLimit2",0,200,0,40+(columnWidth*1),395,int(columnWidth*0.7),16);
effectContrastLimit2slider.plugTo(parent,"effectContrastLimit2");
effectContrastLimit2slider.setLabel(""); effectContrastLimit2slider.moveTo("Effects");
effectContrastLimit2slider.valueLabel().style().marginTop = -1;
// contrast audio control
controlP5.Controller effectContrastAudioToggle2 = cf.control().addToggle("effectContrastAudio2",false,int(columnWidth*0.885)+(columnWidth*1),395,18,18);
effectContrastAudioToggle2.setLabel("audio"); effectContrastAudioToggle2.moveTo("Effects");
effectContrastAudioToggle2.captionLabel().toUpperCase(false);
effectContrastAudioToggle2.captionLabel().style().marginLeft = -13;
effectContrastAudioToggle2.captionLabel().style().marginTop = -38;

// saturation layer 2
controlP5.Controller effectSaturationToggle2 = cf.control().addToggle("effectSaturation2",false,10+(columnWidth*1),435,18,18);
effectContrastToggle2.plugTo(parent,"effectSaturation2");
effectSaturationToggle2.setLabel("saturation"); effectSaturationToggle2.moveTo("Effects");
effectSaturationToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;
// saturation amount
controlP5.Controller effectSaturationLimit2slider = cf.control().addSlider("effectSaturationLimit2",0,256,0,40+(columnWidth*1),435,int(columnWidth*0.7),13);
effectSaturationLimit2slider.plugTo(parent,"effectSaturation2");
effectSaturationLimit2slider.setLabel(""); effectSaturationLimit2slider.moveTo("Effects");
effectSaturationLimit2slider.valueLabel().style().marginTop = -1;
// saturation audio control
controlP5.Controller effectSaturationAudioToggle2 = cf.control().addToggle("effectSaturationAudio2",false,int(columnWidth*0.885)+(columnWidth*1),435,18,18);
effectSaturationAudioToggle2.setLabel("audio"); effectSaturationAudioToggle2.moveTo("Effects");
effectSaturationAudioToggle2.captionLabel().toUpperCase(false);
effectSaturationAudioToggle2.captionLabel().style().marginLeft = -13;
effectSaturationAudioToggle2.captionLabel().style().marginTop = -38;

// hue layer 2
controlP5.Controller effectHueToggle2 = cf.control().addToggle("effectHue2",false,10+(columnWidth*1),475,18,18);
effectContrastToggle2.plugTo(parent,"effectHue2");
effectHueToggle2.setLabel("hue"); effectHueToggle2.moveTo("Effects");
effectHueToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;;
// hue amount
controlP5.Controller effectHueLimit2slider = cf.control().addSlider("effectHueLimit2",0,256,0,40+(columnWidth*1),475,int(columnWidth*0.7),13);
effectHueLimit2slider.setLabel(""); effectHueLimit2slider.moveTo("Effects");
effectHueLimit2slider.valueLabel().style().marginTop = -1;
// hue audio control
controlP5.Controller effectHueAudioToggle2 = cf.control().addToggle("effectHueAudio2",false,int(columnWidth*0.885)+(columnWidth*1),475,18,18);
effectHueAudioToggle2.setLabel("audio"); effectHueAudioToggle2.moveTo("Effects");
effectHueAudioToggle2.captionLabel().toUpperCase(false);
effectHueAudioToggle2.captionLabel().style().marginLeft = -13;
effectHueAudioToggle2.captionLabel().style().marginTop = -38;

// anaglyph layer 2
controlP5.Controller effectAnaglyphToggle2 = cf.control().addToggle("effectAnaglyph2",false,10+(columnWidth*1),515,18,18);
effectAnaglyphToggle2.plugTo(parent,"effectAnaglyph2");
effectAnaglyphToggle2.setLabel("anaglyph"); effectAnaglyphToggle2.moveTo("Effects");
effectAnaglyphToggle2.captionLabel().toUpperCase(false).style().marginTop = -38;
// anaglyth amount
controlP5.Controller effectAnaglyphAmount2slider = cf.control().addSlider("effectAnaglyphAmount2",-64,64,0,40+(columnWidth*1),515,int(columnWidth*0.7),13);
effectAnaglyphAmount2slider.plugTo(parent,"effectAnaglyphAmount2");
effectAnaglyphAmount2slider.setLabel(""); effectAnaglyphAmount2slider.moveTo("Effects");
effectAnaglyphAmount2slider.valueLabel().style().marginTop = -1;
// anaglyth audio control
controlP5.Controller effectAnaglyphAudioToggle2 = cf.control().addToggle("effectAnaglyphAudio2",false,int(columnWidth*0.885)+(columnWidth*1),515,18,18);
effectAnaglyphAudioToggle2.setLabel("audio"); effectAnaglyphAudioToggle2.moveTo("Effects");
effectAnaglyphAudioToggle2.captionLabel().toUpperCase(false);
effectAnaglyphAudioToggle2.captionLabel().style().marginLeft = -13;
effectAnaglyphAudioToggle2.captionLabel().style().marginTop = -38;


//  // luminance key
//  controlP5.Controller effectLumaKeyToggle2 = cf.control().addToggle("effectLumaKey2",false,10+(columnWidth*1),555,18,18);
//  effectLumaKeyToggle2.setLabel("luma key"); effectLumaKeyToggle2.moveTo("Effects");
//  effectLumaKeyToggle2.captionLabel().toUpperCase(false);
//  controlP5.Controller effectLumaKeyAmount2slider = cf.control().addSlider("effectLumaKeyAmount2",0,255,127,40+(columnWidth*1),555,int(columnWidth*0.7),13);
//  effectLumaKeyAmount2slider.moveTo("Effects");
//  effectLumaKeyAmount2slider.setLabel("");
//  effectLumaKeyAmount2slider.valueLabel().style().marginTop = -1;
//  

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface effects - column 3
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// color picker layer 3  
colorPicker3 = cf.control().addColorPicker("layer3color").setSize(int(columnWidth*0.85), 14).setPosition(10+(columnWidth*2), 190);
colorPicker3.moveTo("Effects");

controlP5.Controller invertToggle3 = cf.control().addToggle("effectInvert3",false,10+(columnWidth*2),270,18,18);
invertToggle3.setLabel("invert"); invertToggle3.moveTo("Effects"); invertToggle3.plugTo(parent,"effectInvert3");
invertToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller posterizeToggle3 = cf.control().addToggle("effectPosterize3",false,50+(columnWidth*2),270,18,18);
posterizeToggle3.setLabel("poster"); posterizeToggle3.moveTo("Effects"); posterizeToggle3.plugTo(parent,"effectPosterize3");
posterizeToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller paintToggle3 = cf.control().addToggle("effectPaint3",false,90+(columnWidth*2),270,18,18);
paintToggle3.setLabel("light paint"); paintToggle3.moveTo("Effects");
paintToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller effectRgToggle3 = cf.control().addToggle("effectRG3",false,10+(columnWidth*2),315,18,18);
effectRgToggle3.setLabel("R-G"); effectRgToggle3.moveTo("Effects");
effectRgToggle3.captionLabel().style().marginTop = -38;

controlP5.Controller effectRbToggle3 = cf.control().addToggle("effectRB3",false,50+(columnWidth*2),315,18,18);
effectRbToggle3.setLabel("R-B"); effectRbToggle3.moveTo("Effects");
effectRbToggle3.captionLabel().style().marginTop = -38;

controlP5.Controller effectGbToggle3 = cf.control().addToggle("effectBG3",false,90+(columnWidth*2),315,18,18);
effectGbToggle3.setLabel("G-B"); effectGbToggle3.moveTo("Effects");
effectGbToggle3.captionLabel().style().marginTop = -38;

// BW layer 3
controlP5.Controller effectBWToggle3 = cf.control().addToggle("effectBW3",false,10+(columnWidth*2),355,18,18);
effectBWToggle3.setLabel("BW"); effectBWToggle3.moveTo("Effects");
effectBWToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;
// BW amount
controlP5.Controller effectBWlimit3slider = cf.control().addSlider("effectBWlimit3",0,255,127,40+(columnWidth*2),355,int(columnWidth*0.7),16);
effectBWlimit3slider.setLabel(""); effectBWlimit3slider.moveTo("Effects");
effectBWlimit3slider.valueLabel().style().marginTop = -1;
// BW audio control
controlP5.Controller effectBWaudioToggle3 = cf.control().addToggle("effectBWaudio3",false,int(columnWidth*0.885)+(columnWidth*2),355,18,18);
effectBWaudioToggle3.setLabel("audio"); effectBWaudioToggle3.moveTo("Effects");
effectBWaudioToggle3.captionLabel().toUpperCase(false);
effectBWaudioToggle3.captionLabel().style().marginLeft = -13;
effectBWaudioToggle3.captionLabel().style().marginTop = -38;

// contrast layer 3
controlP5.Controller effectContrastToggle3 = cf.control().addToggle("effectContrast3",false,10+(columnWidth*2),395,18,18);
effectContrastToggle3.plugTo(parent,"effectContrast3");
effectContrastToggle3.setLabel("contrast"); effectContrastToggle3.moveTo("Effects");
effectContrastToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;
// contrast amount
controlP5.Controller effectContrastLimit3slider = cf.control().addSlider("effectContrastLimit3",0,200,0,40+(columnWidth*2),395,int(columnWidth*0.7),16);
effectContrastLimit3slider.plugTo(parent,"effectContrastLimit3");
effectContrastLimit3slider.setLabel(""); effectContrastLimit3slider.moveTo("Effects");
effectContrastLimit3slider.valueLabel().style().marginTop = -1;
// contrast audio control
controlP5.Controller effectContrastAudioToggle3 = cf.control().addToggle("effectContrastAudio3",false,int(columnWidth*0.885)+(columnWidth*2),395,18,18);
effectContrastAudioToggle3.setLabel("audio"); effectContrastAudioToggle3.moveTo("Effects");
effectContrastAudioToggle3.captionLabel().toUpperCase(false);
effectContrastAudioToggle3.captionLabel().style().marginLeft = -13;
effectContrastAudioToggle3.captionLabel().style().marginTop = -38;

// saturation layer 3
controlP5.Controller effectSaturationToggle3 = cf.control().addToggle("effectSaturation3",false,10+(columnWidth*2),435,18,18);
effectContrastToggle3.plugTo(parent,"effectSaturation3");
effectSaturationToggle3.setLabel("saturation"); effectSaturationToggle3.moveTo("Effects");
effectSaturationToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;
// saturation amount
controlP5.Controller effectSaturationLimit3slider = cf.control().addSlider("effectSaturationLimit3",0,256,0,40+(columnWidth*2),435,int(columnWidth*0.7),13);
effectSaturationLimit3slider.plugTo(parent,"effectSaturation3");
effectSaturationLimit3slider.setLabel(""); effectSaturationLimit3slider.moveTo("Effects");
effectSaturationLimit3slider.valueLabel().style().marginTop = -1;
// saturation audio control
controlP5.Controller effectSaturationAudioToggle3 = cf.control().addToggle("effectSaturationAudio3",false,int(columnWidth*0.885)+(columnWidth*2),435,18,18);
effectSaturationAudioToggle3.setLabel("audio"); effectSaturationAudioToggle3.moveTo("Effects");
effectSaturationAudioToggle3.captionLabel().toUpperCase(false);
effectSaturationAudioToggle3.captionLabel().style().marginLeft = -13;
effectSaturationAudioToggle3.captionLabel().style().marginTop = -38;

// hue layer 3
controlP5.Controller effectHueToggle3 = cf.control().addToggle("effectHue3",false,10+(columnWidth*2),475,18,18);
effectContrastToggle3.plugTo(parent,"effectHue3");
effectHueToggle3.setLabel("hue"); effectHueToggle3.moveTo("Effects");
effectHueToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;
// hue amount
controlP5.Controller effectHueLimit3slider = cf.control().addSlider("effectHueLimit3",0,256,0,40+(columnWidth*2),475,int(columnWidth*0.7),13);
effectHueLimit3slider.setLabel(""); effectHueLimit3slider.moveTo("Effects");
effectHueLimit3slider.valueLabel().style().marginTop = -1;
// hue audio control
controlP5.Controller effectHueAudioToggle3 = cf.control().addToggle("effectHueAudio3",false,int(columnWidth*0.885)+(columnWidth*2),475,18,18);
effectHueAudioToggle3.setLabel("audio"); effectHueAudioToggle3.moveTo("Effects");
effectHueAudioToggle3.captionLabel().toUpperCase(false);
effectHueAudioToggle3.captionLabel().style().marginLeft = -13;
effectHueAudioToggle3.captionLabel().style().marginTop = -38;

// anaglyph layer 3
controlP5.Controller effectAnaglyphToggle3 = cf.control().addToggle("effectAnaglyph3",false,10+(columnWidth*2),515,18,18);
effectAnaglyphToggle3.plugTo(parent,"effectAnaglyph3");
effectAnaglyphToggle3.setLabel("anaglyph"); effectAnaglyphToggle3.moveTo("Effects");
effectAnaglyphToggle3.captionLabel().toUpperCase(false).style().marginTop = -38;
// anaglyth amount
controlP5.Controller effectAnaglyphAmount3slider = cf.control().addSlider("effectAnaglyphAmount3",-64,64,0,40+(columnWidth*2),515,int(columnWidth*0.7),13);
effectAnaglyphAmount3slider.plugTo(parent,"effectAnaglyphAmount3");
effectAnaglyphAmount3slider.setLabel(""); effectAnaglyphAmount3slider.moveTo("Effects");
effectAnaglyphAmount3slider.valueLabel().style().marginTop = -1;
// anaglyth audio control
controlP5.Controller effectAnaglyphAudioToggle3 = cf.control().addToggle("effectAnaglyphAudio3",false,int(columnWidth*0.885)+(columnWidth*2),515,18,18);
effectAnaglyphAudioToggle3.setLabel("audio"); effectAnaglyphAudioToggle3.moveTo("Effects");
effectAnaglyphAudioToggle3.captionLabel().toUpperCase(false);
effectAnaglyphAudioToggle3.captionLabel().style().marginLeft = -13;
effectAnaglyphAudioToggle3.captionLabel().style().marginTop = -38;
 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface effects - column 4
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// color picker layer 4 
colorPicker4 = cf.control().addColorPicker("layer4color").setSize(int(columnWidth*0.8), 14).setPosition(10+(columnWidth*3), 190);
colorPicker4.moveTo("Effects");

controlP5.Controller invertToggle4 = cf.control().addToggle("effectInvert4",false,10+(columnWidth*3),270,18,18);
invertToggle4.setLabel("invert"); invertToggle4.moveTo("Effects"); invertToggle4.plugTo(parent,"effectInvert4");
invertToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller posterizeToggle4 = cf.control().addToggle("effectPosterize4",false,50+(columnWidth*3),270,18,18);
posterizeToggle4.setLabel("poster"); posterizeToggle4.moveTo("Effects"); posterizeToggle4.plugTo(parent,"effectPosterize4");
posterizeToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller paintToggle4 = cf.control().addToggle("effectPaint4",false,90+(columnWidth*3),270,18,18);
paintToggle4.setLabel("light paint"); paintToggle4.moveTo("Effects");
paintToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;

controlP5.Controller effectRgToggle4 = cf.control().addToggle("effectRG4",false,10+(columnWidth*3),315,18,18);
effectRgToggle4.setLabel("R-G"); effectRgToggle4.moveTo("Effects");
effectRgToggle4.captionLabel().style().marginTop = -38;

controlP5.Controller effectRbToggle4 = cf.control().addToggle("effectRB4",false,50+(columnWidth*3),315,18,18);
effectRbToggle4.setLabel("R-B"); effectRbToggle4.moveTo("Effects");
effectRbToggle4.captionLabel().style().marginTop = -38;

controlP5.Controller effectGbToggle4 = cf.control().addToggle("effectBG4",false,90+(columnWidth*3),315,18,18);
effectGbToggle4.setLabel("G-B"); effectGbToggle4.moveTo("Effects");
effectGbToggle4.captionLabel().style().marginTop = -38;

// BW layer 4
controlP5.Controller effectBWToggle4 = cf.control().addToggle("effectBW4",false,10+(columnWidth*3),355,18,18);
effectBWToggle4.setLabel("BW"); effectBWToggle4.moveTo("Effects");
effectBWToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;
// BW amount
controlP5.Controller effectBWlimit4slider = cf.control().addSlider("effectBWlimit4",0,255,127,40+(columnWidth*3),355,int(columnWidth*0.7),16);
effectBWlimit4slider.setLabel(""); effectBWlimit4slider.moveTo("Effects");
effectBWlimit4slider.valueLabel().style().marginTop = -1;
// BW audio control
controlP5.Controller effectBWaudioToggle4 = cf.control().addToggle("effectBWaudio4",false,int(columnWidth*0.885)+(columnWidth*3),355,18,18);
effectBWaudioToggle4.setLabel("audio"); effectBWaudioToggle4.moveTo("Effects");
effectBWaudioToggle4.captionLabel().toUpperCase(false);
effectBWaudioToggle4.captionLabel().style().marginLeft = -13;
effectBWaudioToggle4.captionLabel().style().marginTop = -38;

// contrast layer 4
controlP5.Controller effectContrastToggle4 = cf.control().addToggle("effectContrast4",false,10+(columnWidth*3),395,18,18);
effectContrastToggle4.plugTo(parent,"effectContrast4");
effectContrastToggle4.setLabel("contrast"); effectContrastToggle4.moveTo("Effects");
effectContrastToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;
// contrast amount
controlP5.Controller effectContrastLimit4slider = cf.control().addSlider("effectContrastLimit4",0,200,0,40+(columnWidth*3),395,int(columnWidth*0.7),16);
effectContrastLimit4slider.plugTo(parent,"effectContrastLimit4");
effectContrastLimit4slider.setLabel(""); effectContrastLimit4slider.moveTo("Effects");
effectContrastLimit4slider.valueLabel().style().marginTop = -1;
// contrast audio control
controlP5.Controller effectContrastAudioToggle4 = cf.control().addToggle("effectContrastAudio4",false,int(columnWidth*0.885)+(columnWidth*3),395,18,18);
effectContrastAudioToggle4.setLabel("audio"); effectContrastAudioToggle4.moveTo("Effects");
effectContrastAudioToggle4.captionLabel().toUpperCase(false);
effectContrastAudioToggle4.captionLabel().style().marginLeft = -13;
effectContrastAudioToggle4.captionLabel().style().marginTop = -38;

// saturation layer 4
controlP5.Controller effectSaturationToggle4 = cf.control().addToggle("effectSaturation4",false,10+(columnWidth*3),435,18,18);
effectContrastToggle4.plugTo(parent,"effectSaturation4");
effectSaturationToggle4.setLabel("saturation"); effectSaturationToggle4.moveTo("Effects");
effectSaturationToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;
// saturation amount
controlP5.Controller effectSaturationLimit4slider = cf.control().addSlider("effectSaturationLimit4",0,256,0,40+(columnWidth*3),435,int(columnWidth*0.7),13);
effectSaturationLimit4slider.plugTo(parent,"effectSaturation4");
effectSaturationLimit4slider.setLabel(""); effectSaturationLimit4slider.moveTo("Effects");
effectSaturationLimit4slider.valueLabel().style().marginTop = -1;
// saturation audio control
controlP5.Controller effectSaturationAudioToggle4 = cf.control().addToggle("effectSaturationAudio4",false,int(columnWidth*0.885)+(columnWidth*3),435,18,18);
effectSaturationAudioToggle4.setLabel("audio"); effectSaturationAudioToggle4.moveTo("Effects");
effectSaturationAudioToggle4.captionLabel().toUpperCase(false);
effectSaturationAudioToggle4.captionLabel().style().marginLeft = -13;
effectSaturationAudioToggle4.captionLabel().style().marginTop = -38;

// hue layer 4
controlP5.Controller effectHueToggle4 = cf.control().addToggle("effectHue4",false,10+(columnWidth*3),475,18,18);
effectContrastToggle4.plugTo(parent,"effectHue4");
effectHueToggle4.setLabel("hue"); effectHueToggle4.moveTo("Effects");
effectHueToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;;
// hue amount
controlP5.Controller effectHueLimit4slider = cf.control().addSlider("effectHueLimit4",0,256,0,40+(columnWidth*3),475,int(columnWidth*0.7),13);
effectHueLimit4slider.setLabel(""); effectHueLimit4slider.moveTo("Effects");
effectHueLimit4slider.valueLabel().style().marginTop = -1;
// hue audio control
controlP5.Controller effectHueAudioToggle4 = cf.control().addToggle("effectHueAudio4",false,int(columnWidth*0.885)+(columnWidth*3),475,18,18);
effectHueAudioToggle4.setLabel("audio"); effectHueAudioToggle4.moveTo("Effects");
effectHueAudioToggle4.captionLabel().toUpperCase(false);
effectHueAudioToggle4.captionLabel().style().marginLeft = -13;
effectHueAudioToggle4.captionLabel().style().marginTop = -38;

// anaglyph layer 4
controlP5.Controller effectAnaglyphToggle4 = cf.control().addToggle("effectAnaglyph4",false,10+(columnWidth*3),515,18,18);
effectAnaglyphToggle4.plugTo(parent,"effectAnaglyph4");
effectAnaglyphToggle4.setLabel("anaglyph"); effectAnaglyphToggle4.moveTo("Effects");
effectAnaglyphToggle4.captionLabel().toUpperCase(false).style().marginTop = -38;
// anaglyth amount
controlP5.Controller effectAnaglyphAmount4slider = cf.control().addSlider("effectAnaglyphAmount4",-64,64,0,40+(columnWidth*3),515,int(columnWidth*0.7),13);
effectAnaglyphAmount4slider.plugTo(parent,"effectAnaglyphAmount4");
effectAnaglyphAmount4slider.setLabel(""); effectAnaglyphAmount4slider.moveTo("Effects");
effectAnaglyphAmount4slider.valueLabel().style().marginTop = -1;
// anaglyth audio control
controlP5.Controller effectAnaglyphAudioToggle4 = cf.control().addToggle("effectAnaglyphAudio4",false,int(columnWidth*0.885)+(columnWidth*3),515,18,18);
effectAnaglyphAudioToggle4.setLabel("audio"); effectAnaglyphAudioToggle4.moveTo("Effects");
effectAnaglyphAudioToggle4.captionLabel().toUpperCase(false);
effectAnaglyphAudioToggle4.captionLabel().style().marginLeft = -13;
effectAnaglyphAudioToggle4.captionLabel().style().marginTop = -38;

  //  
  //  // luminance key
  //  controlP5.Controller effectLumaKeyToggle4 = cf.control().addToggle("effectLumaKey4",false,10+(columnWidth*3),555,18,18);
  //  effectLumaKeyToggle4.setLabel("luma key"); effectLumaKeyToggle4.moveTo("Effects");
  //  effectLumaKeyToggle4.captionLabel().toUpperCase(false);
  //  controlP5.Controller effectLumaKeyAmount4slider = cf.control().addSlider("effectLumaKeyAmount4",0,255,127,40+(columnWidth*3),555,int(columnWidth*0.7),13);
  //  effectLumaKeyAmount4slider.moveTo("Effects");
  //  effectLumaKeyAmount4slider.setLabel("");
  //  effectLumaKeyAmount4slider.valueLabel().style().marginTop = -1;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////  interface
////  transform tab
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// interface transform - column 1
//

// pos H
// toggle
controlP5.Controller posH1toggle = cf.control().addToggle("posH1",false,10+(columnWidth*0),235,18,18);
posH1toggle.plugTo(parent,"posH1");
posH1toggle.setLabel("horizontal position"); posH1toggle.moveTo("Transform");
posH1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posH1valueSlider = cf.control().addSlider("posH1value",-1.0,1.0,0.0,40+(columnWidth*0),235,int(columnWidth*0.7),12);
posH1valueSlider.plugTo(parent,"posH1value");
posH1valueSlider.setLabel(""); posH1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posH1audioToggle = cf.control().addToggle("posH1audio",false,int(columnWidth*0.885)+(columnWidth*0),235,18,18);
posH1audioToggle.plugTo(parent,"posH1audio");
posH1audioToggle.setLabel("audio"); posH1audioToggle.moveTo("Transform");
posH1audioToggle.captionLabel().toUpperCase(false);
posH1audioToggle.captionLabel().style().marginLeft = -13;
posH1audioToggle.captionLabel().style().marginTop = -38;

// pos V
// toggle
controlP5.Controller posV1toggle = cf.control().addToggle("posV1",false,10+(columnWidth*0),275,18,18);
posV1toggle.plugTo(parent,"posV1");
posV1toggle.setLabel("vertical position"); posV1toggle.moveTo("Transform");
posV1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posV1valueSlider = cf.control().addSlider("posV1value",-1.0,1.0,0.0,40+(columnWidth*0),275,int(columnWidth*0.7),12);
posV1valueSlider.plugTo(parent,"posV1value");
posV1valueSlider.setLabel(""); posV1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posV1audioToggle = cf.control().addToggle("posV1audio",false,int(columnWidth*0.885)+(columnWidth*0),275,18,18);
posV1audioToggle.plugTo(parent,"posV1audio");
posV1audioToggle.setLabel("audio"); posV1audioToggle.moveTo("Transform");
posV1audioToggle.captionLabel().toUpperCase(false);
posV1audioToggle.captionLabel().style().marginLeft = -13;
posV1audioToggle.captionLabel().style().marginTop = -38;

// size H
// toggle
controlP5.Controller sizeH1toggle = cf.control().addToggle("sizeH1",false,10+(columnWidth*0),315,18,18);
sizeH1toggle.plugTo(parent,"sizeH1");
sizeH1toggle.setLabel("horizontal size"); sizeH1toggle.moveTo("Transform");
sizeH1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeH1valueSlider = cf.control().addSlider("sizeH1value",-1.0,1.0,0.0,40+(columnWidth*0),315,int(columnWidth*0.7),12);
sizeH1valueSlider.plugTo(parent,"sizeH1value");
sizeH1valueSlider.setLabel(""); sizeH1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeH1audioToggle = cf.control().addToggle("sizeH1audio",false,int(columnWidth*0.885)+(columnWidth*0),315,18,18);
sizeH1audioToggle.plugTo(parent,"sizeH1audio");
sizeH1audioToggle.setLabel("audio"); sizeH1audioToggle.moveTo("Transform");
sizeH1audioToggle.captionLabel().toUpperCase(false);
sizeH1audioToggle.captionLabel().style().marginLeft = -13;
sizeH1audioToggle.captionLabel().style().marginTop = -38;

// size V
// toggle
controlP5.Controller sizeV1toggle = cf.control().addToggle("sizeV1",false,10+(columnWidth*0),355,18,18);
sizeV1toggle.plugTo(parent,"sizeV1");
sizeV1toggle.setLabel("vertical size"); sizeV1toggle.moveTo("Transform");
sizeV1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeV1valueSlider = cf.control().addSlider("sizeV1value",-1.0,1.0,0.0,40+(columnWidth*0),355,int(columnWidth*0.7),12);
sizeV1valueSlider.plugTo(parent,"sizeV1value");
sizeV1valueSlider.setLabel(""); sizeV1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeV1audioToggle = cf.control().addToggle("sizeV1audio",false,int(columnWidth*0.885)+(columnWidth*0),355,18,18);
sizeV1audioToggle.plugTo(parent,"sizeV1audio");
sizeV1audioToggle.setLabel("audio"); sizeV1audioToggle.moveTo("Transform");
sizeV1audioToggle.captionLabel().toUpperCase(false);
sizeV1audioToggle.captionLabel().style().marginLeft = -13;
sizeV1audioToggle.captionLabel().style().marginTop = -38;

// rot X
// toggle
controlP5.Controller rotX1toggle = cf.control().addToggle("rotX1",false,10+(columnWidth*0),395,18,18);
rotX1toggle.plugTo(parent,"rotX1");
rotX1toggle.setLabel("X rotation"); rotX1toggle.moveTo("Transform");
rotX1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotX1valueSlider = cf.control().addSlider("rotX1value",-180,180,0,40+(columnWidth*0),395,int(columnWidth*0.7),12);
rotX1valueSlider.plugTo(parent,"rotX1value");
rotX1valueSlider.setLabel(""); rotX1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotX1audioToggle = cf.control().addToggle("rotX1audio",false,int(columnWidth*0.885)+(columnWidth*0),395,18,18);
rotX1audioToggle.plugTo(parent,"rotX1audio");
rotX1audioToggle.setLabel("audio"); rotX1audioToggle.moveTo("Transform");
rotX1audioToggle.captionLabel().toUpperCase(false);
rotX1audioToggle.captionLabel().style().marginLeft = -13;
rotX1audioToggle.captionLabel().style().marginTop = -38;

// rot Y
// toggle
controlP5.Controller rotY1toggle = cf.control().addToggle("rotY1",false,10+(columnWidth*0),435,18,18);
rotY1toggle.plugTo(parent,"rotY1");
rotY1toggle.setLabel("Y rotation"); rotY1toggle.moveTo("Transform");
rotY1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotY1valueSlider = cf.control().addSlider("rotY1value",-180,180,0,40+(columnWidth*0),435,int(columnWidth*0.7),12);
rotY1valueSlider.plugTo(parent,"rotY1value");
rotY1valueSlider.setLabel(""); rotY1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotY1audioToggle = cf.control().addToggle("rotY1audio",false,int(columnWidth*0.885)+(columnWidth*0),435,18,18);
rotY1audioToggle.plugTo(parent,"rotY1audio");
rotY1audioToggle.setLabel("audio"); rotY1audioToggle.moveTo("Transform");
rotY1audioToggle.captionLabel().toUpperCase(false);
rotY1audioToggle.captionLabel().style().marginLeft = -13;
rotY1audioToggle.captionLabel().style().marginTop = -38;

// rot Z
// toggle
controlP5.Controller rotZ1toggle = cf.control().addToggle("rotZ1",false,10+(columnWidth*0),475,18,18);
rotZ1toggle.plugTo(parent,"rotZ1");
rotZ1toggle.setLabel("Z rotation"); rotZ1toggle.moveTo("Transform");
rotZ1toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotZ1valueSlider = cf.control().addSlider("rotZ1value",-180,180,0,40+(columnWidth*0),475,int(columnWidth*0.7),12);
rotZ1valueSlider.plugTo(parent,"rotZ1value");
rotZ1valueSlider.setLabel(""); rotZ1valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotZ1audioToggle = cf.control().addToggle("rotZ1audio",false,int(columnWidth*0.885)+(columnWidth*0),475,18,18);
rotZ1audioToggle.plugTo(parent,"rotZ1audio");
rotZ1audioToggle.setLabel("audio"); rotZ1audioToggle.moveTo("Transform");
rotZ1audioToggle.captionLabel().toUpperCase(false);
rotZ1audioToggle.captionLabel().style().marginLeft = -13;
rotZ1audioToggle.captionLabel().style().marginTop = -38;


//
// interface transform - column 2
//

// pos H
// toggle
controlP5.Controller posH2toggle = cf.control().addToggle("posH2",false,10+(columnWidth*1),235,18,18);
posH2toggle.plugTo(parent,"posH2");
posH2toggle.setLabel("horizontal position"); posH2toggle.moveTo("Transform");
posH2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posH2valueSlider = cf.control().addSlider("posH2value",-1.0,1.0,0.0,40+(columnWidth*1),235,int(columnWidth*0.7),12);
posH2valueSlider.plugTo(parent,"posH2value");
posH2valueSlider.setLabel(""); posH2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posH2audioToggle = cf.control().addToggle("posH2audio",false,int(columnWidth*0.885)+(columnWidth*1),235,18,18);
posH2audioToggle.plugTo(parent,"posH2audio");
posH2audioToggle.setLabel("audio"); posH2audioToggle.moveTo("Transform");
posH2audioToggle.captionLabel().toUpperCase(false);
posH2audioToggle.captionLabel().style().marginLeft = -13;
posH2audioToggle.captionLabel().style().marginTop = -38;

// pos V
// toggle
controlP5.Controller posV2toggle = cf.control().addToggle("posV2",false,10+(columnWidth*1),275,18,18);
posV2toggle.plugTo(parent,"posV2");
posV2toggle.setLabel("vertical position"); posV2toggle.moveTo("Transform");
posV2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posV2valueSlider = cf.control().addSlider("posV2value",-1.0,1.0,0.0,40+(columnWidth*1),275,int(columnWidth*0.7),12);
posV2valueSlider.plugTo(parent,"posV2value");
posV2valueSlider.setLabel(""); posV2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posV2audioToggle = cf.control().addToggle("posV2audio",false,int(columnWidth*0.885)+(columnWidth*1),275,18,18);
posV2audioToggle.plugTo(parent,"posV2audio");
posV2audioToggle.setLabel("audio"); posV2audioToggle.moveTo("Transform");
posV2audioToggle.captionLabel().toUpperCase(false);
posV2audioToggle.captionLabel().style().marginLeft = -13;
posV2audioToggle.captionLabel().style().marginTop = -38;

// size H
// toggle
controlP5.Controller sizeH2toggle = cf.control().addToggle("sizeH2",false,10+(columnWidth*1),315,18,18);
sizeH2toggle.plugTo(parent,"sizeH2");
sizeH2toggle.setLabel("horizontal size"); sizeH2toggle.moveTo("Transform");
sizeH2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeH2valueSlider = cf.control().addSlider("sizeH2value",-1.0,1.0,0.0,40+(columnWidth*1),315,int(columnWidth*0.7),12);
sizeH2valueSlider.plugTo(parent,"sizeH2value");
sizeH2valueSlider.setLabel(""); sizeH2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeH2audioToggle = cf.control().addToggle("sizeH2audio",false,int(columnWidth*0.885)+(columnWidth*1),315,18,18);
sizeH2audioToggle.plugTo(parent,"sizeH2audio");
sizeH2audioToggle.setLabel("audio"); sizeH2audioToggle.moveTo("Transform");
sizeH2audioToggle.captionLabel().toUpperCase(false);
sizeH2audioToggle.captionLabel().style().marginLeft = -13;
sizeH2audioToggle.captionLabel().style().marginTop = -38;

// size V
// toggle
controlP5.Controller sizeV2toggle = cf.control().addToggle("sizeV2",false,10+(columnWidth*1),355,18,18);
sizeV2toggle.plugTo(parent,"sizeV2");
sizeV2toggle.setLabel("vertical size"); sizeV2toggle.moveTo("Transform");
sizeV2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeV2valueSlider = cf.control().addSlider("sizeV2value",-1.0,1.0,0.0,40+(columnWidth*1),355,int(columnWidth*0.7),12);
sizeV2valueSlider.plugTo(parent,"sizeV2value");
sizeV2valueSlider.setLabel(""); sizeV2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeV2audioToggle = cf.control().addToggle("sizeV2audio",false,int(columnWidth*0.885)+(columnWidth*1),355,18,18);
sizeV2audioToggle.plugTo(parent,"sizeV2audio");
sizeV2audioToggle.setLabel("audio"); sizeV2audioToggle.moveTo("Transform");
sizeV2audioToggle.captionLabel().toUpperCase(false);
sizeV2audioToggle.captionLabel().style().marginLeft = -13;
sizeV2audioToggle.captionLabel().style().marginTop = -38;

// rot X
// toggle
controlP5.Controller rotX2toggle = cf.control().addToggle("rotX2",false,10+(columnWidth*1),395,18,18);
rotX2toggle.plugTo(parent,"rotX2");
rotX2toggle.setLabel("X rotation"); rotX2toggle.moveTo("Transform");
rotX2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotX2valueSlider = cf.control().addSlider("rotX2value",-180,180,0,40+(columnWidth*1),395,int(columnWidth*0.7),12);
rotX2valueSlider.plugTo(parent,"rotX2value");
rotX2valueSlider.setLabel(""); rotX2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotX2audioToggle = cf.control().addToggle("rotX2audio",false,int(columnWidth*0.885)+(columnWidth*1),395,18,18);
rotX2audioToggle.plugTo(parent,"rotX2audio");
rotX2audioToggle.setLabel("audio"); rotX2audioToggle.moveTo("Transform");
rotX2audioToggle.captionLabel().toUpperCase(false);
rotX2audioToggle.captionLabel().style().marginLeft = -13;
rotX2audioToggle.captionLabel().style().marginTop = -38;


// rot Y
// toggle
controlP5.Controller rotY2toggle = cf.control().addToggle("rotY2",false,10+(columnWidth*1),435,18,18);
rotY2toggle.plugTo(parent,"rotY2");
rotY2toggle.setLabel("Y rotation"); rotY2toggle.moveTo("Transform");
rotY2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotY2valueSlider = cf.control().addSlider("rotY2value",-180,180,0,40+(columnWidth*1),435,int(columnWidth*0.7),12);
rotY2valueSlider.plugTo(parent,"rotY2value");
rotY2valueSlider.setLabel(""); rotY2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotY2audioToggle = cf.control().addToggle("rotY2audio",false,int(columnWidth*0.885)+(columnWidth*1),435,18,18);
rotY2audioToggle.plugTo(parent,"rotY2audio");
rotY2audioToggle.setLabel("audio"); rotY2audioToggle.moveTo("Transform");
rotY2audioToggle.captionLabel().toUpperCase(false);
rotY2audioToggle.captionLabel().style().marginLeft = -13;
rotY2audioToggle.captionLabel().style().marginTop = -38;

// rot Z
// toggle
controlP5.Controller rotZ2toggle = cf.control().addToggle("rotZ2",false,10+(columnWidth*1),475,18,18);
rotZ2toggle.plugTo(parent,"rotZ2");
rotZ2toggle.setLabel("Z rotation"); rotZ2toggle.moveTo("Transform");
rotZ2toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotZ2valueSlider = cf.control().addSlider("rotZ2value",-180,180,0,40+(columnWidth*1),475,int(columnWidth*0.7),12);
rotZ2valueSlider.plugTo(parent,"rotZ2value");
rotZ2valueSlider.setLabel(""); rotZ2valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotZ2audioToggle = cf.control().addToggle("rotZ2audio",false,int(columnWidth*0.885)+(columnWidth*1),475,18,18);
rotZ2audioToggle.plugTo(parent,"rotZ2audio");
rotZ2audioToggle.setLabel("audio"); rotZ2audioToggle.moveTo("Transform");
rotZ2audioToggle.captionLabel().toUpperCase(false);
rotZ2audioToggle.captionLabel().style().marginLeft = -13;
rotZ2audioToggle.captionLabel().style().marginTop = -38;


//
// interface transform - column 3
//

// pos H
// toggle
controlP5.Controller posH3toggle = cf.control().addToggle("posH3",false,10+(columnWidth*2),235,18,18);
posH3toggle.plugTo(parent,"posH3");
posH3toggle.setLabel("horizontal position"); posH3toggle.moveTo("Transform");
posH3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posH3valueSlider = cf.control().addSlider("posH3value",-1.0,1.0,0.0,40+(columnWidth*2),235,int(columnWidth*0.7),12);
posH3valueSlider.plugTo(parent,"posH3value");
posH3valueSlider.setLabel(""); posH3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posH3audioToggle = cf.control().addToggle("posH3audio",false,int(columnWidth*0.885)+(columnWidth*2),235,18,18);
posH3audioToggle.plugTo(parent,"posH3audio");
posH3audioToggle.setLabel("audio"); posH3audioToggle.moveTo("Transform");
posH3audioToggle.captionLabel().toUpperCase(false);
posH3audioToggle.captionLabel().style().marginLeft = -13;
posH3audioToggle.captionLabel().style().marginTop = -38;

// pos V
// toggle
controlP5.Controller posV3toggle = cf.control().addToggle("posV3",false,10+(columnWidth*2),275,18,18);
posV3toggle.plugTo(parent,"posV3");
posV3toggle.setLabel("vertical position"); posV3toggle.moveTo("Transform");
posV3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posV3valueSlider = cf.control().addSlider("posV3value",-1.0,1.0,0.0,40+(columnWidth*2),275,int(columnWidth*0.7),12);
posV3valueSlider.plugTo(parent,"posV3value");
posV3valueSlider.setLabel(""); posV3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posV3audioToggle = cf.control().addToggle("posV3audio",false,int(columnWidth*0.885)+(columnWidth*2),275,18,18);
posV3audioToggle.plugTo(parent,"posV3audio");
posV3audioToggle.setLabel("audio"); posV3audioToggle.moveTo("Transform");
posV3audioToggle.captionLabel().toUpperCase(false);
posV3audioToggle.captionLabel().style().marginLeft = -13;
posV3audioToggle.captionLabel().style().marginTop = -38;

// size H
// toggle
controlP5.Controller sizeH3toggle = cf.control().addToggle("sizeH3",false,10+(columnWidth*2),315,18,18);
sizeH3toggle.plugTo(parent,"sizeH3");
sizeH3toggle.setLabel("horizontal size"); sizeH3toggle.moveTo("Transform");
sizeH3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeH3valueSlider = cf.control().addSlider("sizeH3value",-1.0,1.0,0.0,40+(columnWidth*2),315,int(columnWidth*0.7),12);
sizeH3valueSlider.plugTo(parent,"sizeH3value");
sizeH3valueSlider.setLabel(""); sizeH3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeH3audioToggle = cf.control().addToggle("sizeH3audio",false,int(columnWidth*0.885)+(columnWidth*2),315,18,18);
sizeH3audioToggle.plugTo(parent,"sizeH3audio");
sizeH3audioToggle.setLabel("audio"); sizeH3audioToggle.moveTo("Transform");
sizeH3audioToggle.captionLabel().toUpperCase(false);
sizeH3audioToggle.captionLabel().style().marginLeft = -13;
sizeH3audioToggle.captionLabel().style().marginTop = -38;

// size V
// toggle
controlP5.Controller sizeV3toggle = cf.control().addToggle("sizeV3",false,10+(columnWidth*2),355,18,18);
sizeV3toggle.plugTo(parent,"sizeV3");
sizeV3toggle.setLabel("vertical size"); sizeV3toggle.moveTo("Transform");
sizeV3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeV3valueSlider = cf.control().addSlider("sizeV3value",-1.0,1.0,0.0,40+(columnWidth*2),355,int(columnWidth*0.7),12);
sizeV3valueSlider.plugTo(parent,"sizeV3value");
sizeV3valueSlider.setLabel(""); sizeV3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeV3audioToggle = cf.control().addToggle("sizeV3audio",false,int(columnWidth*0.885)+(columnWidth*2),355,18,18);
sizeV3audioToggle.plugTo(parent,"sizeV3audio");
sizeV3audioToggle.setLabel("audio"); sizeV3audioToggle.moveTo("Transform");
sizeV3audioToggle.captionLabel().toUpperCase(false);
sizeV3audioToggle.captionLabel().style().marginLeft = -13;
sizeV3audioToggle.captionLabel().style().marginTop = -38;

// rot X
// toggle
controlP5.Controller rotX3toggle = cf.control().addToggle("rotX3",false,10+(columnWidth*2),395,18,18);
rotX3toggle.plugTo(parent,"rotX3");
rotX3toggle.setLabel("X rotation"); rotX3toggle.moveTo("Transform");
rotX3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotX3valueSlider = cf.control().addSlider("rotX3value",-180,180,0,40+(columnWidth*2),395,int(columnWidth*0.7),12);
rotX3valueSlider.plugTo(parent,"rotX3value");
rotX3valueSlider.setLabel(""); rotX3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotX3audioToggle = cf.control().addToggle("rotX3audio",false,int(columnWidth*0.885)+(columnWidth*2),395,18,18);
rotX3audioToggle.plugTo(parent,"rotX3audio");
rotX3audioToggle.setLabel("audio"); rotX3audioToggle.moveTo("Transform");
rotX3audioToggle.captionLabel().toUpperCase(false);
rotX3audioToggle.captionLabel().style().marginLeft = -13;
rotX3audioToggle.captionLabel().style().marginTop = -38;

// rot Y
// toggle
controlP5.Controller rotY3toggle = cf.control().addToggle("rotY3",false,10+(columnWidth*2),435,18,18);
rotY3toggle.plugTo(parent,"rotY3");
rotY3toggle.setLabel("Y rotation"); rotY3toggle.moveTo("Transform");
rotY3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotY3valueSlider = cf.control().addSlider("rotY3value",-180,180,0,40+(columnWidth*2),435,int(columnWidth*0.7),12);
rotY3valueSlider.plugTo(parent,"rotY3value");
rotY3valueSlider.setLabel(""); rotY3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotY3audioToggle = cf.control().addToggle("rotY3audio",false,int(columnWidth*0.885)+(columnWidth*2),435,18,18);
rotY3audioToggle.plugTo(parent,"rotY3audio");
rotY3audioToggle.setLabel("audio"); rotY3audioToggle.moveTo("Transform");
rotY3audioToggle.captionLabel().toUpperCase(false);
rotY3audioToggle.captionLabel().style().marginLeft = -13;
rotY3audioToggle.captionLabel().style().marginTop = -38;

// rot Z
// toggle
controlP5.Controller rotZ3toggle = cf.control().addToggle("rotZ3",false,10+(columnWidth*2),475,18,18);
rotZ3toggle.plugTo(parent,"rotZ3");
rotZ3toggle.setLabel("Z rotation"); rotZ3toggle.moveTo("Transform");
rotZ3toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotZ3valueSlider = cf.control().addSlider("rotZ3value",-180,180,0,40+(columnWidth*2),475,int(columnWidth*0.7),12);
rotZ3valueSlider.plugTo(parent,"rotZ3value");
rotZ3valueSlider.setLabel(""); rotZ3valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotZ3audioToggle = cf.control().addToggle("rotZ3audio",false,int(columnWidth*0.885)+(columnWidth*2),475,18,18);
rotZ3audioToggle.plugTo(parent,"rotZ3audio");
rotZ3audioToggle.setLabel("audio"); rotZ3audioToggle.moveTo("Transform");
rotZ3audioToggle.captionLabel().toUpperCase(false);
rotZ3audioToggle.captionLabel().style().marginLeft = -13;
rotZ3audioToggle.captionLabel().style().marginTop = -38;


//
// interface transform - column 4
//

// pos H
// toggle
controlP5.Controller posH4toggle = cf.control().addToggle("posH4",false,10+(columnWidth*3),235,18,18);
posH4toggle.plugTo(parent,"posH4");
posH4toggle.setLabel("horizontal position"); posH4toggle.moveTo("Transform");
posH4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posH4valueSlider = cf.control().addSlider("posH4value",-1.0,1.0,0.0,40+(columnWidth*3),235,int(columnWidth*0.7),12);
posH4valueSlider.plugTo(parent,"posH4value");
posH4valueSlider.setLabel(""); posH4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posH4audioToggle = cf.control().addToggle("posH4audio",false,int(columnWidth*0.885)+(columnWidth*3),235,18,18);
posH4audioToggle.plugTo(parent,"posH4audio");
posH4audioToggle.setLabel("audio"); posH4audioToggle.moveTo("Transform");
posH4audioToggle.captionLabel().toUpperCase(false);
posH4audioToggle.captionLabel().style().marginLeft = -13;
posH4audioToggle.captionLabel().style().marginTop = -38;

// pos V
// toggle
controlP5.Controller posV4toggle = cf.control().addToggle("posV4",false,10+(columnWidth*3),275,18,18);
posV4toggle.plugTo(parent,"posV4");
posV4toggle.setLabel("vertical position"); posV4toggle.moveTo("Transform");
posV4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller posV4valueSlider = cf.control().addSlider("posV4value",-1.0,1.0,0.0,40+(columnWidth*3),275,int(columnWidth*0.7),12);
posV4valueSlider.plugTo(parent,"posV4value");
posV4valueSlider.setLabel(""); posV4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller posV4audioToggle = cf.control().addToggle("posV4audio",false,int(columnWidth*0.885)+(columnWidth*3),275,18,18);
posV4audioToggle.plugTo(parent,"posV4audio");
posV4audioToggle.setLabel("audio"); posV4audioToggle.moveTo("Transform");
posV4audioToggle.captionLabel().toUpperCase(false);
posV4audioToggle.captionLabel().style().marginLeft = -13;
posV4audioToggle.captionLabel().style().marginTop = -38;

// size H
// toggle
controlP5.Controller sizeH4toggle = cf.control().addToggle("sizeH4",false,10+(columnWidth*3),315,18,18);
sizeH4toggle.plugTo(parent,"sizeH4");
sizeH4toggle.setLabel("horizontal size"); sizeH4toggle.moveTo("Transform");
sizeH4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeH4valueSlider = cf.control().addSlider("sizeH4value",-1.0,1.0,0.0,40+(columnWidth*3),315,int(columnWidth*0.7),12);
sizeH4valueSlider.plugTo(parent,"sizeH4value");
sizeH4valueSlider.setLabel(""); sizeH4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeH4audioToggle = cf.control().addToggle("sizeH4audio",false,int(columnWidth*0.885)+(columnWidth*3),315,18,18);
sizeH4audioToggle.plugTo(parent,"sizeH4audio");
sizeH4audioToggle.setLabel("audio"); sizeH4audioToggle.moveTo("Transform");
sizeH4audioToggle.captionLabel().toUpperCase(false);
sizeH4audioToggle.captionLabel().style().marginLeft = -13;
sizeH4audioToggle.captionLabel().style().marginTop = -38;

// size V
// toggle
controlP5.Controller sizeV4toggle = cf.control().addToggle("sizeV4",false,10+(columnWidth*3),355,18,18);
sizeV4toggle.plugTo(parent,"sizeV4");
sizeV4toggle.setLabel("vertical size"); sizeV4toggle.moveTo("Transform");
sizeV4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller sizeV4valueSlider = cf.control().addSlider("sizeV4value",-1.0,1.0,0.0,40+(columnWidth*3),355,int(columnWidth*0.7),12);
sizeV4valueSlider.plugTo(parent,"sizeV4value");
sizeV4valueSlider.setLabel(""); sizeV4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller sizeV4audioToggle = cf.control().addToggle("sizeV4audio",false,int(columnWidth*0.885)+(columnWidth*3),355,18,18);
sizeV4audioToggle.plugTo(parent,"sizeV4audio");
sizeV4audioToggle.setLabel("audio"); sizeV4audioToggle.moveTo("Transform");
sizeV4audioToggle.captionLabel().toUpperCase(false);
sizeV4audioToggle.captionLabel().style().marginLeft = -13;
sizeV4audioToggle.captionLabel().style().marginTop = -38;

// rot X
// toggle
controlP5.Controller rotX4toggle = cf.control().addToggle("rotX4",false,10+(columnWidth*3),395,18,18);
rotX4toggle.plugTo(parent,"rotX4");
rotX4toggle.setLabel("X rotation"); rotX4toggle.moveTo("Transform");
rotX4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotX4valueSlider = cf.control().addSlider("rotX4value",-180,180,0,40+(columnWidth*3),395,int(columnWidth*0.7),12);
rotX4valueSlider.plugTo(parent,"rotX4value");
rotX4valueSlider.setLabel(""); rotX4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotX4audioToggle = cf.control().addToggle("rotX4audio",false,int(columnWidth*0.885)+(columnWidth*3),395,18,18);
rotX4audioToggle.plugTo(parent,"rotX4audio");
rotX4audioToggle.setLabel("audio"); rotX4audioToggle.moveTo("Transform");
rotX4audioToggle.captionLabel().toUpperCase(false);
rotX4audioToggle.captionLabel().style().marginLeft = -13;
rotX4audioToggle.captionLabel().style().marginTop = -38;

// rot Y
// toggle
controlP5.Controller rotY4toggle = cf.control().addToggle("rotY4",false,10+(columnWidth*3),435,18,18);
rotY4toggle.plugTo(parent,"rotY4");
rotY4toggle.setLabel("Y rotation"); rotY4toggle.moveTo("Transform");
rotY4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotY4valueSlider = cf.control().addSlider("rotY4value",-180,180,0,40+(columnWidth*3),435,int(columnWidth*0.7),12);
rotY4valueSlider.plugTo(parent,"rotY4value");
rotY4valueSlider.setLabel(""); rotY4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotY4audioToggle = cf.control().addToggle("rotY4audio",false,int(columnWidth*0.885)+(columnWidth*3),435,18,18);
rotY4audioToggle.plugTo(parent,"rotY4audio");
rotY4audioToggle.setLabel("audio"); rotY4audioToggle.moveTo("Transform");
rotY4audioToggle.captionLabel().toUpperCase(false);
rotY4audioToggle.captionLabel().style().marginLeft = -13;
rotY4audioToggle.captionLabel().style().marginTop = -38;

// rot Z
// toggle
controlP5.Controller rotZ4toggle = cf.control().addToggle("rotZ4",false,10+(columnWidth*3),475,18,18);
rotZ4toggle.plugTo(parent,"rotZ4");
rotZ4toggle.setLabel("Z rotation"); rotZ4toggle.moveTo("Transform");
rotZ4toggle.captionLabel().toUpperCase(false).style().marginTop = -38;
// slider
controlP5.Controller rotZ4valueSlider = cf.control().addSlider("rotZ4value",-180,180,0,40+(columnWidth*3),475,int(columnWidth*0.7),12);
rotZ4valueSlider.plugTo(parent,"rotZ4value");
rotZ4valueSlider.setLabel(""); rotZ4valueSlider.moveTo("Transform");
// audio control
controlP5.Controller rotZ4audioToggle = cf.control().addToggle("rotZ4audio",false,int(columnWidth*0.885)+(columnWidth*3),475,18,18);
rotZ4audioToggle.plugTo(parent,"rotZ4audio");
rotZ4audioToggle.setLabel("audio"); rotZ4audioToggle.moveTo("Transform");
rotZ4audioToggle.captionLabel().toUpperCase(false);
rotZ4audioToggle.captionLabel().style().marginLeft = -13;
rotZ4audioToggle.captionLabel().style().marginTop = -38;




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  rithym tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// interface bpm - column 1
controlP5.Controller bpmVisSlider1 = cf.control().addSlider("layer1bpmVis",0,240,0,10+(columnWidth*0),210,int(columnWidth*0.9),14);
bpmVisSlider1.setLabel("vis"); bpmVisSlider1.moveTo("Rhythm"); bpmVisSlider1.plugTo(parent,"layer1bpmVis");
bpmVisSlider1.captionLabel().toUpperCase(false); bpmVisSlider1.valueLabel().style().marginTop = -1;
bpmVisSlider1.captionLabel().style().marginTop = -14; bpmVisSlider1.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmTimeSlider1 = cf.control().addSlider("layer1bpmTime",0,240,0,10+(columnWidth*0),245,int(columnWidth*0.9),14);
bpmTimeSlider1.setLabel("bpm playback time"); bpmTimeSlider1.moveTo("Rhythm"); bpmTimeSlider1.plugTo(parent,"layer1bpmTime");
bpmTimeSlider1.captionLabel().toUpperCase(false); bpmTimeSlider1.valueLabel().style().marginTop = -1;
bpmTimeSlider1.captionLabel().style().marginTop = -14; bpmTimeSlider1.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmMovieSlider1 = cf.control().addSlider("layer1bpmMovie",0,240,0,10+(columnWidth*0),280,int(columnWidth*0.9),14);
bpmMovieSlider1.setLabel("movie"); bpmMovieSlider1.moveTo("Rhythm");
bpmMovieSlider1.captionLabel().toUpperCase(false); bpmMovieSlider1.valueLabel().style().marginTop = -1;
bpmMovieSlider1.captionLabel().style().marginTop = -14; bpmMovieSlider1.captionLabel().style().marginLeft = -(int(columnWidth*0.9));


// interface bpm - column 2  
controlP5.Controller bpmVisSlider2 = cf.control().addSlider("layer2bpmVis",0,240,0,10+(columnWidth*1),210,int(columnWidth*0.9),14);
bpmVisSlider2.setLabel("bpm visibility"); bpmVisSlider2.moveTo("Rhythm"); bpmVisSlider2.plugTo(parent,"layer2bpmVis");
bpmVisSlider2.captionLabel().toUpperCase(false); bpmVisSlider2.valueLabel().style().marginTop = -1;
bpmVisSlider2.captionLabel().style().marginTop = -14; bpmVisSlider2.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmTimeSlider2 = cf.control().addSlider("layer2bpmTime",0,240,0,10+(columnWidth*1),245,int(columnWidth*0.9),14);
bpmTimeSlider2.setLabel("bpm playback time"); bpmTimeSlider2.moveTo("Rhythm"); bpmTimeSlider2.plugTo(parent,"layer2bpmTime");
bpmTimeSlider2.captionLabel().toUpperCase(false); bpmTimeSlider2.valueLabel().style().marginTop = -1;
bpmTimeSlider2.captionLabel().style().marginTop = -14; bpmTimeSlider2.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmMovieSlider2 = cf.control().addSlider("layer2bpmMovie",0,240,0,10+(columnWidth*1),280,int(columnWidth*0.9),14);
bpmMovieSlider2.setLabel("movie"); bpmMovieSlider2.moveTo("Rhythm");
bpmMovieSlider2.captionLabel().toUpperCase(false); bpmMovieSlider2.valueLabel().style().marginTop = -1;
bpmMovieSlider2.captionLabel().style().marginTop = -14; bpmMovieSlider2.captionLabel().style().marginLeft = -(int(columnWidth*0.9));


// interface bpm - column 3
controlP5.Controller bpmVisSlider3 = cf.control().addSlider("layer3bpmVis",0,240,0,10+(columnWidth*2),210,int(columnWidth*0.9),14);
bpmVisSlider3.setLabel("bpm visibility"); bpmVisSlider3.moveTo("Rhythm"); bpmVisSlider3.plugTo(parent,"layer3bpmVis");
bpmVisSlider3.captionLabel().toUpperCase(false); bpmVisSlider3.valueLabel().style().marginTop = -1;
bpmVisSlider3.captionLabel().style().marginTop = -14; bpmVisSlider3.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmTimeSlider3 = cf.control().addSlider("layer3bpmTime",0,240,0,10+(columnWidth*2),245,int(columnWidth*0.9),14);
bpmTimeSlider3.setLabel("bpm playback time"); bpmTimeSlider3.moveTo("Rhythm"); bpmTimeSlider3.plugTo(parent,"layer3bpmTime");
bpmTimeSlider3.captionLabel().toUpperCase(false); bpmTimeSlider3.valueLabel().style().marginTop = -1;
bpmTimeSlider3.captionLabel().style().marginTop = -14; bpmTimeSlider3.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmMovieSlider3 = cf.control().addSlider("layer3bpmMovie",0,240,0,10+(columnWidth*2),280,int(columnWidth*0.9),14);
bpmMovieSlider3.setLabel("movie"); bpmMovieSlider3.moveTo("Rhythm");
bpmMovieSlider3.captionLabel().toUpperCase(false); bpmMovieSlider3.valueLabel().style().marginTop = -1;
bpmMovieSlider3.captionLabel().style().marginTop = -14; bpmMovieSlider3.captionLabel().style().marginLeft = -(int(columnWidth*0.9));


// interface bpm - column 4
controlP5.Controller bpmVisSlider4 = cf.control().addSlider("layer4bpmVis",0,240,0,10+(columnWidth*3),210,int(columnWidth*0.9),14);
bpmVisSlider4.setLabel("bpm visibility"); bpmVisSlider4.moveTo("Rhythm"); bpmVisSlider4.plugTo(parent,"layer4bpmVis");
bpmVisSlider4.captionLabel().toUpperCase(false); bpmVisSlider4.valueLabel().style().marginTop = -1;
bpmVisSlider4.captionLabel().style().marginTop = -14; bpmVisSlider4.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmTimeSlider4 = cf.control().addSlider("layer4bpmTime",0,240,0,10+(columnWidth*3),245,int(columnWidth*0.9),14);
bpmTimeSlider4.setLabel("bpm playback time"); bpmTimeSlider4.moveTo("Rhythm"); bpmTimeSlider4.plugTo(parent,"layer4bpmTime");
bpmTimeSlider4.captionLabel().toUpperCase(false); bpmTimeSlider4.valueLabel().style().marginTop = -1;
bpmTimeSlider4.captionLabel().style().marginTop = -14; bpmTimeSlider4.captionLabel().style().marginLeft = -(int(columnWidth*0.9));

controlP5.Controller bpmMovieSlider4 = cf.control().addSlider("layer4bpmMovie",0,240,0,10+(columnWidth*3),280,int(columnWidth*0.9),14);
bpmMovieSlider4.setLabel("movie"); bpmMovieSlider4.moveTo("Rhythm");
bpmMovieSlider4.captionLabel().toUpperCase(false); bpmMovieSlider4.valueLabel().style().marginTop = -1;
bpmMovieSlider4.captionLabel().style().marginTop = -14; bpmMovieSlider4.captionLabel().style().marginLeft = -(int(columnWidth*0.9));





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  sequencer tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// sequencer - column 1
controlP5.Controller sequencerSlider1 = cf.control().addMatrix("layer1sequencer", 8, 4, 10+(columnWidth*0), 240, int(columnWidth*0.92), 160);
sequencerSlider1.setLabel("sequencer"); sequencerSlider1.moveTo("Sequencer");

// sequencer - column 2
controlP5.Controller sequencerSlider2 = cf.control().addMatrix("layer2sequencer", 8, 4, 10+(columnWidth*1), 240, int(columnWidth*0.92), 160);
sequencerSlider2.setLabel("sequencer"); sequencerSlider2.moveTo("Sequencer");

// sequencer - column 3
controlP5.Controller sequencerSlider3 = cf.control().addMatrix("layer3sequencer", 8, 4, 10+(columnWidth*2), 240, int(columnWidth*0.92), 160);
sequencerSlider3.setLabel("sequencer"); sequencerSlider3.moveTo("Sequencer");

// sequencer - column 4
controlP5.Controller sequencerSlider4 = cf.control().addMatrix("layer4sequencer", 8, 4, 10+(columnWidth*3), 240, int(columnWidth*0.92), 160);
sequencerSlider4.setLabel("sequencer"); sequencerSlider4.moveTo("Sequencer");





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  mapping tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// interface mapping - column 1
controlP5.Controller mappingToggle1 = cf.control().addToggle("mapping1",false,50+(columnWidth*0),265,18,18);
mappingToggle1.plugTo("mapping1");
mappingToggle1.setLabel("quad mapping"); mappingToggle1.moveTo("Mapping");
mappingToggle1.captionLabel().toUpperCase(false);


// interface mapping - column 2
controlP5.Controller mappingToggle2 = cf.control().addToggle("mapping2",false,50+(columnWidth*1),265,18,18);
mappingToggle2.setLabel("mapping"); mappingToggle2.moveTo("Mapping");
mappingToggle2.captionLabel().toUpperCase(false);


// interface mapping - column 3
controlP5.Controller mappingToggle3 = cf.control().addToggle("mapping3",false,50+(columnWidth*2),265,18,18);
mappingToggle3.setLabel("mapping"); mappingToggle3.moveTo("Mapping");
mappingToggle3.captionLabel().toUpperCase(false);


// interface mapping - column 4
controlP5.Controller mappingToggle4 = cf.control().addToggle("mapping4",false,50+(columnWidth*3),265,18,18);
mappingToggle4.setLabel("mapping"); mappingToggle4.moveTo("Mapping");
mappingToggle4.captionLabel().toUpperCase(false);


// interface mapping - masks
controlP5.Controller mappingMask = cf.control().addToggle("mappingMask",false,50+(columnWidth*0),650,18,18);
mappingMask.setLabel("mask"); mappingMask.moveTo("Mapping");
mappingMask.captionLabel().toUpperCase(false);





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  audio tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

controlP5.Controller layer1volumeSlider = cf.control().addSlider("layer1volume",0,1.0,0.0,10+(columnWidth*0),180,int(columnWidth*0.7),14);
layer1volumeSlider.setLabel("volume"); layer1volumeSlider.moveTo("Audio");
layer1volumeSlider.captionLabel().toUpperCase(false);

controlP5.Controller layer2volumeSlider = cf.control().addSlider("layer2volume",0,1.0,0.0,10+(columnWidth*1),180,int(columnWidth*0.7),14);
layer2volumeSlider.setLabel("volume"); layer2volumeSlider.moveTo("Audio");
layer2volumeSlider.captionLabel().toUpperCase(false);

controlP5.Controller layer3volumeSlider = cf.control().addSlider("layer3volume",0,1.0,0.0,10+(columnWidth*2),180,int(columnWidth*0.7),14);
layer3volumeSlider.setLabel("volume"); layer3volumeSlider.moveTo("Audio");
layer3volumeSlider.captionLabel().toUpperCase(false);

controlP5.Controller layer4volumeSlider = cf.control().addSlider("layer4volume",0,1.0,0.0,10+(columnWidth*3),180,int(columnWidth*0.7),14);
layer4volumeSlider.setLabel("volume"); layer4volumeSlider.moveTo("Audio");
layer4volumeSlider.captionLabel().toUpperCase(false);


// audio analysis toggle
controlP5.Controller audioAnalysis1 = cf.control().addToggle("audioAnalysis1",false,50+(columnWidth*0),240,18,18);
audioAnalysis1.setLabel("audio analysis"); audioAnalysis1.moveTo("Audio");
audioAnalysis1.captionLabel().toUpperCase(false);

controlP5.Controller audioAnalysis2 = cf.control().addToggle("audioAnalysis2",false,50+(columnWidth*1),240,18,18);
audioAnalysis2.setLabel("audio analysis"); audioAnalysis2.moveTo("Audio");
audioAnalysis2.captionLabel().toUpperCase(false);

controlP5.Controller audioAnalysis3 = cf.control().addToggle("audioAnalysis3",false,50+(columnWidth*2),240,18,18);
audioAnalysis3.setLabel("audio analysis"); audioAnalysis3.moveTo("Audio");
audioAnalysis3.captionLabel().toUpperCase(false);

controlP5.Controller audioAnalysis4 = cf.control().addToggle("audioAnalysis4",false,50+(columnWidth*3),240,18,18);
audioAnalysis4.setLabel("audio analysis"); audioAnalysis4.moveTo("Audio");
audioAnalysis4.captionLabel().toUpperCase(false);

// FFT scale
controlP5.Controller FFTbandScale1 = cf.control().addSlider("FFTbandScale1",0,60.0,10.0,10+(columnWidth*0),540,int(columnWidth*0.7),14);
FFTbandScale1.setLabel("scale"); FFTbandScale1.moveTo("Audio");
FFTbandScale1.captionLabel().toUpperCase(false);

controlP5.Controller FFTbandScale2 = cf.control().addSlider("FFTbandScale2",0,60.0,10.0,10+(columnWidth*1),540,int(columnWidth*0.7),14);
FFTbandScale2.setLabel("scale"); FFTbandScale2.moveTo("Audio");
FFTbandScale2.captionLabel().toUpperCase(false);

controlP5.Controller FFTbandScale3 = cf.control().addSlider("FFTbandScale3",0,60.0,10.0,10+(columnWidth*2),540,int(columnWidth*0.7),14);
FFTbandScale3.setLabel("scale"); FFTbandScale3.moveTo("Audio");
FFTbandScale3.captionLabel().toUpperCase(false);

controlP5.Controller FFTbandScale4 = cf.control().addSlider("FFTbandScale4",0,60.0,10.0,10+(columnWidth*3),540,int(columnWidth*0.7),14);
FFTbandScale4.setLabel("scale"); FFTbandScale4.moveTo("Audio");
FFTbandScale4.captionLabel().toUpperCase(false);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  prefs tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

controlP5.Controller rootDirBut = cf.control().addButton("rootDirBut",0,10,200,85,14);
rootDirBut.setLabel("root dir"); rootDirBut.moveTo("Preferences");
rootDirBut.captionLabel().toUpperCase(false);

languageList = cf.control().addListBox("language",10,240,int(columnWidth*0.9),240);
//does not need plugTo
languageList.moveTo("Preferences"); languageList.setItemHeight(16);
languageList.captionLabel().toUpperCase(false); // languageList.captionLabel().setHeight(18);
languageList.setLabel("language");
languageList.addItem("English",0);
languageList.addItem("Portuguese",1);
languageList.addItem("French",2);
languageList.addItem("German",3);
languageList.addItem("Chinese",4);
languageList.addItem("Spanish",5);


controlP5.Controller outputXposNumberBox = cf.control().addNumberbox("outputXpos",outputXpos,columnWidth,200,int(columnWidth*0.9),14);
outputXposNumberBox.plugTo(parent,"outputXpos");
outputXposNumberBox.setLabel("output X position");
outputXposNumberBox.captionLabel().toUpperCase(false);
//controlP5.outputXposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
//outputXposNumberBox.setDirection(controlP5.Controller.HORIZONTAL); // change the control direction to left/right
outputXposNumberBox.moveTo("Preferences");

controlP5.Controller outputYposNumberBox = cf.control().addNumberbox("outputYpos",0,columnWidth,240,int(columnWidth*0.9),14);
outputYposNumberBox.plugTo(parent,"outputYpos");
outputYposNumberBox.setLabel("output Y position");
outputYposNumberBox.captionLabel().toUpperCase(false);
//controlP5.outputYposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
//outputYposNumberBox.setDirection(Controller.HORIZONTAL); // change the control direction to left/right
outputYposNumberBox.moveTo("Preferences");

controlP5.Controller syphonToggle1 = cf.control().addToggle("syphonOutput",false,columnWidth,280,15,15);
syphonToggle1.setLabel("Syphon output (Mac only)"); syphonToggle1.moveTo("Preferences");
syphonToggle1.captionLabel().toUpperCase(false);

controlP5.Controller iconsToggle = cf.control().addToggle("showIcons",false,columnWidth,330,15,15);
iconsToggle.plugTo(parent,"showIcons");
iconsToggle.setLabel("Show icons - experimental"); iconsToggle.moveTo("Preferences");
iconsToggle.captionLabel().toUpperCase(false);

outputResolutionList = cf.control().addListBox("outputResolution",columnWidth,380,int(columnWidth*0.9),320);
outputResolutionList.moveTo("Preferences"); outputResolutionList.setItemHeight(16);
outputResolutionList.captionLabel().toUpperCase(false);
outputResolutionList.setLabel("output resolution");
outputResolutionList.addItem("240 x 180",0);
outputResolutionList.addItem("320 x 240",1);
outputResolutionList.addItem("640 x 480",2);
outputResolutionList.addItem("800 x 600",3);
outputResolutionList.addItem("854 x 480",4);
outputResolutionList.addItem("1024 x 768",5);
outputResolutionList.addItem("1280 x 720",6);
outputResolutionList.addItem("1280 x 1024",7);
outputResolutionList.addItem("1920 x 1080",8);
outputResolutionList.addItem("1600 x 1200",9);
outputResolutionList.addItem("1280 x 480 (2X 640 x 480)",10);
outputResolutionList.addItem("1600 x 600 (2X 800 x 600)",11);
outputResolutionList.addItem("2048 x 768 (2X 1024 x 768)",12);
outputResolutionList.addItem("1920 x 480 (3X 640 x 480)",13);
outputResolutionList.addItem("2400 x 600 (3X 800 x 600)",14);
outputResolutionList.addItem("3072 x 768 (3X 1024 x 768)",15);


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface
//  help tab
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//textHelp.setFont(debugFont);

//textHelp.setFont(new ControlFont(createFont("Helvetica",15, true), 15));


textHelp = cf.control().addTextarea("helpText",
"Quase-Cinema Feijoada Remix 0.07b\n"+
"Alexandre Rangel (VJ Xorume), 2011-2012\n"+
"www.quasecinema.org\n\n\n"+
"Shortcuts\n"+
"F1 - F11: changes interface panels\n"+
"1 - 4: selects layers 1 to 4\n"+
"enter: toggle selected layer visibility on/off\n"+
"i: marks in point for movie on the selected layer\n"+
"o: marks out point for movie on the selected layer\n"+
"I: clears in point for movie on the selected layer\n"+
"O: clears out point for movie on the selected layer\n"+
"d: selects root movie directory (with other folders inside)\n"+
"r: randomize movie on selected layer:\n"+
"p: changes preview mode\n"+
"P: changes layer playback mode (loop/ping-pong)\n"+
"space: changes layer playback direction (foward-reverse)\n"+
"t: toggles video scratch for selected layer\n"+
"u: inverts layer colors\n"+
"h: posterizes layer colors\n"+
"m: toggles mask visibility\n"
,
15,180,int(columnWidth*1.9),600).setFont(createFont("Helvetica",14)).setLineHeight(18);

textHelp.moveTo("Help");


  // big drop downs added on top of other controllers

  // xxx
//  // composite layer 1
//  layerComposite1Menu = cf.control().addDropdownList("layerComposite1").setPosition(10+(columnWidth*0),180).setSize(100,180) .setItemHeight(18).setBarHeight(16);
//  layerComposite1Menu.captionLabel().set("composition");
//  layerComposite1Menu.addItem("Normal",0); layerComposite1Menu.addItem("Add",1); layerComposite1Menu.addItem("Screen",2);
//  layerComposite1Menu.addItem("Lightest",3); layerComposite1Menu.addItem("Darkest",4); layerComposite1Menu.addItem("Difference",5);
//  layerComposite1Menu.addItem("Exclusion",6); layerComposite1Menu.addItem("Multiply",7); layerComposite1Menu.addItem("Subtract",8);
//  layerComposite1Menu.moveTo("Effects");
//  
// composite layer 2
layerComposite2Menu = cf.control().addDropdownList("layerComposite2").setPosition(10+(columnWidth*1),180).setSize(100,180) .setItemHeight(18).setBarHeight(16);
layerComposite2Menu.captionLabel().set("composition").toUpperCase(false);
layerComposite2Menu.addItem("Normal",0); layerComposite2Menu.addItem("Add",1); layerComposite2Menu.addItem("Screen",2);
layerComposite2Menu.addItem("Lightest",3); layerComposite2Menu.addItem("Darkest",4); layerComposite2Menu.addItem("Difference",5);
layerComposite2Menu.addItem("Exclusion",6); layerComposite2Menu.addItem("Multiply",7); layerComposite2Menu.addItem("Subtract",8);
layerComposite2Menu.valueLabel().toUpperCase(false);
layerComposite2Menu.moveTo("Effects");

// composite layer 3
layerComposite3Menu = cf.control().addDropdownList("layerComposite3").setPosition(10+(columnWidth*2),180).setSize(100,180) .setItemHeight(18).setBarHeight(16);
layerComposite3Menu.captionLabel().set("composition").toUpperCase(false);
layerComposite3Menu.addItem("Normal",0); layerComposite3Menu.addItem("Add",1); layerComposite3Menu.addItem("Screen",2);
layerComposite3Menu.addItem("Lightest",3); layerComposite3Menu.addItem("Darkest",4); layerComposite3Menu.addItem("Difference",5);
layerComposite3Menu.addItem("Exclusion",6); layerComposite3Menu.addItem("Multiply",7); layerComposite3Menu.addItem("Subtract",8);
layerComposite3Menu.valueLabel().toUpperCase(false);
layerComposite3Menu.moveTo("Effects");

// composite layer 4
layerComposite4Menu = cf.control().addDropdownList("layerComposite4").setPosition(10+(columnWidth*3),180).setSize(100,180) .setItemHeight(18).setBarHeight(16);
layerComposite4Menu.captionLabel().set("composition").toUpperCase(false);
layerComposite4Menu.addItem("Normal",0); layerComposite4Menu.addItem("Add",1); layerComposite4Menu.addItem("Screen",2);
layerComposite4Menu.addItem("Lightest",3); layerComposite4Menu.addItem("Darkest",4); layerComposite4Menu.addItem("Difference",5);
layerComposite4Menu.addItem("Exclusion",6); layerComposite4Menu.addItem("Multiply",7); layerComposite4Menu.addItem("Subtract",8);
layerComposite4Menu.valueLabel().toUpperCase(false);
layerComposite4Menu.moveTo("Effects");

QCtranslate();

} // end setup






























////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  interface draw
//
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

public void draw() {
  background(0,0,0);
  
//
// generate icons
//

if (generateIcon1) { // xxx
  // thread("DogenerateIcon1");
  // generateIcon1 = false;
  // iconLoadingLayer1 = iconLoadingLayer1 + 1;
  
  if (iconLoadingLayer1 == 0) { // first run. clears all icons
    for (int i=0; i<18; i++){
      if (movieForIcons1[i] != null) { movieForIcons1[i].stop(); movieForIcons1[i] = null; }   
    } // end for
  } // end if clear icons

  //if (iconLoadingLayer1 == maxIconsLayer1) { generateIcon1 = false; iconLoadingLayer1 = 0; } // done loading these icons

  if (fileNames1.length > 18) { maxIconsLayer1 = 18; } else { maxIconsLayer1 = fileNames1.length-1; } // number of icons
  tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames1[iconLoadingLayer1];
  println ("loading icon "+iconLoadingLayer1+": "+tempString);
  movieForIcons1[iconLoadingLayer1] = new Movie(this, tempString);
  movieForIcons1[iconLoadingLayer1].read(); movieForIcons1[iconLoadingLayer1].play();
  iconLoadingLayer1 = iconLoadingLayer1 + 1;
  if (iconLoadingLayer1 == maxIconsLayer1) { generateIcon1 = false; iconLoadingLayer1 = 0; } // done loading these icons
} // end if generateIcon1

if (generateIcon2) { // xxx

  if (iconLoadingLayer2 == 0) { // first run. clears all icons
    for (int i=0; i<18; i++){
      if (movieForIcons2[i] != null) { movieForIcons2[i].stop(); movieForIcons2[i] = null; }   
    } // end for
  } // end if clear icons

  if (fileNames2.length > 18) { maxIconsLayer2 = 18; } else { maxIconsLayer2 = fileNames2.length-1; } // number of icons
  tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames2[iconLoadingLayer2];
  println ("loading icon "+iconLoadingLayer4+": "+tempString);
  movieForIcons2[iconLoadingLayer2] = new Movie(this, tempString);
  movieForIcons2[iconLoadingLayer2].read(); movieForIcons2[iconLoadingLayer2].play();
  iconLoadingLayer2 = iconLoadingLayer2 + 1;
  if (iconLoadingLayer2 == maxIconsLayer2) { generateIcon2 = false; iconLoadingLayer2 = 0; } // done loading these icons
} // end if generateIcon2

if (generateIcon3) { // xxx

  if (iconLoadingLayer3 == 0) { // first run. clears all icons
    for (int i=0; i<18; i++){
      if (movieForIcons3[i] != null) { movieForIcons3[i].stop(); movieForIcons3[i] = null; }   
    } // end for
  } // end if clear icons

  if (fileNames3.length > 18) { maxIconsLayer3 = 18; } else { maxIconsLayer3 = fileNames3.length-1; } // number of icons
  tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames3[iconLoadingLayer3];
  println ("loading icon "+iconLoadingLayer3+": "+tempString);
  movieForIcons3[iconLoadingLayer3] = new Movie(this, tempString);
  movieForIcons3[iconLoadingLayer3].read(); movieForIcons3[iconLoadingLayer3].play();
  iconLoadingLayer3 = iconLoadingLayer3 + 1;
  if (iconLoadingLayer3 == maxIconsLayer3) { generateIcon3 = false; iconLoadingLayer3 = 0; } // done loading these icons
} // end if generateIcon4

if (generateIcon4) { // xxx

  if (iconLoadingLayer4 == 0) { // first run. clears all icons
    for (int i=0; i<18; i++){
      if (movieForIcons4[i] != null) { movieForIcons4[i].stop(); movieForIcons4[i] = null; }   
    } // end for
  } // end if clear icons

  if (fileNames4.length > 18) { maxIconsLayer4 = 18; } else { maxIconsLayer4 = fileNames4.length-1; } // number of icons
  tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames4[iconLoadingLayer4];
  println ("loading icon "+iconLoadingLayer4+": "+tempString);
  movieForIcons4[iconLoadingLayer4] = new Movie(this, tempString);
  movieForIcons4[iconLoadingLayer4].read(); movieForIcons4[iconLoadingLayer4].play();
  iconLoadingLayer4 = iconLoadingLayer4 + 1;
  if (iconLoadingLayer4 == maxIconsLayer4) { generateIcon4 = false; iconLoadingLayer4 = 0; } // done loading these icons
} // end if generateIcon4



//
// read icon movies
//

if (showDirectoryIcons1 && showIcons) {
  for (int i = 0; i<maxIconsLayer1; i++){
    if (movieForIcons1[i] != null && movieForIcons1[i].available()) {
      movieForIcons1[i].read(); movieForIcons1[i].play(); movieForIcons1[i].pause();
    } // end if movie available
  } // end for
} // end if showDirectoryIcons1

if (showDirectoryIcons2 && showIcons) {
  for (int i = 0; i<maxIconsLayer2; i++){
    if (movieForIcons2[i] != null && movieForIcons2[i].available()) {
      movieForIcons2[i].read(); movieForIcons2[i].play(); movieForIcons2[i].pause();
    } // end if movie available
  } // end for
} // end if showDirectoryIcons2

if (showDirectoryIcons3 && showIcons) {
  for (int i = 0; i<maxIconsLayer3; i++){
    if (movieForIcons3[i] != null && movieForIcons3[i].available()) {
      movieForIcons3[i].read(); movieForIcons3[i].play(); movieForIcons3[i].pause();
    } // end if movie available
  } // end for
} // end if showDirectoryIcons4


if (showDirectoryIcons4 && showIcons) {
  for (int i = 0; i<maxIconsLayer4; i++){
    if (movieForIcons4[i] != null && movieForIcons4[i].available()) {
      movieForIcons4[i].read(); movieForIcons4[i].play(); movieForIcons4[i].pause();
    } // end if movie available
  } // end for
} // end if showDirectoryIcons4



////////////////////////////////////////
//  interface update
////////////////////////////////////////

// clock
DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd         HH:mm:ss:SSS");
Date d = new Date(); clock = formatter.format(d);
fill (200,200,200); text(clock, 1030, 715);


// fps update
cp5.controller("myFPS").setValue(fpsValue); // fps

// update playback heads
cp5.controller("layer1playback").setValue(myMovie1time);
cp5.controller("layer2playback").setValue(myMovie2time);
cp5.controller("layer3playback").setValue(myMovie3time);
cp5.controller("layer4playback").setValue(myMovie4time);
 
// update visibility buttons
cp5.controller("visibilityToggle1").setValue(int(layer1visibility));
cp5.controller("visibilityToggle2").setValue(int(layer2visibility));
cp5.controller("visibilityToggle3").setValue(int(layer3visibility));
cp5.controller("visibilityToggle4").setValue(int(layer4visibility));

// update invert buttons
cp5.controller("effectInvert1").setValue(int(effectInvert1));
cp5.controller("effectInvert2").setValue(int(effectInvert2));
cp5.controller("effectInvert3").setValue(int(effectInvert3));
cp5.controller("effectInvert4").setValue(int(effectInvert4));

// update posterize buttons
cp5.controller("effectPosterize1").setValue(int(effectPosterize1));
cp5.controller("effectPosterize2").setValue(int(effectPosterize2));
cp5.controller("effectPosterize3").setValue(int(effectPosterize3));
cp5.controller("effectPosterize4").setValue(int(effectPosterize4));


//
// FFT update
// variables and interface
//

//  if (audioAnalysis1 || audioAnalysis2 || audioAnalysis3 || audioAnalysis4) { // update FFT
//    fft.forward(audioIn.mix);
//  }
  
//  if (posH1 && posH1audio) { posH1value = map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posH1value").setValue(posH1value); } }
//  if (posV1 && posV1audio) { posV1value = map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posV1value").setValue(posV1value); } }
//  if (sizeH1 && sizeH1audio) { sizeH1value = map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeH1value").setValue(sizeH1value); } }
//  if (sizeV1 && sizeV1audio) { sizeV1value = map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeV1value").setValue(sizeV1value); } }
//  if (rotX1 && rotX1audio) { rotX1value = int(map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotX1value").setValue(rotX1value); } }
//  if (rotY1 && rotY1audio) { rotY1value = int(map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotY1value").setValue(rotY1value); } }
//  if (rotZ1 && rotZ1audio) { rotZ1value = int(map(fft.getAvg(FFTband1)*FFTbandScale1*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotZ1value").setValue(rotY1value); } }
//  
//  if (posH2 && posH2audio) { posH2value = map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posH2value").setValue(posH2value); } }
//  if (posV2 && posV2audio) { posV2value = map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posV3value").setValue(posV2value); } }
//  if (sizeH2 && sizeH2audio) { sizeH2value = map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeH2value").setValue(sizeH2value); } }
//  if (sizeV2 && sizeV2audio) { sizeV2value = map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeV2value").setValue(sizeV2value); } }
//  if (rotX2 && rotX2audio) { rotX2value = int(map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotX2value").setValue(rotX2value); } }
//  if (rotY2 && rotY2audio) { rotY2value = int(map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotY2value").setValue(rotY2value); } }
//  if (rotZ2 && rotZ2audio) { rotZ2value = int(map(fft.getAvg(FFTband2)*FFTbandScale2*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotZ2value").setValue(rotZ2value); } }
//  
//  if (posH3 && posH3audio) { posH3value = map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posH3value").setValue(posH3value); } }
//  if (posV3 && posV3audio) { posV3value = map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posV3value").setValue(posV3value); } }
//  if (sizeH3 && sizeH3audio) { sizeH3value = map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeH3value").setValue(sizeH3value); } }
//  if (sizeV3 && sizeV3audio) { sizeV3value = map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeV3value").setValue(sizeV3value); } }
//  if (rotX3 && rotX3audio) { rotX3value = int(map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotX3value").setValue(rotX3value); } }
//  if (rotY3 && rotY3audio) { rotY3value = int(map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotY3value").setValue(rotY3value); } }
//  if (rotZ3 && rotZ3audio) { rotZ3value = int(map(fft.getAvg(FFTband3)*FFTbandScale3*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotZ3value").setValue(rotZ3value); } }
//  
//  if (posH4 && posH3audio) { posH4value = map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posH4value").setValue(posH4value); } }
//  if (posV4 && posV3audio) { posV4value = map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("posV4value").setValue(posV4value); } }
//  if (sizeH4 && sizeH3audio) { sizeH4value = map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeH4value").setValue(sizeH4value); } }
//  if (sizeV4 && sizeV3audio) { sizeV4value = map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-1.0,1.0); if (controlWindow.currentTab().id() == 11) { controlP5.controller("sizeV4value").setValue(sizeV4value); } }
//  if (rotX4 && rotX3audio) { rotX4value = int(map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotX4value").setValue(rotX4value); } }
//  if (rotY4 && rotY3audio) { rotY4value = int(map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotY4value").setValue(rotY4value); } }
//  if (rotZ4 && rotZ3audio) { rotZ4value = int(map(fft.getAvg(FFTband4)*FFTbandScale4*2.0,0.0,256.0,-180,180)); if (controlWindow.currentTab().id() == 11) { controlP5.controller("rotZ4value").setValue(rotZ4value); } }
//  
//
//  if (controlWindow.currentTab().id() == 2) { // effects tab
//    if (effectContrastAudio1) { controlP5.controller("effectContrastLimit1").setValue(effectContrastLimit1); }
//    if (effectContrastAudio2) { controlP5.controller("effectContrastLimit2").setValue(effectContrastLimit2); }
//    if (effectContrastAudio3) { controlP5.controller("effectContrastLimit3").setValue(effectContrastLimit3); }
//    if (effectContrastAudio4) { controlP5.controller("effectContrastLimit4").setValue(effectContrastLimit4); }
//
//    if (effectSaturationAudio1) { controlP5.controller("effectSaturationLimit1").setValue(effectSaturationLimit1); }
//    if (effectSaturationAudio2) { controlP5.controller("effectSaturationLimit2").setValue(effectSaturationLimit2); }
//    if (effectSaturationAudio3) { controlP5.controller("effectSaturationLimit3").setValue(effectSaturationLimit3); }
//    if (effectSaturationAudio4) { controlP5.controller("effectSaturationLimit4").setValue(effectSaturationLimit4); }
//
//    if (effectHueAudio1) { controlP5.controller("effectHueLimit1").setValue(effectHueLimit1); }
//    if (effectHueAudio2) { controlP5.controller("effectHueLimit2").setValue(effectHueLimit2); }
//    if (effectHueAudio3) { controlP5.controller("effectHueLimit3").setValue(effectHueLimit3); }
//    if (effectHueAudio4) { controlP5.controller("effectHueLimit4").setValue(effectHueLimit4); }
//    
//    if (effectAnaglyphAudio1) { controlP5.controller("effectAnaglyphAmount1").setValue(effectAnaglyphAmount1); }
//    if (effectAnaglyphAudio2) { controlP5.controller("effectAnaglyphAmount2").setValue(effectAnaglyphAmount2); }
//    if (effectAnaglyphAudio3) { controlP5.controller("effectAnaglyphAmount3").setValue(effectAnaglyphAmount3); }
//    if (effectAnaglyphAudio4) { controlP5.controller("effectAnaglyphAmount4").setValue(effectAnaglyphAmount4); }
    
//  } // end if effects tab
  

//
// bpm visibility update
//

if (layer1bpmVis>0 && millis()-layer1bpmVisLastTime >= map(layer1bpmVis, 0, 240, 1000, 10)) { // layer 1
 layer1visibility = !(layer1visibility); 
 //((Toggle)cp5.controller("layer1visibility")).toggle();
 layer1bpmVisLastTime=millis();
}
if (layer2bpmVis>0 && millis()-layer2bpmVisLastTime >= map(layer2bpmVis, 0, 240, 1000, 10)) { // layer 2
 layer2visibility = !(layer2visibility); 
 layer2bpmVisLastTime=millis();
}
if (layer3bpmVis>0 && millis()-layer3bpmVisLastTime >= map(layer3bpmVis, 0, 240, 1000, 10)) { // layer 3
 layer3visibility = !(layer3visibility); 

 layer3bpmVisLastTime=millis();
}
if (layer4bpmVis>0 && millis()-layer4bpmVisLastTime >= map(layer4bpmVis, 0, 240, 1000, 10)) { // layer 4
 layer4visibility = !(layer4visibility); 
 layer4bpmVisLastTime=millis();
}

//
// bpm movie time update
//

if (layer1bpmTime>0 && millis()-layer1bpmTimeLastTime >= map(layer1bpmTime, 0, 240, 1000, 10)) { // layer 1
 myMovie1.jump(random(myMovie1.duration())); layer1bpmTimeLastTime=millis();
}
if (layer2bpmTime>0 && millis()-layer2bpmTimeLastTime >= map(layer2bpmTime, 0, 240, 1000, 10)) { // layer 2
 myMovie2.jump(random(myMovie2.duration())); layer2bpmTimeLastTime=millis();
}
if (layer3bpmTime>0 && millis()-layer3bpmTimeLastTime >= map(layer3bpmTime, 0, 240, 1000, 10)) { // layer 3
 myMovie3.jump(random(myMovie3.duration())); layer3bpmTimeLastTime=millis();
}
if (layer4bpmTime>0 && millis()-layer4bpmTimeLastTime >= map(layer4bpmTime, 0, 240, 1000, 10)) { // layer 4
 myMovie4.jump(random(myMovie4.duration())); layer4bpmTimeLastTime=millis();
}

//
// bpm change movie update
//

if (layer1bpmMovie>0 && millis()-layer1bpmMovieLastTime >= map(layer1bpmMovie, 0, 240, 36000, 10)) { // layer 1
QCrandomMov(0); // changes movie
layer1bpmMovieLastTime=millis();
}
if (layer2bpmMovie>0 && millis()-layer2bpmMovieLastTime >= map(layer2bpmMovie, 0, 240, 36000, 10)) { // layer 2
QCrandomMov(1); // changes movie
layer2bpmMovieLastTime=millis();
}
if (layer3bpmMovie>0 && millis()-layer3bpmMovieLastTime >= map(layer3bpmMovie, 0, 240, 36000, 10)) { // layer 3
QCrandomMov(2); // changes movie
layer3bpmMovieLastTime=millis();
}
if (layer4bpmMovie>0 && millis()-layer4bpmMovieLastTime >= map(layer4bpmMovie, 0, 240, 36000, 10)) { // layer 4
QCrandomMov(3); // changes movie
layer4bpmMovieLastTime=millis();
}
    
    
    
// interface draw

// full screen preview back
if (previewType == 2) { tint(255,255,255,255); image(previewFullScreen, 0, 0, 1024, 768); }

//
// interface layer columns
//

if ( cp5.getTab("default").isActive() || cp5.getTab("Effects").isActive()
|| cp5.getTab("Rhythm").isActive() || cp5.getTab("Transform").isActive()
|| cp5.getTab("Sequencer").isActive() || cp5.getTab("3D").isActive()
|| cp5.getTab("Playlist").isActive() || cp5.getTab("Audio").isActive() ) {
  
  // not selected layers columns
  if (previewType == 2) { fill(25,25,25,128); } else { fill(25); } // fill
  noStroke();
  for(int i = 0; i< 4; i++) { rect(1+(columnWidth*i),20,int(columnWidth*0.98),700,6); } // end for
  
  // selected layer columns
  if (previewType == 2) { fill(38,38,38,128); } else { fill(38); } // fill

  stroke(#FF0000); strokeWeight(2); smooth();
  rect(1+(columnWidth*selectedLayer),20,int(columnWidth*0.98),700,6);
  strokeWeight(1); noStroke(); noSmooth();

} // end if tab with columns
    
//    if (controlWindow.currentTab().id() == 5) { // mapping tab
//      // not selected layers columns
//      for(int i = 0; i< 4; i++) { fill(25); rect(1+(columnWidth*i),20,int(columnWidth*0.98),600,6); } // end for
//      // selected layer columns
//      fill(38); stroke(#FF0000); strokeWeight(2); smooth();
//      rect(1+(columnWidth*selectedLayer),20,int(columnWidth*0.98),600,6);
//      strokeWeight(1); noStroke(); noSmooth();
//    }
    
//    if (controlWindow.currentTab().id() == 8) { // audio tab
//      fill(40); rect(5,20,interfaceWidth-10,200); // all layers top box
//    }
    
//    if (controlWindow.currentTab().id() > 8 && controlWindow.currentTab().id() < 11) {
//      fill(40); rect(5,20,interfaceWidth-10,140); // all layers top box
//    }
    

    // full screen preview back normal
    // if (previewType == 3) {
    //       tint(255,255,255,255);
    //       image(previewFullScreen, 0,0,1024,768);
    // }


// preview layer icons


// layer 1 icon
fill(128); rect(8+(columnWidth*0), 24, 164, 124);
if (previewType > 0 && layer1visibility){
  tint(red(colorPicker1.getColorValue()), green(colorPicker1.getColorValue()), blue(colorPicker1.getColorValue()), layerOpacity1);
  image(iconLayer1, 10+(columnWidth*0), 26, 160, 120);
} else { fill(0,0,0); rect(10+(columnWidth*0), 26, 160, 120); }

// layer 2 icon
fill(128); rect(8+(columnWidth*1), 24, 164, 124);
if (previewType > 0 && layer2visibility){
  tint(red(colorPicker2.getColorValue()), green(colorPicker2.getColorValue()), blue(colorPicker2.getColorValue()), layerOpacity2);
  image(iconLayer2, 10+(columnWidth*1), 26, 160, 120);
} else { fill(0,0,0); rect(10+(columnWidth*1), 26, 160, 120); }

// layer 3 icon
fill(128); rect(8+(columnWidth*2), 24, 164, 124);
if (previewType > 0 && layer3visibility){
  tint(red(colorPicker3.getColorValue()), green(colorPicker3.getColorValue()), blue(colorPicker3.getColorValue()), layerOpacity3);
  image(iconLayer3, 10+(columnWidth*2), 26, 160, 120);
} else { fill(0,0,0); rect(10+(columnWidth*2), 26, 160, 120); }

// layer 4 icon
fill(128); rect(8+(columnWidth*3), 24, 164, 124);
if (previewType > 0 && layer4visibility){
  tint(red(colorPicker3.getColorValue()), green(colorPicker3.getColorValue()), blue(colorPicker3.getColorValue()), layerOpacity3);
  image(iconLayer4, 10+(columnWidth*3), 26, 160, 120);
} else { fill(0,0,0); rect(10+(columnWidth*3), 26, 160, 120); }
  

// small output preview
fill(100); rect(1026, 20, 248, 188);
if (previewType == 1) { tint(255,255,255,255); image(previewSmall, 1030, 24, 240, 180); }

  
if (cp5.getTab("default").isActive()) { // main tab  
  
  //
  // directory draw
  //
  
  // xxx
  //
  // dir or icons layer 1
  //
  if (showDirectoryIcons1 && showIcons){ // draw icons layer 1
    
    tint(255,255,255,255);
    for (int y = 0; y<6; y++){
      for (int x = 0; x<3; x++){
        if (movieForIcons1[(y*3)+x] != null){
          image(movieForIcons1[(y*3)+x], 8+(columnWidth*0)+(81*x), 300+(62*y), 72, 54);
        } // end if movie null
      } // end for x
    } // end for y

  } else { // draw dir names layer 1

    if (fileCounter1 > 0) {
      // dir text
      for(int i = 0; i< fileCounter1limit; i++) {
        if(i+(dirPageSelected1*21) == fileCounter1){break;}
        if (i+(dirPageSelected1*21) == selectedDir1) {fill(255, 0, 0);} else {fill(0, 255, 0);} // text color
        text(dirs1[i+(dirPageSelected1*21)], 10+(columnWidth*0), 302+(18*i));
      } // end for
      
      // dir pages draw
      dirPages1 = (fileCounter1/fileCounter1limit)+1;
      for(int i = 0; i< (dirPages1); i++) {
        if (i==dirPageSelected1) {stroke(255,0,0);fill(200,0,0);} else {stroke(0,255,0);fill(0,200,0);} // page icon color
        ellipse(10+(columnWidth*0)+(i*17),700,13,13);
      } // end for
    } //end if fileCounter1 > 0

  } // end if showDirectoryIcons1
  
  
  //
  // dir or icons layer 2
  //
  if (showDirectoryIcons2 && showIcons){ // draw icons layer 2
  
    tint(255,255,255,255);
    for (int y = 0; y<6; y++){
      for (int x = 0; x<3; x++){
        if (movieForIcons2[(y*3)+x] != null){
          image(movieForIcons2[(y*3)+x], 8+(columnWidth*1)+(81*x), 300+(62*y), 72, 54);
        } // end if movie null
      } // end for x
    } // end for y

  } else { // draw dir names layer 2

    if (fileCounter2 > 0) {
      // dir text
      for(int i = 0; i< fileCounter2limit; i++) {
        if(i+(dirPageSelected2*21) == fileCounter2){break;}
        if (i+(dirPageSelected2*21) == selectedDir2) {fill(255, 0, 0);} else {fill(0, 255, 0);} // text color
        text(dirs2[i+(dirPageSelected2*21)], 10+(columnWidth*1), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages2 = (fileCounter2/fileCounter2limit)+1;
      for(int i = 0; i< (dirPages2); i++) {
        if (i==dirPageSelected2) {stroke(255,0,0);fill(200,0,0);} else {stroke(0,255,0);fill(0,200,0);} // page icon color
        ellipse(10+(columnWidth*1)+(i*17),700,13,13);
      } // end for
      
    } //end if fileCounter2
  
  } // end if showDirectoryIcons2

  
  //
  // dir or icons layer 3
  //
  if (showDirectoryIcons3 && showIcons) { // draw icons layer 3
    
    tint(255,255,255,255);
    for (int y = 0; y<6; y++){
      for (int x = 0; x<3; x++){
        if (movieForIcons3[(y*3)+x] != null){
          image(movieForIcons3[(y*3)+x], 8+(columnWidth*2)+(81*x), 300+(62*y), 72, 54);
        } // end if movie null
      } // end for x
    } // end for y

  } else { // draw dir names layer 3

    if (fileCounter3 > 0) {
      // dir text
      for(int i = 0; i< fileCounter3limit; i++) {
        if(i+(dirPageSelected3*21) == fileCounter3){break;}
        if (i+(dirPageSelected1*21) == selectedDir3) {fill(255, 0, 0);} else {fill(0, 255, 0);} // text color
        text(dirs3[i+(dirPageSelected3*21)], 10+(columnWidth*2), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages3 = (fileCounter3/fileCounter3limit)+1;
      for(int i = 0; i< (dirPages3); i++) {
        if (i==dirPageSelected3) {stroke(255,0,0);fill(200,0,0);} else {stroke(0,255,0);fill(0,200,0);} // page icon color
        ellipse(10+(columnWidth*2)+(i*17),700,13,13);
      } // end for

    } //end if fileCounter3

  } // end if showDirectoryIcons3
  

  //
  // dir or icons layer 4
  //
  if (showDirectoryIcons4 && showIcons) { // draw icons layer 4
    tint(255,255,255,255);
    for (int y = 0; y<6; y++){
      for (int x = 0; x<3; x++){
        //println("directoryIcons4: "+((y*4)+x)+"  "+directoryIcons4[(y*4)+x]);
        
        //image(directoryIcons4[(y*4)+x], 4+(columnWidth*3)+(62*x), 300+(47*y), 60, 45);
        // if (movieForIcons[(y*4)+x] != null){
        //   image(movieForIcons[(y*4)+x], 4+(columnWidth*3)+(62*x), 300+(47*y), 60, 45);
        // }
        
        //image(directoryIcons4[(y*4)+x], 4+(columnWidth*3)+(62*x), 300+(47*y), 60, 45);
         if (movieForIcons4[(y*3)+x] != null){
           image(movieForIcons4[(y*3)+x], 8+(columnWidth*3)+(81*x), 300+(62*y), 72, 54);
         }
        //
      } // end for x
    } // end for y
    // xxxx

  } else { // draw dir names layer 4

    if (fileCounter4 > 0) {
      for(int i = 0; i< fileCounter4limit; i++) {
        // dir text
        if(i+(dirPageSelected4*21) == fileCounter4){break;}
        if (i+(dirPageSelected4*21) == selectedDir4) {fill(255, 0, 0);} else {fill(0, 255, 0);} // text color
        text(dirs4[i+(dirPageSelected4*21)], 10+(columnWidth*3), 302+(18*i));
      } // end for
      
      // dir pages
      dirPages4 = (fileCounter4/fileCounter4limit)+1;
      for(int i = 0; i< (dirPages4); i++) {
        if (i==dirPageSelected4) {stroke(255,0,0);fill(200,0,0);} else {stroke(0,255,0);fill(0,200,0);} // page icon color
        ellipse(10+(columnWidth*3)+(i*17),700,13,13);
      } // end for
      
    } //end if fileCounter4

  } // end if showDirectoryIcons4
  

  //
  // movies in & out triangle marks draw
  //
  stroke(255,0,0); fill(160,0,0);
  // layer 1
  triangle(11+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 199,
                     11+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 193,
                     14+(columnWidth*0)+map(layer1in,0,layer1length,0,int(columnWidth*0.7)), 196);
  triangle(9+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 199,
                     9+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 193,
                     6+(columnWidth*0)+map(layer1out,0,layer1length,0,int(columnWidth*0.7)), 196);
  // layer 2
  triangle(11+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 199,
                     11+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 193,
                     14+(columnWidth*1)+map(layer2in,0,layer2length,0,int(columnWidth*0.7)), 196);
  triangle(9+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 199,
                     9+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 193,
                     6+(columnWidth*1)+map(layer2out,0,layer2length,0,int(columnWidth*0.7)), 196);
  // layer 3
  triangle(11+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 199,
                     11+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 193,
                     14+(columnWidth*2)+map(layer3in,0,layer3length,0,int(columnWidth*0.7)), 196);
  triangle(9+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 199,
                     9+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 193,
                     6+(columnWidth*2)+map(layer3out,0,layer3length,0,int(columnWidth*0.7)), 196);
  // layer 4
  triangle(11+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 199,
                     11+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 193,
                     14+(columnWidth*3)+map(layer4in,0,layer4length,0,int(columnWidth*0.7)), 196);
  triangle(9+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 199,
                     9+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 193,
                     6+(columnWidth*3)+map(layer4out,0,layer4length,0,int(columnWidth*0.7)), 196);
                     
}
    
    
} // end draw






























///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////  key pressed
////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed(){
  
switch(key) {
  case '1':
     selectedLayer = 0; break; 
  case '2':
     selectedLayer = 1; break;
  case '3':
     selectedLayer = 2; break;
  case '4':
     selectedLayer = 3; break;
     
  case 'd': // select root dir
    //for(int i = 0; i< 200; i++) { dirs1[i]=""; } // clear dirs
    //setInputFolder(selectFolder("select library master folder"));

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
  
case 'm': // mask on / off
  mappingMask = !(mappingMask);
  break; // end m

case 'b': // changes mask
  mappingMaskIndex = mappingMaskIndex - 1;
  if (mappingMaskIndex < 1) { mappingMaskIndex = 8; }
  break; // end m

case 'n': // changes mask
  mappingMaskIndex = mappingMaskIndex + 1;
  if (mappingMaskIndex > 8) { mappingMaskIndex = 1; }
  break; // end m

//  case 'M': // random audio file
//    selectedDirMp3 = int(random(fileNamesMp3.length));
//    tempString = defaultFolderPathMp3 +"/"+fileNamesMp3[selectedDirMp3];
//    audio1.close();
//    audio1 = minim.loadFile(tempString,512);
//    audio1.loop();
//    break; // end M

case 'r': // random movie
  switch (selectedLayer) {
   case 0: 
     switch (layerContent1) { case 0: QCrandomMov(selectedLayer);break; case 1: QCrandomImage(selectedLayer);break; case 2:break; } // end switch layerContent1
     break; // break 0
   case 1:
     switch (layerContent2) { case 0: QCrandomMov(selectedLayer);break; case 1: QCrandomImage(selectedLayer);break; case 2:break; } // end switch layerContent2
     break; // break 1
   case 2:
     switch (layerContent3) { case 0: QCrandomMov(selectedLayer);break; case 1: QCrandomImage(selectedLayer);break; case 2:break; } // end switch layerContent3
     break; // break 2
   case 3:
     switch (layerContent4) { case 0: QCrandomMov(selectedLayer);break; case 1: QCrandomImage(selectedLayer);break; case 2:break; } // end switch layerContent4
     break; // break 3
 } // end switch selectedLayer
  break; // break 'r'
  
case 'R': // random dir
  QCrandomDir(selectedLayer); 
  switch (selectedLayer) {
    case 0: if (showIcons) { generateIcon1 = true; showDirectoryIcons1 = true; } break;
    case 1: if (showIcons) { generateIcon2 = true; showDirectoryIcons2 = true; } break;
    case 2: if (showIcons) { generateIcon3 = true; showDirectoryIcons3 = true; } break;
    case 3: if (showIcons) { generateIcon4 = true; showDirectoryIcons4 = true; } break;
  } // end switch selectedLayer 
  break; // break 'R'
  
case 'u': // invert layer color
 switch (selectedLayer) {
    case 0: effectInvert1 = !effectInvert1; break;
    case 1: effectInvert2 = !effectInvert2; break;
    case 2: effectInvert3 = !effectInvert3; break;
    case 3: effectInvert4 = !effectInvert4; break;
 } // end switch selectedLayer
 break; // break 'i'

case 'h': // posterize layer
 switch (selectedLayer) {
    case 0: effectPosterize1 = !effectPosterize1; break;
    case 1: effectPosterize2 = !effectPosterize2; break;
    case 2: effectPosterize3 = !effectPosterize3; break;
    case 3: effectPosterize4 = !effectPosterize4; break;
 } // end switch selectedLayer
 break; // break 'i'

case 'i': // marks in
 switch (selectedLayer) {
    case 0: layer1in = myMovie1.time(); break;
    case 1: layer2in = myMovie2.time(); break;
    case 2: layer3in = myMovie3.time(); break;
    case 3: layer4in = myMovie4.time(); break;
 } // end switch selectedLayer
 break; // break 'i'
 
case 'o': // marks out
 switch (selectedLayer) {
    case 0: layer1out = myMovie1.time(); break;
    case 1: layer2out = myMovie2.time(); break;
    case 2: layer3out = myMovie3.time(); break;
    case 3: layer4out = myMovie4.time(); break;
 } // end switch selectedLayer
 break; // break 'o'
 
case 'I': // clears in
 switch (selectedLayer) {
    case 0: layer1in = 0; break;
    case 1: layer2in = 0; break;
    case 2: layer3in = 0; break;
    case 3: layer4in = 0; break;
 } // end switch selectedLayer
 break; // break 'I'
 
case 'O': // clears out
 switch (selectedLayer) {
    case 0: layer1out = int(myMovie1.duration()); break;
    case 1: layer2out = int(myMovie2.duration()); break;
    case 2: layer3out = int(myMovie3.duration()); break;
    case 3: layer4out = int(myMovie4.duration()); break;
 } // end switch selectedLayer
 break; // break 'O'

case 'p' :
    previewType = previewType + 1;
    if (previewType > 2) { previewType = 0; }
  
break;  

//case 'X': // start-stop recording movie
    // recordingMovie = !recordingMovie;
    // if (recordingMovie) {
    //   frameRate(30);
    //   //mm = new GSMovieMaker(this, outputWidth, outputHeight, "output.ogg", GSMovieMaker.THEORA, GSMovieMaker.BEST, 30);
    //   mm = new GSMovieMaker(this, outputWidth, outputHeight , "output.ogg", GSMovieMaker.THEORA, GSMovieMaker.HIGH, 30);
    //   mm.start();
    // } else {
    //   mm.finish(); mm.delete(); frameRate(60);
    // }
    //break; // break 'X'
    
 case 't': // toggles video scratch
   switch (selectedLayer) {
     case 0: effectInvert1 = !effectInvert1; break;
     case 1: effectInvert2 = !effectInvert2; break;
     case 2: effectInvert3 = !effectInvert3; break;
     case 3: effectInvert4 = !effectInvert4; break;
   } // end switch
 break; // break 't'

 case 'x':

  //generateIcon = true;
  
  // tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames4[iconLoadingLayer4];
  // // println ("loading icon: "+tempString);
  // // //if (movieForIcons != null) { movieForIcons.stop(); movieForIcons = null; println("killing movie");} 
  // movieForIcons[iconLoadingLayer4] = new Movie(this, tempString);
  // movieForIcons[iconLoadingLayer4].read(); movieForIcons[iconLoadingLayer4].play();

  // //image(movieForIcons, 0, 0, 60, 45);
  // //directoryIcons4[iconLoadingLayer4].loadPixels();
  // //directoryIcons4[iconLoadingLayer4].copy(movieForIcons[iconLoadingLayer4], 0, 0, movieForIcons[iconLoadingLayer4].width, movieForIcons[iconLoadingLayer4].height, 0, 0, 60, 45);
  // //directoryIcons4[iconLoadingLayer4].updatePixels();

  // //directoryIcons4[iconLoadingLayer4] = movieForIcons.get(0, 0, 60, 45);
  // //directoryIcons4[iconLoadingLayer4].resize(60, 45);

  // //directoryIcons4[iconLoadingLayer4].copy(myMovie1, 0, 0, myMovie1.width, myMovie1.height, 0, 0, 60, 45);

  // //println("iconLoadingLayer4: "+ iconLoadingLayer4);
  // //iconLoadingLayer4 = iconLoadingLayer4 + 1;
 break;
 
 case ' ':
     switch (selectedLayer) {
     case 0: layer1speed = -layer1speed; break;
     case 1: layer2speed = -layer2speed; break;
     case 2: layer3speed = -layer3speed; break;
     case 3: layer4speed = -layer4speed; break;
   } // end switch
 break;
 
 case 'P': // ping-pong playback
     switch (selectedLayer) {
     case 0: layer1pingPong = !layer1pingPong; break;
     case 1: layer2pingPong = !layer2pingPong; break;
     case 2: layer3pingPong = !layer3pingPong; break;
     case 3: layer4pingPong = !layer4pingPong; break;
   } // end switch
 break;

 // case 'c': // mapping setup
 //  ks.toggleCalibration();
 // break;

} // end switch key
 
if (keyCode == ENTER) {
  switch (selectedLayer) { 
    //((Toggle)cp5.controller("layer2visibility")).toggle();
    case 0: layer1visibility = !layer1visibility; break; // layer 1
    case 1: layer2visibility = !layer2visibility; break; // layer 2
    case 2: layer3visibility = !layer3visibility; break; // layer 3
    case 3: layer4visibility = !layer4visibility; break; // layer 4
  } // end switch
 } // end ENTER

if (keyCode == TAB) {
  switch (selectedLayer) { 
    case 0: showDirectoryIcons1 = !showDirectoryIcons1; break; // layer 1
    case 1: showDirectoryIcons2 = !showDirectoryIcons2; break; // layer 2
    case 2: showDirectoryIcons3 = !showDirectoryIcons3; break; // layer 3
    case 3: showDirectoryIcons4 = !showDirectoryIcons4; println("showDirectoryIcons4 ="+showDirectoryIcons4);break; // layer 4
  } // end switch
 } // end TAB

if (key == CODED) {
  if (keyCode == KeyEvent.VK_F1) { cp5.getTab("default").bringToFront(); }
  if (keyCode == KeyEvent.VK_F2) { cp5.getTab("Effects").bringToFront(); }
  if (keyCode == KeyEvent.VK_F3) { cp5.getTab("Rhythm").bringToFront(); }
  if (keyCode == KeyEvent.VK_F4) { cp5.getTab("Transform").bringToFront(); }
  if (keyCode == KeyEvent.VK_F5) { cp5.getTab("Sequencer").bringToFront(); }
  if (keyCode == KeyEvent.VK_F6) { cp5.getTab("Mapping").bringToFront(); }
  if (keyCode == KeyEvent.VK_F7) { cp5.getTab("3D").bringToFront(); }
  if (keyCode == KeyEvent.VK_F8) { cp5.getTab("Playlist").bringToFront(); }
  if (keyCode == KeyEvent.VK_F9) { cp5.getTab("Audio").bringToFront(); }
  if (keyCode == KeyEvent.VK_F10) { cp5.getTab("Preferences").bringToFront(); }
  if (keyCode == KeyEvent.VK_F11) { cp5.getTab("Help").bringToFront(); }
    
  } // end if keyCoded  
    
} // end keyPressed




























///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////  mouse pressed
////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void mousePressed() {


//
// dir click check
//  
    
// if main tab, directory column 1
if (cp5.getTab("default").isActive() && showDirectoryIcons1 == false
&& mouseX > (columnWidth*0) && mouseX < (columnWidth*1)
&& mouseY > 280 && mouseY < 680 ) { 
  //if (fileCounter1 > 0) {
  for(int i = 0; i< fileCounter1limit; i++) {
    if ((mouseY < (321+(18*i))) && (mouseY > (303+(18*(i))))) {
      selectedDir1 = i+(dirPageSelected1*21)+1;
      tempString = rootFolder + dirs1[selectedDir1] +"/";
      fileNames1 = listFileNames(tempString, txtFilter);
    } // end if mouse loc
  } // end for
  //} //end if fileCounter1
  //reloadIcons1 = true;
  if (showIcons) { generateIcon1 = true; showDirectoryIcons1 = true; } 
} // end if main tab, column 1
    
// if main tab, directory column 2
else if (cp5.getTab("default").isActive() && showDirectoryIcons2 == false
&& mouseX > (columnWidth*1) && mouseX < (columnWidth*2)
&& mouseY > 280 && mouseY < 680 ) {  
  //if (fileCounter1 > 0) {
  for(int i = 0; i< fileCounter2limit; i++) {
    if ((mouseY < (321+(18*i))) && (mouseY > (303+(18*(i))))) {
      selectedDir2 = i+(dirPageSelected2*21)+1;
      tempString = rootFolder + dirs2[selectedDir2] +"/";
      fileNames2 = listFileNames(tempString, txtFilter);
    } // end if mouse loc
  } // end for
  //} //end if fileCounter2
  if (showIcons) { generateIcon2 = true; showDirectoryIcons2 = true; }
} // end if main tab, column 2

// if main tab, directory column 3
else if (cp5.getTab("default").isActive() && showDirectoryIcons3 == false
&& mouseX > (columnWidth*2) && mouseX < (columnWidth*3)
&& mouseY > 280 && mouseY < 680 ) { 
  //if (fileCounter1 > 0) {
  for(int i = 0; i< fileCounter3limit; i++) {
    if ((mouseY < (321+(18*i))) && (mouseY > (303+(18*(i))))) {
      selectedDir3 = i+(dirPageSelected3*21)+1;
      tempString = rootFolder + dirs3[selectedDir3] +"/";
      fileNames3 = listFileNames(tempString, txtFilter);
    } // end if mouse loc
  } // end for
  if (showIcons) { generateIcon3 = true; showDirectoryIcons3 = true; }
} // end if main tab, column 3

// if main tab, directory column 4
else if (cp5.getTab("default").isActive() && showDirectoryIcons3 == false
&& mouseX > (columnWidth*3) && mouseX < (columnWidth*4)
&& mouseY > 280 && mouseY < 680 ) {
  //if (fileCounter1 > 0) {
  for(int i = 0; i< fileCounter4limit; i++) {
    if ((mouseY < (321+(18*i))) && (mouseY > (303+(18*(i))))) {
      selectedDir4 = i+(dirPageSelected4*21)+1;
      tempString = rootFolder + dirs4[selectedDir4] +"/";
      fileNames4 = listFileNames(tempString, txtFilter);
    } // end if mouse loc
  } // end for
  //} //end if fileCounter4  
  if (showIcons) { generateIcon4 = true; showDirectoryIcons4 = true; }
} // end if main tab, column 4



//
// dir pages click check (ball icons)
//

// dir pages layer 1
if (cp5.getTab("default").isActive() && !showDirectoryIcons1 && mouseY > 700) {
  for(int i = 0; i< (dirPages1); i++) {
    if (mouseX > (10+(columnWidth*0)+(i*17)) && mouseX < (23+(columnWidth*0)+(i*17)) ) {dirPageSelected1=i;}
  } // end for
} // end if


// dir pages layer 2
if (cp5.getTab("default").isActive() && !showDirectoryIcons2 && mouseY > 700) {
  for(int i = 0; i< (dirPages2); i++) {
    if (mouseX > (10+(columnWidth*1)+(i*17)) && mouseX < (23+(columnWidth*1)+(i*17)) ) {dirPageSelected2=i;}
  } // end for
} // end if


// dir pages layer 3
if (cp5.getTab("default").isActive() && !showDirectoryIcons3 && mouseY > 700) {
  for(int i = 0; i< (dirPages3); i++) {
    if (mouseX > (10+(columnWidth*2)+(i*17)) && mouseX < (23+(columnWidth*2)+(i*17)) ) {dirPageSelected3=i;}
  } // end for
} // end if


// dir pages layer 4
if (cp5.getTab("default").isActive() && !showDirectoryIcons4 && mouseY > 700) {
  for(int i = 0; i< (dirPages4); i++) {
    if (mouseX > (10+(columnWidth*3)+(i*17)) && mouseX < (23+(columnWidth*3)+(i*17)) ) {dirPageSelected4=i;}
  } // end for
} // end if



//
// movie icons click check
//  
    
// if main tab, directory column 1
if (cp5.getTab("default").isActive() && showDirectoryIcons1
&& mouseX > (columnWidth*0) && mouseX < (columnWidth*1)
&& mouseY > 280 && mouseY < 680 ) { 
  
  //if (fileCounter1 > 0) {
  for(int i = 0; i< fileCounter1limit; i++) {
    if ((mouseY < (321+(18*i))) && (mouseY > (303+(18*(i))))) {
      selectedDir1 = i+(dirPageSelected1*21)+1;
      tempString = rootFolder + dirs1[selectedDir1] +"/";
      fileNames1 = listFileNames(tempString, txtFilter);
    } // end if mouse loc
  } // end for
  //} //end if fileCounter1


} // end if main tab, column 1


    
//  
// audio FFT click check
//

 //    if (controlWindow.currentTab().id()==8) { // audio tab
      
 // // FFT layer 1 click check
 // if ( mouseY > 300 && mouseY < 514 
 // && mouseX > (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*0)
 // && mouseX < (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*0) ) {
 //   FFTband1 = int (map(mouseX, (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*0), (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*0), 0.0, fft.avgSize()));
 //   println ("\nFFTband1:" + FFTband1);
 // }

 // // FFT layer 2 click check
 // if ( mouseY > 300 && mouseY < 514 
 // && mouseX > (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*1)
 // && mouseX < (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*1) ) {
 //   FFTband2 = int (map(mouseX, (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*1), (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*1), 0.0, fft.avgSize()));
 //   println ("\nFFTband2:" + FFTband2);
 // }

 // // FFT layer 3 click check
 // if ( mouseY > 300 && mouseY < 514 
 // && mouseX > (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*2)
 // && mouseX < (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*2) ) {
 //   FFTband3 = int (map(mouseX, (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*2), (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*2), 0.0, fft.avgSize()));
 //   println ("\nFFTband3:" + FFTband3);
 // }

 // // FFT layer 4 click check
 // if ( mouseY > 300 && mouseY < 514 
 // && mouseX > (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*3)
 // && mouseX < (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*3) ) {
 //   FFTband4 = int (map(mouseX, (audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*3), (fft.avgSize() * audioBarWidth) + (audioBarWidth/2) + 10+(columnWidth*3), 0.0, fft.avgSize()));
 //   println ("\nFFTband4:" + FFTband4);
 // }
      
       
 //    } // end if audio tab


} // end mousePressed




















////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  MIDI events
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void controllerChange(int channel, int number, int value) {
// Receive a controllerChange
//  println("\n --- Midi Controller Change ---");
//  println("Channel:"+channel);
//  println("Number:"+number);
//  println("Value:"+value);
  
  //
  // Korg Nano Kontrol
  //
  // each scene linked to a layer
  //
  
  // layers bpm visibility
//  if (channel==0 && number==23 && value==0) { layer1visibility = !layer1visibility; }
//  else if (channel==0 && number==67 && value==0) { layer2visibility = !layer2visibility; }
//  else if (channel==0 && number==107 && value==0) { layer3visibility = !layer3visibility; }
//  else if (channel==0 && number==16 && value==0) { layer4visibility = !layer4visibility; }
  
//  // layers opacity
//  // slider 1
//       if (channel==0 && number==2) { layerOpacity1 = value * 2; if(layerOpacity1==254){layerOpacity1=255;} activateTab("Effects"); }
//  else if (channel==0 && number==42) { layerOpacity2 = value * 2; if(layerOpacity2==254){layerOpacity2=255;} controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==85) { layerOpacity3 = value * 2; if(layerOpacity3==254){layerOpacity3=255;} controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==7) { layerOpacity4 = value * 2; if(layerOpacity4==254){layerOpacity4=255;} controlWindow.activateTab("Effects"); }
//  
//  // layers bpm visibility
//  // knob 1
//       if (channel==0 && number==14) { controlP5.controller("layer1bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==0 && number==57) { controlP5.controller("layer2bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==0 && number==94) { controlP5.controller("layer3bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==0 && number==10) { controlP5.controller("layer4bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  
//  // layers bpm movie time
//  // knob 2
//       if (channel==0 && number==15) { controlP5.controller("layer1bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==0 && number==58) { controlP5.controller("layer2bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==0 && number==95) { controlP5.controller("layer3bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  else if (channel==1 && number==10) { controlP5.controller("layer4bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
//  
//  // layers vertital position
//  // knob 3
//       if (channel==0 && number==16) { controlP5.controller("posH1").setValue(1); controlP5.controller("posH1value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==59) { controlP5.controller("posH2").setValue(1); controlP5.controller("posH2value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==96) { controlP5.controller("posH3").setValue(1); controlP5.controller("posH3value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==2 && number==10) { controlP5.controller("posH4").setValue(1); controlP5.controller("posH4value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//
//  // layers horizontal position
//  // knob 4
//       if (channel==0 && number==17) { controlP5.controller("posV1").setValue(1); controlP5.controller("posV1value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==60) { controlP5.controller("posV2").setValue(1); controlP5.controller("posV2value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==97) { controlP5.controller("posV3").setValue(1); controlP5.controller("posV3value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==3 && number==10) { controlP5.controller("posV4").setValue(1); controlP5.controller("posV4value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }       
//  
//  // layers horizontal size
//  // knob 5
//       if (channel==0 && number==18) { controlP5.controller("sizeH1").setValue(1); controlP5.controller("sizeH1value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==61) { controlP5.controller("sizeH2").setValue(1); controlP5.controller("sizeH2value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==102) { controlP5.controller("sizeH3").setValue(1); controlP5.controller("sizeH3value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==4 && number==10) { controlP5.controller("sizeH4").setValue(1); controlP5.controller("sizeH4value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); } 
//
//  // layers vertical size
//  // knob 6
//       if (channel==0 && number==19) { controlP5.controller("sizeV1").setValue(1); controlP5.controller("sizeV1value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==62) { controlP5.controller("sizeV2").setValue(1); controlP5.controller("sizeV2value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==103) { controlP5.controller("sizeV3").setValue(1); controlP5.controller("sizeV3value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }
//  else if (channel==5 && number==10) { controlP5.controller("sizeV4").setValue(1); controlP5.controller("sizeV4value").setValue(map(value,0,127,-1.0,1.0)); controlWindow.activateTab("Transform"); }   
//  
//  // layers X rotation
//  // knob 7
//       if (channel==0 && number==20) { controlP5.controller("rotX1").setValue(1); controlP5.controller("rotX1value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==63) { controlP5.controller("rotX2").setValue(1); controlP5.controller("rotX2value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==104) { controlP5.controller("rotX3").setValue(1); controlP5.controller("rotX3value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==6 && number==10) { controlP5.controller("rotX4").setValue(1); controlP5.controller("rotX4value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }   
//  
//  // layers Y rotation
//  // knob 8
//       if (channel==0 && number==21) { controlP5.controller("rotY1").setValue(1); controlP5.controller("rotY1value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==65) { controlP5.controller("rotY2").setValue(1); controlP5.controller("rotY2value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==105) { controlP5.controller("rotY3").setValue(1); controlP5.controller("rotY3value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==7 && number==10) { controlP5.controller("rotY4").setValue(1); controlP5.controller("rotY4value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }  
//  
//  // layers Z rotation
//  // knob 9
//       if (channel==0 && number==22) { controlP5.controller("rotZ1").setValue(1); controlP5.controller("rotZ1value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==66) { controlP5.controller("rotZ2").setValue(1); controlP5.controller("rotZ2value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==0 && number==106) { controlP5.controller("rotZ3").setValue(1); controlP5.controller("rotZ3value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  else if (channel==8 && number==10) { controlP5.controller("rotZ4").setValue(1); controlP5.controller("rotZ4value").setValue(map(value,0,127,-180,180)); controlWindow.activateTab("Transform"); }
//  
//  // layers contrast effect amount
//  // slider 2
//       if (channel==0 && number==3) { controlP5.controller("effectContrastLimit1").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==43) { controlP5.controller("effectContrastLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==86) { controlP5.controller("effectContrastLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  else if (channel==1 && number==7) { controlP5.controller("effectContrastLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  
////  // layers saturation effect amount
////  // slider 3
////       if (channel==0 && number==4) { controlP5.controller("effectSaturationLimit1").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
////  else if (channel==0 && number==50) { controlP5.controller("effectSaturationLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
////  else if (channel==0 && number==87) { controlP5.controller("effectSaturationLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
////  else if (channel==2 && number==7) { controlP5.controller("effectSaturationLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  
//  // layers anaglyph effect amount
//  // slider 3
//       if (channel==0 && number==4) { controlP5.controller("effectAnaglyphAmount1").setValue(map(value,0,127,-64,64)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==50) { controlP5.controller("effectAnaglyphAmount2").setValue(map(value,0,127,-64,64)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==87) { controlP5.controller("effectAnaglyphAmount3").setValue(map(value,0,127,-64,64)); controlWindow.activateTab("Effects"); }
//  else if (channel==2 && number==7) { controlP5.controller("effectAnaglyphAmount4").setValue(map(value,0,127,-64,64)); controlWindow.activateTab("Effects"); }
//  
////  // layers hue effect amount
////  // slider 4
////       if (channel==0 && number==5) { controlP5.controller("effectHueLimit1").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
////  else if (channel==0 && number==51) { controlP5.controller("effectHueLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
////  else if (channel==0 && number==88) { controlP5.controller("effectHueLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
////  else if (channel==3 && number==7) { controlP5.controller("effectHueLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
//  
//  // luma key effect amount
//  // slider 4
//       if (channel==0 && number==5) { controlP5.controller("effectLumaKeyAmount1").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==51) { controlP5.controller("effectLumaKeyAmount2").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
//  else if (channel==0 && number==88) { controlP5.controller("effectLumaKeyAmount3").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
//  else if (channel==3 && number==7) { controlP5.controller("effectLumaKeyAmount4").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
//  
  
  
  // layers red amount
  // slider 5
  if (channel==0 && number==6) {
    colorPicker1.setColorValue(color(map(value,0,127,0,255),green(colorPicker1.getColorValue()),blue(colorPicker1.getColorValue()),alpha(colorPicker1.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==52) {
    colorPicker2.setColorValue(color(map(value,0,127,0,255),green(colorPicker2.getColorValue()),blue(colorPicker2.getColorValue()),alpha(colorPicker2.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==89) {
    colorPicker3.setColorValue(color(map(value,0,127,0,255),green(colorPicker3.getColorValue()),blue(colorPicker3.getColorValue()),alpha(colorPicker3.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==4 && number==7) {
    colorPicker4.setColorValue(color(map(value,0,127,0,255),green(colorPicker4.getColorValue()),blue(colorPicker4.getColorValue()),alpha(colorPicker4.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  }
  
  // layers green amount
  // slider 6
  if (channel==0 && number==8) {
    colorPicker1.setColorValue(color(red(colorPicker1.getColorValue()),map(value,0,127,0,255),blue(colorPicker1.getColorValue()),alpha(colorPicker1.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==53) {
    colorPicker2.setColorValue(color(red(colorPicker2.getColorValue()),map(value,0,127,0,255),blue(colorPicker2.getColorValue()),alpha(colorPicker2.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==90) {
    colorPicker3.setColorValue(color(red(colorPicker3.getColorValue()),map(value,0,127,0,255),blue(colorPicker3.getColorValue()),alpha(colorPicker3.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==5 && number==7) {
    colorPicker4.setColorValue(color(red(colorPicker4.getColorValue()),map(value,0,127,0,255),blue(colorPicker4.getColorValue()),alpha(colorPicker4.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  }
  
  // layers blue amount
  // slider 7
  if (channel==0 && number==9) {
    colorPicker1.setColorValue(color(red(colorPicker1.getColorValue()),green(colorPicker1.getColorValue()),map(value,0,127,0,255),alpha(colorPicker1.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==54) {
    colorPicker2.setColorValue(color(red(colorPicker2.getColorValue()),green(colorPicker2.getColorValue()),map(value,0,127,0,255),alpha(colorPicker2.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==0 && number==91) {
    colorPicker3.setColorValue(color(red(colorPicker3.getColorValue()),green(colorPicker3.getColorValue()),map(value,0,127,0,255),alpha(colorPicker3.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  } else if (channel==6 && number==7) {
    colorPicker4.setColorValue(color(red(colorPicker4.getColorValue()),green(colorPicker4.getColorValue()),map(value,0,127,0,255),alpha(colorPicker4.getColorValue())));
    cp5.getTab("Effects").bringToFront();
  }
  
  
  // layers scratch
  // slider 8
       if (channel==0 && number==12) { scratch1 = true; scratchPos1 = int(map(value,0,127,layer1in,layer1out)); cp5.getTab("default").bringToFront(); }
  else if (channel==0 && number==55) { scratch2 = true; scratchPos2 = int(map(value,0,127,layer2in,layer2out)); cp5.getTab("default").bringToFront(); }
  else if (channel==0 && number==92) { scratch3 = true; scratchPos3 = int(map(value,0,127,layer3in,layer3out)); cp5.getTab("default").bringToFront(); }
  else if (channel==7 && number==7) { scratch4 = true; scratchPos4 = int(map(value,0,127,layer4in,layer4out)); cp5.getTab("default").bringToFront(); }
  
    // layers speed
    // slider 9
       if (channel==0 && number==13) { cp5.controller("layer1speed").setValue(map(value,0,127,0.0,6.0)); scratch1=false; cp5.getTab("default").bringToFront(); }
  else if (channel==0 && number==56) { cp5.controller("layer2speed").setValue(map(value,0,127,0.0,6.0)); scratch2=false; cp5.getTab("default").bringToFront(); }
  else if (channel==0 && number==93) { cp5.controller("layer3speed").setValue(map(value,0,127,0.0,6.0)); scratch3=false; cp5.getTab("default").bringToFront(); }
  else if (channel==7 && number==8) { cp5.controller("layer4speed").setValue(map(value,0,127,0.0,6.0)); scratch4=false; cp5.getTab("default").bringToFront(); }
  
 
} // end midi events






























////////////////////////////////////////
//  drop event
////////////////////////////////////////
  
void dropEvent(DropEvent theDropEvent) {
  if (theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
    if (myFile.isFile()) {
      //println("toString()\t"+theDropEvent.toString());
      newMovie = theDropEvent.toString();
      //if (mouseX > 500) {selectedLayer = 2;}
    switch (selectedLayer){
      case 0: changeMovie1 = true; break;
      case 1: changeMovie2 = true; break;
      case 2: changeMovie3 = true; break;
      case 3: changeMovie4 = true; break;
    } // end switch
    }
  } // end theDropEvent.isFile()
} // end dropEvent






























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
      if (language == 4) { cp5.setControlFont(new ControlFont(createFont("Hei",12, true), 12)); }
      else { cp5.setControlFont(new ControlFont(createFont("Helvetica",12, true), 12)); }
      // xxx
      QCtranslate();
    }
    
    // layer content event
    if (theEvent.group() == layerContentButton1) {
      layerContent1 = int(theEvent.group().value());
      if (layerContent1 == 2) { webcam.start(); } // start-up webcam
    }
    else if (theEvent.group() == layerContentButton2) {
      layerContent2 = int(theEvent.group().value());
      if (layerContent2 == 2) { webcam.start(); } // start-up webcam
    }
    else if (theEvent.group() == layerContentButton3) {
      layerContent3 = int(theEvent.group().value());
      if (layerContent3 == 2) { webcam.start(); } // start-up webcam
    }
    else if (theEvent.group() == layerContentButton4) {
      layerContent4 = int(theEvent.group().value());
      if (layerContent4 == 2) { webcam.start(); } // start-up webcam
    }
    
    // composite
    if (theEvent.group().name() == "layerComposite1") { layerComposite1select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite2") { layerComposite2select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite3") { layerComposite3select = int(theEvent.group().value()); }
    if (theEvent.group().name() == "layerComposite4") { layerComposite4select = int(theEvent.group().value()); }
    
       
  } // end if event is group
  
  
  if(theEvent.isController()) { 
    
    // move output event
    if(theEvent.controller().name()=="outputXpos" || theEvent.controller().name()=="outputYpos") {
      QCmoveOutput();
    }
    
    // xxx
    // if(theEvent.controller().name()=="layer1loop"){ if(layer1loop){ myMovie1.loop(); } else { myMovie1.noLoop(); } }
    // if(theEvent.controller().name()=="layer2loop"){ if(layer2loop){ myMovie2.loop(); } else { myMovie2.noLoop(); } }
    // if(theEvent.controller().name()=="layer3loop"){ if(layer3loop){ myMovie3.loop(); } else { myMovie3.noLoop(); } }
    // if(theEvent.controller().name()=="layer4loop"){ if(layer4loop){ myMovie4.loop(); } else { myMovie4.noLoop(); } }
    
    // controller light paint toggle
    if(theEvent.controller().name()=="effectPaint1"){ if(effectPaint1){ layerComposite1select=1; } else { layerComposite1select=0; } }
    if(theEvent.controller().name()=="effectPaint2"){ if(effectPaint2){ layerComposite2select=1; } else { layerComposite2select=0; } }
    if(theEvent.controller().name()=="effectPaint3"){ if(effectPaint3){ layerComposite3select=1; } else { layerComposite3select=0; } }
    if(theEvent.controller().name()=="effectPaint4"){ if(effectPaint4){ layerComposite4select=1; } else { layerComposite4select=0; } }
    
//    // black and white amount turns effect on/off
//    if(theEvent.controller().name()=="effectBWlimit1"){ if(theEvent.controller().value() != 0){ effectBW1 = true; controlP5.controller("effectBW1").setValue(1); } }
//    if(theEvent.controller().name()=="effectBWlimit2"){ if(theEvent.controller().value() != 0){ effectBW2 = true; controlP5.controller("effectBW2").setValue(1); } }
//    if(theEvent.controller().name()=="effectBWlimit3"){ if(theEvent.controller().value() != 0){ effectBW3 = true; controlP5.controller("effectBW3").setValue(1); } }
//    if(theEvent.controller().name()=="effectBWlimit4"){ if(theEvent.controller().value() != 0){ effectBW4 = true; controlP5.controller("effectBW4").setValue(1); } }
//    
//    // contrast amount turns effect on/off
//    if(theEvent.controller().name()=="effectContrastLimit1"){ if(theEvent.controller().value()!=0){ effectContrast1=true; controlP5.controller("effectContrast1").setValue(1);}
//      else { effectContrast1=false; controlP5.controller("effectContrast1").setValue(0); } }
//    if(theEvent.controller().name()=="effectContrastLimit2"){ if(theEvent.controller().value()!=0){ effectContrast2=true; controlP5.controller("effectContrast2").setValue(1);}
//      else { effectContrast2=false; controlP5.controller("effectContrast2").setValue(0); } }
//    if(theEvent.controller().name()=="effectContrastLimit3"){ if(theEvent.controller().value()!=0){ effectContrast3=true; controlP5.controller("effectContrast3").setValue(1);}
//      else { effectContrast3=false; controlP5.controller("effectContrast3").setValue(0); } }
//    if(theEvent.controller().name()=="effectContrastLimit4"){ if(theEvent.controller().value()!=0){ effectContrast4=true; controlP5.controller("effectContrast4").setValue(1);}
//      else { effectContrast4=false; controlP5.controller("effectContrast4").setValue(0); } }
    
  } // end if controllers
  
} // end controlEvent
  

// xxx
// roor dir button
// public void rootDirBut(int theValue) { setInputFolder(selectFolder("select library master folder")); }


// random dir buttons - randomize dir and movie
public void randomDir1(int theValue) { QCrandomDir(0); }
public void randomDir2(int theValue) { QCrandomDir(1); }
public void randomDir3(int theValue) { QCrandomDir(2); }
public void randomDir4(int theValue) { QCrandomDir(3); }


// random movie buttons - randomize dir and movie
public void randomMov1(int theValue) { doRandomize = 0; }
public void randomMov2(int theValue) { doRandomize = 1; }
public void randomMov3(int theValue) { doRandomize = 2; }
public void randomMov4(int theValue) { doRandomize = 3; }




















// thread function
// public void DogenerateIcon1() { // xxx
//   if (fileNames1.length > 18) { maxIconsLayer1 = 18; } else { maxIconsLayer1 = fileNames1.length-1; } // number of icons

//   for (int i = 0; i<maxIconsLayer1; i++){
//     tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames1[i];
//     println ("loading icon "+iconLoadingLayer1+": "+tempString);
//     //if (movieForIcons1[iconLoadingLayer1] != null) { movieForIcons1[iconLoadingLayer1].stop(); movieForIcons1[iconLoadingLayer1] = null;} 
//     movieForIcons1[i] = new Movie(this, tempString);
//     movieForIcons1[i].read(); movieForIcons1[i].play();
//   }
//   // iconLoadingLayer1 = iconLoadingLayer1 + 1;
//   // if (iconLoadingLayer1 == maxIconsLayer1) { generateIcon1 = false; iconLoadingLayer1 = 0; } // done loading these icons
// } // end if generateIcon1


} // MAIN END end controlFrame




