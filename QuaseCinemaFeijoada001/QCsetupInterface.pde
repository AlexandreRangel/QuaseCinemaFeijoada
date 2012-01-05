
// QCsetupInterface()

void QCsetupInterface() {
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  controlP5 setup
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("Quase-Cinema Feijoada Remix 0.01+",0,0,1024,748); 
  //controlWindow = controlP5.addControlWindow("Quase-Cinema Feijoada Remix 0.01+",0,0,screenWidth,screenHeight); 
  controlWindow.hideCoordinates();
  controlWindow.setBackground(#000000);
  // for continuous update use ControlWindow.NORMAL  to update a control
  // window only when it is in focus, use ControlWindow.ECONOMIC is the default update value.
  //controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.frameRate(60);  
  
  controlP5.setColorForeground(#0AA000);
  controlP5.setColorBackground(#343434);
  controlP5.setColorLabel(#B7B7B7);
  controlP5.setColorValue(#E5E5E5);
  controlP5.setColorActive(#00FF00);
  controlP5.setControlFont(new ControlFont(createFont("Helvetica",12, true), 12));
   
  cc = new MyCanvas(); // create a control window canvas
  cc.pre(); // use cc.post(); to draw on top of the controllers.
  controlWindow.addCanvas(cc);
  
  // tabs
  controlWindow.tab("default").setLabel("Main"); controlWindow.tab("default").setId(1);
  controlWindow.tab("default").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Effects"); controlWindow.tab("Effects").setLabel("  Effects  "); controlWindow.tab("Effects").setId(2);
  controlWindow.tab("Effects").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Rhythm"); controlWindow.tab("Rhythm").setLabel("  Rhythm  "); controlWindow.tab("Rhythm").setId(3);
  controlWindow.tab("Rhythm").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Sequencer"); controlWindow.tab("Sequencer").setLabel("  Sequencer  "); controlWindow.tab("Sequencer").setId(4);
  controlWindow.tab("Sequencer").captionLabel().toUpperCase(false).setHeight(23).setWidth(90).style().marginTop = -1;
  controlWindow.addTab("Mapping"); controlWindow.tab("Mapping").setLabel("  Mapping  "); controlWindow.tab("Mapping").setId(5);
  controlWindow.tab("Mapping").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("3D"); controlWindow.tab("3D").setLabel("  3D  "); controlWindow.tab("3D").setId(6);
  controlWindow.tab("3D").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Playlist"); controlWindow.tab("Playlist").setLabel("  Playlist  "); controlWindow.tab("Playlist").setId(7);
  controlWindow.tab("Playlist").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Audio"); controlWindow.tab("Audio").setLabel("  Audio  "); controlWindow.tab("Audio").setId(8);
  controlWindow.tab("Audio").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1;
  controlWindow.addTab("Prefs"); controlWindow.tab("Prefs").setLabel("  Preferences  "); controlWindow.tab("Prefs").setId(9);
  controlWindow.tab("Prefs").captionLabel().toUpperCase(false).setHeight(23).setWidth(90).style().marginTop = -1;
  controlWindow.addTab("Help"); controlWindow.tab("Help").setLabel("  Help  "); controlWindow.tab("Help").setId(10);
  controlWindow.tab("Help").captionLabel().toUpperCase(false).setHeight(23).setWidth(80).style().marginTop = -1; 
  
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
  controlP5.Controller faderSlider = controlP5.addSlider("fade",0,100,0,(columnWidth*3),731,int(columnWidth*0.88),12);
  faderSlider.setLabel("fade"); faderSlider.moveTo(controlWindow,"global");
  faderSlider.captionLabel().toUpperCase(false);
  faderSlider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller myFPS = controlP5.addSlider("fpsValue",0,60,0,(columnWidth*2),731,int(columnWidth*0.88),12);
  myFPS.moveTo(controlWindow,"global"); myFPS.captionLabel().set("fps");
  myFPS.captionLabel().toUpperCase(false);
  myFPS.valueLabel().style().marginTop = -1;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  // interface
  // main tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // interface main - column 1
  controlP5.Controller visibilityToggle1 = controlP5.addToggle("layer1visibility",true,180+(columnWidth*0),24,20,20);
  visibilityToggle1.setLabel("visible"); visibilityToggle1.moveTo(controlWindow,"global");
  visibilityToggle1.captionLabel().toUpperCase(false);
  
  layerContentButton1 = controlP5.addRadioButton("layerContent1",180+(columnWidth*0),109);
  layerContentButton1.setNoneSelectedAllowed(false); layerContentButton1.setItemsPerRow(1);
  layerContentButton1.addItem("Movie1",0); layerContentButton1.activate(0);
  layerContentButton1.addItem("Image1",1);
  layerContentButton1.addItem("Cam1",2);
  layerContentButton1.moveTo(controlWindow,"global");
  
  controlP5.Controller loopToggle1 = controlP5.addToggle("layer1loop",true,10+(columnWidth*0),160,15,15);
  loopToggle1.setLabel("loop"); loopToggle1.moveTo(controlWindow);
  loopToggle1.captionLabel().toUpperCase(false);
  
  controlP5.Controller playbackSlider1 = controlP5.addSlider("layer1playback",0,1.0,0.0,10+(columnWidth*0),200,int(columnWidth*0.7),14);
  playbackSlider1.setLabel("playback"); playbackSlider1.moveTo(controlWindow);
  playbackSlider1.captionLabel().toUpperCase(false);
  playbackSlider1.valueLabel().style().marginTop = -1;
  
  controlP5.Controller mySlider = controlP5.addSlider("layer1speed",-4.0,4.0,1.0,10+(columnWidth*0),220,int(columnWidth*0.7),14);
  mySlider.setLabel("speed"); mySlider.moveTo(controlWindow);
  mySlider.captionLabel().toUpperCase(false);
  mySlider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller randomDir1 = controlP5.addButton("randomDir1",0,10+(columnWidth*0),250,85,14);
  randomDir1.setLabel("random dir"); randomDir1.moveTo(controlWindow);
  randomDir1.captionLabel().toUpperCase(false);
  randomDir1.captionLabel().style().marginTop = -1;
  
  controlP5.Controller randomMov1 = controlP5.addButton("randomMov1",0,110+(columnWidth*0),250,85,14);
  randomMov1.setLabel("random mov"); randomMov1.moveTo(controlWindow);
  randomMov1.captionLabel().toUpperCase(false);
  randomMov1.captionLabel().style().marginTop = -1;
  
  // interface main - column 2
  controlP5.Controller visibilityToggle2 = controlP5.addToggle("layer2visibility",false,180+(columnWidth*1),24,20,20);
  visibilityToggle2.setLabel("visible"); visibilityToggle2.moveTo(controlWindow,"global");
  visibilityToggle2.captionLabel().toUpperCase(false);
  
  layerContentButton2 = controlP5.addRadioButton("layerContent2",180+(columnWidth*1),109);
  layerContentButton2.setNoneSelectedAllowed(false); layerContentButton2.setItemsPerRow(1);
  layerContentButton2.addItem("Movie2",0); layerContentButton2.activate(0);
  layerContentButton2.addItem("Image2",1);
  layerContentButton2.addItem("Cam2",2);
  layerContentButton2.moveTo(controlWindow,"global");
  
  controlP5.Controller loopToggle2 = controlP5.addToggle("layer2loop",true,10+(columnWidth*1),160,15,15);
  loopToggle2.setLabel("loop"); loopToggle2.moveTo(controlWindow);
  loopToggle2.captionLabel().toUpperCase(false);
  
  controlP5.Controller playbackSlider2 = controlP5.addSlider("layer2playback",0,1.0,0.0,10+(columnWidth*1),200,int(columnWidth*0.7),14);
  playbackSlider2.setLabel("playback"); playbackSlider2.moveTo(controlWindow);
  playbackSlider2.captionLabel().toUpperCase(false);
  playbackSlider2.valueLabel().style().marginTop = -1;
  
  controlP5.Controller speedSlider2 = controlP5.addSlider("layer2speed",-4.0,4.0,1.0,10+(columnWidth*1),220,int(columnWidth*0.7),14);
  speedSlider2.setLabel("speed"); speedSlider2.moveTo(controlWindow);
  speedSlider2.captionLabel().toUpperCase(false);
  speedSlider2.valueLabel().style().marginTop = -1;
  
  controlP5.Controller randomDir2 = controlP5.addButton("randomDir2",0,10+(columnWidth*1),250,85,14);
  randomDir2.setLabel("random dir"); randomDir2.moveTo(controlWindow);
  randomDir2.captionLabel().toUpperCase(false);
  randomDir2.captionLabel().style().marginTop = -1;
  
  controlP5.Controller randomMov2 = controlP5.addButton("randomMov2",0,115+(columnWidth*1),250,85,14);
  randomMov2.setLabel("random mov"); randomMov2.moveTo(controlWindow);
  randomMov2.captionLabel().toUpperCase(false);
  randomMov2.captionLabel().style().marginTop = -1;
  
  
  // interface main - column 3
  controlP5.Controller visibilityToggle3 = controlP5.addToggle("layer3visibility",false,180+(columnWidth*2),24,20,20);
  visibilityToggle3.setLabel("visible"); visibilityToggle3.moveTo(controlWindow,"global");
  visibilityToggle3.captionLabel().toUpperCase(false);
  
  layerContentButton3 = controlP5.addRadioButton("layerContent3",180+(columnWidth*2),109);
  layerContentButton3.setNoneSelectedAllowed(false); layerContentButton3.setItemsPerRow(1);
  layerContentButton3.addItem("Movie3",0); layerContentButton3.activate(0);
  layerContentButton3.addItem("Image3",1);
  layerContentButton3.addItem("Cam3",2);
  layerContentButton3.moveTo(controlWindow,"global");
  
  controlP5.Controller loopToggle3 = controlP5.addToggle("layer3loop",true,10+(columnWidth*2),160,15,15);
  loopToggle3.setLabel("loop"); loopToggle3.moveTo(controlWindow);
  loopToggle3.captionLabel().toUpperCase(false);
  
  controlP5.Controller playbackSlider3 = controlP5.addSlider("layer3playback",0,1.0,0.0,10+(columnWidth*2),200,int(columnWidth*0.7),14);
  playbackSlider3.setLabel("playback"); playbackSlider3.moveTo(controlWindow);
  playbackSlider3.captionLabel().toUpperCase(false);
  playbackSlider3.valueLabel().style().marginTop = -1;
  
  controlP5.Controller speedSlider3 = controlP5.addSlider("layer3speed",-4.0,4.0,1.0,10+(columnWidth*2),220,int(columnWidth*0.7),14);
  speedSlider3.setLabel("speed"); speedSlider3.moveTo(controlWindow);
  speedSlider3.captionLabel().toUpperCase(false);
  speedSlider3.valueLabel().style().marginTop = -1;
  
  controlP5.Controller randomDir3 = controlP5.addButton("randomDir3",0,10+(columnWidth*2),250,85,14);
  randomDir3.setLabel("random dir"); randomDir3.moveTo(controlWindow);
  randomDir3.captionLabel().toUpperCase(false);
  randomDir3.captionLabel().style().marginTop = -1;
  
  controlP5.Controller randomMov3 = controlP5.addButton("randomMov3",0,115+(columnWidth*2),250,85,14);
  randomMov3.setLabel("random mov"); randomMov3.moveTo(controlWindow);
  randomMov3.captionLabel().toUpperCase(false);
  randomMov3.captionLabel().style().marginTop = -1;
  
  
  // interface main - column 4
  controlP5.Controller visibilityToggle4 = controlP5.addToggle("layer4visibility",false,180+(columnWidth*3),24,20,20);
  visibilityToggle4.setLabel("visible"); visibilityToggle4.moveTo(controlWindow,"global");
  visibilityToggle3.captionLabel().toUpperCase(false);
  
  layerContentButton4 = controlP5.addRadioButton("layerContent4",180+(columnWidth*3),109);
  layerContentButton4.setNoneSelectedAllowed(false); layerContentButton4.setItemsPerRow(1);
  layerContentButton4.addItem("Movie4",0); layerContentButton4.activate(0);
  layerContentButton4.addItem("Image4",1);
  layerContentButton4.addItem("Cam4",2);
  layerContentButton4.moveTo(controlWindow,"global");
  
  controlP5.Controller loopToggle4 = controlP5.addToggle("layer4loop",true,10+(columnWidth*3),160,15,15);
  loopToggle4.setLabel("loop"); loopToggle4.moveTo(controlWindow);
  loopToggle4.captionLabel().toUpperCase(false);
  
  controlP5.Controller playbackSlider4 = controlP5.addSlider("layer4playback",0,1.0,0.0,10+(columnWidth*3),200,int(columnWidth*0.7),14);
  playbackSlider4.setLabel("playback"); playbackSlider4.moveTo(controlWindow);
  playbackSlider4.captionLabel().toUpperCase(false);
  playbackSlider4.valueLabel().style().marginTop = -1;
  
  controlP5.Controller speedSlider4 = controlP5.addSlider("layer4speed",-4.0,4.0,1.0,10+(columnWidth*3),220,int(columnWidth*0.7),14);
  speedSlider4.setLabel("speed"); speedSlider4.moveTo(controlWindow);
  speedSlider4.captionLabel().toUpperCase(false);
  speedSlider4.valueLabel().style().marginTop = -1;
  
  controlP5.Controller randomDir4 = controlP5.addButton("randomDir4",0,10+(columnWidth*3),250,85,14);
  randomDir4.setLabel("random dir"); randomDir4.moveTo(controlWindow);
  randomDir4.captionLabel().toUpperCase(false);
  randomDir4.captionLabel().style().marginTop = -1;
  
  controlP5.Controller randomMov4 = controlP5.addButton("randomMov4",0,115+(columnWidth*3),250,85,14);
  randomMov4.setLabel("random mov"); randomMov4.moveTo(controlWindow);
  randomMov4.captionLabel().toUpperCase(false);
  randomMov4.captionLabel().style().marginTop = -1;
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  effects tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  //
  // interface effects - column 1
  //
  
  colorPicker1 = controlP5.addColorPicker("layer1color",10+(columnWidth*0),200,int(columnWidth*0.9),20);
  colorPicker1.moveTo(controlWindow,"Effects");
  
  layerComposite1Menu = controlP5.addDropdownList("layerComposite1",10+(columnWidth*0),180,100,60);
  layerComposite1Menu.captionLabel().set("Composition");
  layerComposite1Menu.captionLabel().toUpperCase(false);
  layerComposite1Menu.setItemHeight(16);layerComposite1Menu.setBarHeight(16);layerComposite1Menu.captionLabel().style().marginTop = 3;
  layerComposite1Menu.addItem("Normal",0); layerComposite1Menu.addItem("Lighten",1); layerComposite1Menu.addItem("Darken",2);
  layerComposite1Menu.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle1 = controlP5.addToggle("effectInvert1",false,10+(columnWidth*0),265,20,20);
  invertToggle1.setLabel("invert"); invertToggle1.moveTo(controlWindow,"Effects");
  invertToggle1.captionLabel().toUpperCase(false);
  
  controlP5.Controller posterizeToggle1 = controlP5.addToggle("effectPosterize1",false,50+(columnWidth*0),265,20,20);
  posterizeToggle1.setLabel("poster"); posterizeToggle1.moveTo(controlWindow,"Effects");
  posterizeToggle1.captionLabel().toUpperCase(false);
  
  controlP5.Controller effectRgToggle1 = controlP5.addToggle("effectRG1",false,10+(columnWidth*0),315,20,20);
  effectRgToggle1.setLabel("R > G"); effectRgToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle1 = controlP5.addToggle("effectRB1",false,50+(columnWidth*0),315,20,20);
  effectRbToggle1.setLabel("R > B"); effectRbToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle1 = controlP5.addToggle("effectBG1",false,90+(columnWidth*0),315,20,20);
  effectGbToggle1.setLabel("G > B"); effectGbToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle1 = controlP5.addToggle("effectBW1",false,10+(columnWidth*0),355,20,20);
  effectBWToggle1.setLabel("BW"); effectBWToggle1.moveTo(controlWindow,"Effects");
  effectBWToggle1.captionLabel().toUpperCase(false);
  controlP5.Controller effectBWlimit1slider = controlP5.addSlider("effectBWlimit1",0,255,127,40+(columnWidth*0),355,int(columnWidth*0.8),12);
  effectBWlimit1slider.moveTo(controlWindow,"Effects");
  effectBWlimit1slider.setLabel("");
  effectBWlimit1slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectContrastToggle1 = controlP5.addToggle("effectContrast1",false,10+(columnWidth*0),395,20,20);
  effectContrastToggle1.setLabel("Contrast"); effectContrastToggle1.moveTo(controlWindow,"Effects");
  effectContrastToggle1.captionLabel().toUpperCase(false);
  controlP5.Controller effectContrastLimit1slider = controlP5.addSlider("effectContrastLimit1",0,200,0,40+(columnWidth*0),395,int(columnWidth*0.8),12);
  effectContrastLimit1slider.moveTo(controlWindow,"Effects");
  effectContrastLimit1slider.setLabel("");
  effectContrastLimit1slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectSaturationToggle1 = controlP5.addToggle("effectSaturation1",false,10+(columnWidth*0),435,20,20);
  effectSaturationToggle1.setLabel("Saturation"); effectSaturationToggle1.moveTo(controlWindow,"Effects");
  effectSaturationToggle1.captionLabel().toUpperCase(false);
  controlP5.Controller effectSaturationLimit1slider = controlP5.addSlider("effectSaturationLimit1",0,256,0,40+(columnWidth*0),435,int(columnWidth*0.8),12);
  effectSaturationLimit1slider.moveTo(controlWindow,"Effects");
  effectSaturationLimit1slider.setLabel("");
  effectSaturationLimit1slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectHueToggle1 = controlP5.addToggle("effectHue1",false,10+(columnWidth*0),475,20,20);
  effectHueToggle1.setLabel("Hue"); effectHueToggle1.moveTo(controlWindow,"Effects");
  effectHueToggle1.captionLabel().toUpperCase(false);
  controlP5.Controller effectHueLimit1slider = controlP5.addSlider("effectHueLimit1",0,256,0,40+(columnWidth*0),475,int(columnWidth*0.8),12);
  effectHueLimit1slider.moveTo(controlWindow,"Effects");
  effectHueLimit1slider.setLabel("");
  effectHueLimit1slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller paintToggle1 = controlP5.addToggle("effectPaint1",false,10+(columnWidth*0),525,20,20);
  paintToggle1.setLabel("light paint"); paintToggle1.moveTo(controlWindow,"Effects");
  paintToggle1.captionLabel().toUpperCase(false);
  controlP5.Controller paint1slider = controlP5.addSlider("paintAmount1",0,256,0,40+(columnWidth*0),525,int(columnWidth*0.8),12);
  paint1slider.moveTo(controlWindow,"Effects");
  paint1slider.setLabel("");
  paint1slider.valueLabel().style().marginTop = -1;
  
  //
  // interface effects - column 2
  //
  
  colorPicker2 = controlP5.addColorPicker("layer2color",10+(columnWidth*1),200,int(columnWidth*0.9),20);
  colorPicker2.moveTo(controlWindow,"Effects");
  
  layerComposite2Menu = controlP5.addDropdownList("layerComposite2",10+(columnWidth*1),180,100,60);
  layerComposite2Menu.captionLabel().set("Composition");
  layerComposite2Menu.captionLabel().toUpperCase(false);
  layerComposite2Menu.setItemHeight(16);layerComposite2Menu.setBarHeight(16);layerComposite2Menu.captionLabel().style().marginTop = 3;
  layerComposite2Menu.addItem("Normal",0); layerComposite2Menu.addItem("Lighten",1); layerComposite2Menu.addItem("Darken",2);
  layerComposite2Menu.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle2 = controlP5.addToggle("effectInvert2",false,10+(columnWidth*1),265,20,20);
  invertToggle2.setLabel("invert"); invertToggle2.moveTo(controlWindow,"Effects");
  invertToggle2.captionLabel().toUpperCase(false);
  
  controlP5.Controller posterizeToggle2 = controlP5.addToggle("effectPosterize2",false,50+(columnWidth*1),265,20,20);
  posterizeToggle2.setLabel("poster"); posterizeToggle2.moveTo(controlWindow,"Effects");
  posterizeToggle2.captionLabel().toUpperCase(false);
  
  controlP5.Controller paintToggle2 = controlP5.addToggle("effectPaint2",false,90+(columnWidth*1),265,20,20);
  paintToggle2.setLabel("light paint"); paintToggle2.moveTo(controlWindow,"Effects");
  paintToggle2.captionLabel().toUpperCase(false);
  
  controlP5.Controller effectRgToggle2 = controlP5.addToggle("effectRG2",false,10+(columnWidth*1),315,20,20);
  effectRgToggle2.setLabel("R > G"); effectRgToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle2 = controlP5.addToggle("effectRB2",false,50+(columnWidth*1),315,20,20);
  effectRbToggle2.setLabel("R > B"); effectRbToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle2 = controlP5.addToggle("effectBG2",false,90+(columnWidth*1),315,20,20);
  effectGbToggle2.setLabel("G > B"); effectGbToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle2 = controlP5.addToggle("effectBW2",false,10+(columnWidth*1),355,20,20);
  effectBWToggle2.setLabel("BW"); effectBWToggle2.moveTo(controlWindow,"Effects");
  effectBWToggle2.captionLabel().toUpperCase(false);
  controlP5.Controller effectBWlimit2slider = controlP5.addSlider("effectBWlimit2",0,255,127,40+(columnWidth*1),355,int(columnWidth*0.8),12);
  effectBWlimit2slider.moveTo(controlWindow,"Effects");
  effectBWlimit2slider.setLabel("");
  effectBWlimit2slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectContrastToggle2 = controlP5.addToggle("effectContrast2",false,10+(columnWidth*1),395,20,20);
  effectContrastToggle2.setLabel("Contrast"); effectContrastToggle2.moveTo(controlWindow,"Effects");
  effectContrastToggle2.captionLabel().toUpperCase(false);
  controlP5.Controller effectContrastLimit2slider = controlP5.addSlider("effectContrastLimit2",0,200,0,40+(columnWidth*1),395,int(columnWidth*0.8),12);
  effectContrastLimit2slider.moveTo(controlWindow,"Effects");
  effectContrastLimit2slider.setLabel("");
  effectContrastLimit2slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectSaturationToggle2 = controlP5.addToggle("effectSaturation2",false,10+(columnWidth*1),435,20,20);
  effectSaturationToggle2.setLabel("Saturation"); effectSaturationToggle2.moveTo(controlWindow,"Effects");
  effectSaturationToggle2.captionLabel().toUpperCase(false);
  controlP5.Controller effectSaturationLimit2slider = controlP5.addSlider("effectSaturationLimit2",0,256,0,40+(columnWidth*1),435,int(columnWidth*0.8),12);
  effectSaturationLimit2slider.moveTo(controlWindow,"Effects");
  effectSaturationLimit2slider.setLabel("");
  effectSaturationLimit2slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectHueToggle2 = controlP5.addToggle("effectHue2",false,10+(columnWidth*1),475,20,20);
  effectHueToggle2.setLabel("Hue"); effectHueToggle2.moveTo(controlWindow,"Effects");
  effectHueToggle2.captionLabel().toUpperCase(false);
  controlP5.Controller effectHueLimit2slider = controlP5.addSlider("effectHueLimit2",0,256,0,40+(columnWidth*1),475,int(columnWidth*0.8),12);
  effectHueLimit2slider.moveTo(controlWindow,"Effects");
  effectHueLimit2slider.setLabel("");
  effectHueLimit2slider.valueLabel().style().marginTop = -1;
  
  
  //
  // interface effects - column 3
  //
  
  colorPicker3 = controlP5.addColorPicker("layer3color",10+(columnWidth*2),200,int(columnWidth*0.9),20);
  colorPicker3.moveTo(controlWindow,"Effects");
  
  layerComposite3Menu = controlP5.addDropdownList("layerComposite3",10+(columnWidth*2),180,100,60);
  layerComposite3Menu.captionLabel().set("Composition");
  layerComposite3Menu.captionLabel().toUpperCase(false);
  layerComposite3Menu.setItemHeight(16);layerComposite3Menu.setBarHeight(16);layerComposite3Menu.captionLabel().style().marginTop = 3;
  layerComposite3Menu.addItem("Normal",0); layerComposite3Menu.addItem("Lighten",1); layerComposite3Menu.addItem("Darken",2);
  layerComposite3Menu.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle3 = controlP5.addToggle("effectInvert3",false,10+(columnWidth*2),265,20,20);
  invertToggle3.setLabel("invert"); invertToggle3.moveTo(controlWindow,"Effects");
  invertToggle3.captionLabel().toUpperCase(false);
  
  controlP5.Controller posterizeToggle3 = controlP5.addToggle("effectPosterize3",false,50+(columnWidth*2),265,20,20);
  posterizeToggle3.setLabel("poster"); posterizeToggle3.moveTo(controlWindow,"Effects");
  posterizeToggle3.captionLabel().toUpperCase(false);

  controlP5.Controller paintToggle3 = controlP5.addToggle("effectPaint3",false,90+(columnWidth*2),265,20,20);
  paintToggle3.setLabel("light paint"); paintToggle3.moveTo(controlWindow,"Effects");
  paintToggle3.captionLabel().toUpperCase(false);
  
  controlP5.Controller effectRgToggle3 = controlP5.addToggle("effectRG3",false,10+(columnWidth*2),315,20,20);
  effectRgToggle3.setLabel("R > G"); effectRgToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle3 = controlP5.addToggle("effectRB3",false,50+(columnWidth*2),315,20,20);
  effectRbToggle3.setLabel("R > B"); effectRbToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle3 = controlP5.addToggle("effectBG3",false,90+(columnWidth*2),315,20,20);
  effectGbToggle3.setLabel("G > B"); effectGbToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle3 = controlP5.addToggle("effectBW3",false,10+(columnWidth*2),355,20,20);
  effectBWToggle3.setLabel("BW"); effectBWToggle3.moveTo(controlWindow,"Effects");
  effectBWToggle3.captionLabel().toUpperCase(false);
  controlP5.Controller effectBWlimit3slider = controlP5.addSlider("effectBWlimit3",0,255,127,40+(columnWidth*2),355,int(columnWidth*0.8),12);
  effectBWlimit3slider.moveTo(controlWindow,"Effects");
  effectBWlimit3slider.setLabel("");
  effectBWlimit3slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectContrastToggle3 = controlP5.addToggle("effectContrast3",false,10+(columnWidth*2),395,20,20);
  effectContrastToggle3.setLabel("Contrast"); effectContrastToggle3.moveTo(controlWindow,"Effects");
  effectContrastToggle3.captionLabel().toUpperCase(false);
  controlP5.Controller effectContrastLimit3slider = controlP5.addSlider("effectContrastLimit3",0,200,0,40+(columnWidth*2),395,int(columnWidth*0.8),12);
  effectContrastLimit3slider.moveTo(controlWindow,"Effects");
  effectContrastLimit3slider.setLabel("");
  effectContrastLimit3slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectSaturationToggle3 = controlP5.addToggle("effectSaturation3",false,10+(columnWidth*2),435,20,20);
  effectSaturationToggle3.setLabel("Saturation"); effectSaturationToggle3.moveTo(controlWindow,"Effects");
  effectSaturationToggle3.captionLabel().toUpperCase(false);
  controlP5.Controller effectSaturationLimit3slider = controlP5.addSlider("effectSaturationLimit3",0,256,0,40+(columnWidth*2),435,int(columnWidth*0.8),12);
  effectSaturationLimit3slider.moveTo(controlWindow,"Effects");
  effectSaturationLimit3slider.setLabel("");
  effectSaturationLimit3slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectHueToggle3 = controlP5.addToggle("effectHue3",false,10+(columnWidth*2),475,20,20);
  effectHueToggle3.setLabel("Hue"); effectHueToggle3.moveTo(controlWindow,"Effects");
  effectHueToggle3.captionLabel().toUpperCase(false);
  controlP5.Controller effectHueLimit3slider = controlP5.addSlider("effectHueLimit3",0,256,0,40+(columnWidth*2),475,int(columnWidth*0.8),12);
  effectHueLimit3slider.moveTo(controlWindow,"Effects");
  effectHueLimit3slider.setLabel("");
  effectHueLimit3slider.valueLabel().style().marginTop = -1;
  
  
  //
  // interface effects - column 4
  //
  
  colorPicker4 = controlP5.addColorPicker("layer4color",10+(columnWidth*3),200,int(columnWidth*0.9),20);
  colorPicker4.moveTo(controlWindow,"Effects");
  
  layerComposite4Menu = controlP5.addDropdownList("layerComposite4",10+(columnWidth*3),180,100,60);
  layerComposite4Menu.captionLabel().set("Composition");
  layerComposite4Menu.captionLabel().toUpperCase(false);
  layerComposite4Menu.setItemHeight(16);layerComposite4Menu.setBarHeight(16);layerComposite4Menu.captionLabel().style().marginTop = 3;
  layerComposite4Menu.addItem("Normal",0); layerComposite4Menu.addItem("Lighten",1); layerComposite4Menu.addItem("Darken",2);
  layerComposite4Menu.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle4 = controlP5.addToggle("effectInvert4",false,10+(columnWidth*3),265,20,20);
  invertToggle4.setLabel("invert"); invertToggle4.moveTo(controlWindow,"Effects");
  invertToggle4.captionLabel().toUpperCase(false);
  
  controlP5.Controller posterizeToggle4 = controlP5.addToggle("effectPosterize4",false,50+(columnWidth*3),265,20,20);
  posterizeToggle4.setLabel("poster"); posterizeToggle4.moveTo(controlWindow,"Effects");
  posterizeToggle4.captionLabel().toUpperCase(false);
  
  controlP5.Controller paintToggle4 = controlP5.addToggle("effectPaint4",false,90+(columnWidth*3),265,20,20);
  paintToggle4.setLabel("light paint"); paintToggle4.moveTo(controlWindow,"Effects");
  paintToggle4.captionLabel().toUpperCase(false);
  
  controlP5.Controller effectRgToggle4 = controlP5.addToggle("effectRG4",false,10+(columnWidth*3),315,20,20);
  effectRgToggle4.setLabel("R > G"); effectRgToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle4 = controlP5.addToggle("effectRB4",false,50+(columnWidth*3),315,20,20);
  effectRbToggle4.setLabel("R > B"); effectRbToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle4 = controlP5.addToggle("effectBG4",false,90+(columnWidth*3),315,20,20);
  effectGbToggle4.setLabel("G > B"); effectGbToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle4 = controlP5.addToggle("effectBW4",false,10+(columnWidth*3),355,20,20);
  effectBWToggle4.setLabel("BW"); effectBWToggle4.moveTo(controlWindow,"Effects");
  effectBWToggle4.captionLabel().toUpperCase(false);
  controlP5.Controller effectBWlimit4slider = controlP5.addSlider("effectBWlimit4",0,255,127,40+(columnWidth*3),355,int(columnWidth*0.8),12);
  effectBWlimit4slider.moveTo(controlWindow,"Effects");
  effectBWlimit4slider.captionLabel().toUpperCase(false);
  effectBWlimit4slider.setLabel("");
  effectBWlimit4slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectContrastToggle4 = controlP5.addToggle("effectContrast4",false,10+(columnWidth*3),395,20,20);
  effectContrastToggle4.setLabel("Contrast"); effectContrastToggle4.moveTo(controlWindow,"Effects");
  effectContrastToggle4.captionLabel().toUpperCase(false);
  controlP5.Controller effectContrastLimit4slider = controlP5.addSlider("effectContrastLimit4",0,200,0,40+(columnWidth*3),395,int(columnWidth*0.8),12);
  effectContrastLimit4slider.moveTo(controlWindow,"Effects");
  effectContrastLimit4slider.setLabel("");
  effectContrastLimit4slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectSaturationToggle4 = controlP5.addToggle("effectSaturation4",false,10+(columnWidth*3),435,20,20);
  effectSaturationToggle4.setLabel("Saturation"); effectSaturationToggle4.moveTo(controlWindow,"Effects");
  effectSaturationToggle4.captionLabel().toUpperCase(false);
  controlP5.Controller effectSaturationLimit4slider = controlP5.addSlider("effectSaturationLimit4",0,256,0,40+(columnWidth*3),435,int(columnWidth*0.8),12);
  effectSaturationLimit4slider.moveTo(controlWindow,"Effects");
  effectSaturationLimit4slider.setLabel("");
  effectSaturationLimit4slider.valueLabel().style().marginTop = -1;
  
  controlP5.Controller effectHueToggle4 = controlP5.addToggle("effectHue4",false,10+(columnWidth*3),475,20,20);
  effectHueToggle4.setLabel("Hue"); effectHueToggle4.moveTo(controlWindow,"Effects");
  effectHueToggle4.captionLabel().toUpperCase(false);
  controlP5.Controller effectHueLimit4slider = controlP5.addSlider("effectHueLimit4",0,256,0,40+(columnWidth*3),475,int(columnWidth*0.8),12);
  effectHueLimit4slider.moveTo(controlWindow,"Effects");
  effectHueLimit4slider.setLabel("");
  effectHueLimit4slider.valueLabel().style().marginTop = -1;
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  bpm tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // interface bpm - column 1
  controlP5.Controller bpmVisSlider1 = controlP5.addSlider("layer1bpmVis",0,240,0,10+(columnWidth*0),210,int(columnWidth*0.7),14);
  bpmVisSlider1.setLabel("vis"); bpmVisSlider1.moveTo(controlWindow,"Rhythm");
  bpmVisSlider1.captionLabel().toUpperCase(false);
  bpmVisSlider1.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmTimeSlider1 = controlP5.addSlider("layer1bpmTime",0,240,0,10+(columnWidth*0),235,int(columnWidth*0.7),14);
  bpmTimeSlider1.setLabel("time"); bpmTimeSlider1.moveTo(controlWindow,"Rhythm");
  bpmTimeSlider1.captionLabel().toUpperCase(false);
  bpmTimeSlider1.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmMovieSlider1 = controlP5.addSlider("layer1bpmMovie",0,240,0,10+(columnWidth*0),260,int(columnWidth*0.7),14);
  bpmMovieSlider1.setLabel("movie"); bpmMovieSlider1.moveTo(controlWindow,"Rhythm");
  bpmMovieSlider1.captionLabel().toUpperCase(false);
  bpmMovieSlider1.valueLabel().style().marginTop = -1;
  
  // interface bpm - column 2  
  controlP5.Controller bpmVisSlider2 = controlP5.addSlider("layer2bpmVis",0,240,0,10+(columnWidth*1),210,int(columnWidth*0.7),14);
  bpmVisSlider2.setLabel("vis"); bpmVisSlider2.moveTo(controlWindow,"Rhythm");
  bpmVisSlider2.captionLabel().toUpperCase(false);
  bpmVisSlider2.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmTimeSlider2 = controlP5.addSlider("layer2bpmTime",0,240,0,10+(columnWidth*1),235,int(columnWidth*0.7),14);
  bpmTimeSlider2.setLabel("time"); bpmTimeSlider2.moveTo(controlWindow,"Rhythm");
  bpmTimeSlider2.captionLabel().toUpperCase(false);
  bpmTimeSlider2.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmMovieSlider2 = controlP5.addSlider("layer2bpmMovie",0,240,0,10+(columnWidth*1),260,int(columnWidth*0.7),14);
  bpmMovieSlider2.setLabel("movie"); bpmMovieSlider2.moveTo(controlWindow,"Rhythm");
  bpmMovieSlider2.captionLabel().toUpperCase(false);
  bpmMovieSlider2.valueLabel().style().marginTop = -1;
  
  
  // interface bpm - column 3
  controlP5.Controller bpmVisSlider3 = controlP5.addSlider("layer3bpmVis",0,240,0,10+(columnWidth*2),210,int(columnWidth*0.7),14);
  bpmVisSlider3.setLabel("vis"); bpmVisSlider3.moveTo(controlWindow,"Rhythm");
  bpmVisSlider3.captionLabel().toUpperCase(false);
  bpmVisSlider3.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmTimeSlider3 = controlP5.addSlider("layer3bpmTime",0,240,0,10+(columnWidth*2),235,int(columnWidth*0.7),14);
  bpmTimeSlider3.setLabel("time"); bpmTimeSlider3.moveTo(controlWindow,"Rhythm");
  bpmTimeSlider3.captionLabel().toUpperCase(false);
  bpmTimeSlider3.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmMovieSlider3 = controlP5.addSlider("layer3bpmMovie",0,240,0,10+(columnWidth*2),260,int(columnWidth*0.7),14);
  bpmMovieSlider3.setLabel("movie"); bpmMovieSlider3.moveTo(controlWindow,"Rhythm");
  bpmMovieSlider3.captionLabel().toUpperCase(false);
  bpmMovieSlider3.valueLabel().style().marginTop = -1;
 
  
  // interface bpm - column 4
  controlP5.Controller bpmVisSlider4 = controlP5.addSlider("layer4bpmVis",0,240,0,10+(columnWidth*3),210,int(columnWidth*0.7),14);
  bpmVisSlider4.setLabel("vis"); bpmVisSlider4.moveTo(controlWindow,"Rhythm");
  bpmVisSlider4.captionLabel().toUpperCase(false);
  bpmVisSlider4.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmTimeSlider4 = controlP5.addSlider("layer4bpmTime",0,240,0,10+(columnWidth*3),235,int(columnWidth*0.7),14);
  bpmTimeSlider4.setLabel("time"); bpmTimeSlider4.moveTo(controlWindow,"Rhythm");
  bpmTimeSlider4.captionLabel().toUpperCase(false);
  bpmTimeSlider4.valueLabel().style().marginTop = -1;
  
  controlP5.Controller bpmMovieSlider4 = controlP5.addSlider("layer4bpmMovie",0,240,0,10+(columnWidth*3),260,int(columnWidth*0.7),14);
  bpmMovieSlider4.setLabel("movie"); bpmMovieSlider4.moveTo(controlWindow,"Rhythm");
  bpmMovieSlider4.captionLabel().toUpperCase(false);
  bpmMovieSlider4.valueLabel().style().marginTop = -1;
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  sequencer tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // sequencer - column 1
  controlP5.Controller sequencerSlider1 = controlP5.addMatrix("layer1sequencer", 8, 4, 10+(columnWidth*0), 240, int(columnWidth*0.92), 160);
  sequencerSlider1.setLabel("sequencer"); sequencerSlider1.moveTo(controlWindow,"Sequencer");
  
  // sequencer - column 2
  controlP5.Controller sequencerSlider2 = controlP5.addMatrix("layer2sequencer", 8, 4, 10+(columnWidth*1), 240, int(columnWidth*0.92), 160);
  sequencerSlider2.setLabel("sequencer"); sequencerSlider2.moveTo(controlWindow,"Sequencer");
  
  // sequencer - column 3
  controlP5.Controller sequencerSlider3 = controlP5.addMatrix("layer3sequencer", 8, 4, 10+(columnWidth*2), 240, int(columnWidth*0.92), 160);
  sequencerSlider3.setLabel("sequencer"); sequencerSlider3.moveTo(controlWindow,"Sequencer");
  
  // sequencer - column 4
  controlP5.Controller sequencerSlider4 = controlP5.addMatrix("layer4sequencer", 8, 4, 10+(columnWidth*3), 240, int(columnWidth*0.92), 160);
  sequencerSlider4.setLabel("sequencer"); sequencerSlider4.moveTo(controlWindow,"Sequencer");
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  mapping tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  // interface mapping - column 1
  controlP5.Controller mappingToggle1 = controlP5.addToggle("mapping1",false,50+(columnWidth*0),265,20,20);
  mappingToggle1.setLabel("quad mapping"); mappingToggle1.moveTo(controlWindow,"Mapping");
  mappingToggle1.captionLabel().toUpperCase(false);
  
  controlP5.Controller bmappingToggle1 = controlP5.addToggle("bmapping1",false,50+(columnWidth*0),310,20,20);
  bmappingToggle1.setLabel("curved mapping"); bmappingToggle1.moveTo(controlWindow,"Mapping");
  bmappingToggle1.captionLabel().toUpperCase(false);
  
  
  // interface mapping - column 2
  controlP5.Controller mappingToggle2 = controlP5.addToggle("mapping2",false,50+(columnWidth*1),265,20,20);
  mappingToggle2.setLabel("mapping"); mappingToggle2.moveTo(controlWindow,"Mapping");
  mappingToggle2.captionLabel().toUpperCase(false);
  
  controlP5.Controller bmappingToggle2 = controlP5.addToggle("bmapping2",false,50+(columnWidth*1),310,20,20);
  bmappingToggle2.setLabel("curved mapping"); bmappingToggle2.moveTo(controlWindow,"Mapping");
  bmappingToggle2.captionLabel().toUpperCase(false);
  
  
  // interface mapping - column 3
  controlP5.Controller mappingToggle3 = controlP5.addToggle("mapping3",false,50+(columnWidth*2),265,20,20);
  mappingToggle3.setLabel("mapping"); mappingToggle3.moveTo(controlWindow,"Mapping");
  mappingToggle3.captionLabel().toUpperCase(false);
  
  controlP5.Controller bmappingToggle3 = controlP5.addToggle("bmapping3",false,50+(columnWidth*2),310,20,20);
  bmappingToggle3.setLabel("curved mapping"); bmappingToggle3.moveTo(controlWindow,"Mapping");
  bmappingToggle3.captionLabel().toUpperCase(false);

  
  // interface mapping - column 4
  controlP5.Controller mappingToggle4 = controlP5.addToggle("mapping4",false,50+(columnWidth*3),265,20,20);
  mappingToggle4.setLabel("mapping"); mappingToggle4.moveTo(controlWindow,"Mapping");
  mappingToggle4.captionLabel().toUpperCase(false);
  
  controlP5.Controller bmappingToggle4 = controlP5.addToggle("bmapping4",false,50+(columnWidth*3),310,20,20);
  bmappingToggle4.setLabel("berzier mapping"); bmappingToggle4.moveTo(controlWindow,"Mapping");
  bmappingToggle4.captionLabel().toUpperCase(false);
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  audio tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5.Controller layer1volumeSlider = controlP5.addSlider("layer1volume",0,1.0,0.0,10+(columnWidth*0),180,int(columnWidth*0.7),14);
  layer1volumeSlider.setLabel("volume"); layer1volumeSlider.moveTo(controlWindow,"Audio");
  layer1volumeSlider.captionLabel().toUpperCase(false);
  
  controlP5.Controller layer2volumeSlider = controlP5.addSlider("layer2volume",0,1.0,0.0,10+(columnWidth*1),180,int(columnWidth*0.7),14);
  layer2volumeSlider.setLabel("volume"); layer2volumeSlider.moveTo(controlWindow,"Audio");
  layer2volumeSlider.captionLabel().toUpperCase(false);
  
  controlP5.Controller layer3volumeSlider = controlP5.addSlider("layer3volume",0,1.0,0.0,10+(columnWidth*2),180,int(columnWidth*0.7),14);
  layer3volumeSlider.setLabel("volume"); layer3volumeSlider.moveTo(controlWindow,"Audio");
  layer3volumeSlider.captionLabel().toUpperCase(false);
  
  controlP5.Controller layer4volumeSlider = controlP5.addSlider("layer4volume",0,1.0,0.0,10+(columnWidth*3),180,int(columnWidth*0.7),14);
  layer4volumeSlider.setLabel("volume"); layer4volumeSlider.moveTo(controlWindow,"Audio");
  layer4volumeSlider.captionLabel().toUpperCase(false);
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  prefs tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5.Controller rootDirBut = controlP5.addButton("rootDirBut",0,10,200,85,14);
  rootDirBut.setLabel("root dir"); rootDirBut.moveTo(controlWindow,"Prefs");
  rootDirBut.captionLabel().toUpperCase(false);
  
  languageList = controlP5.addListBox("language",10,240,int(columnWidth*0.9),240);
  languageList.moveTo(controlWindow,"Prefs"); languageList.setItemHeight(16);
  languageList.captionLabel().toUpperCase(false); // languageList.captionLabel().setHeight(18);
  languageList.setLabel("language");
  languageList.addItem("English",0);
  languageList.addItem("Portuguese",1);
  languageList.addItem("French",2);
  languageList.addItem("German",3);
  languageList.addItem("Chinese",4);
  //languageList.addItem("Spanish",5);
  
  
  controlP5.Controller outputXposNumberBox = controlP5.addNumberbox("outputXpos",screenWidth,columnWidth,200,int(columnWidth*0.9),14);
  outputXposNumberBox.setLabel("output X position");
  outputXposNumberBox.captionLabel().toUpperCase(false);
  //controlP5.outputXposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
  //outputXposNumberBox.setDirection(controlP5.Controller.HORIZONTAL); // change the control direction to left/right
  outputXposNumberBox.moveTo(controlWindow,"Prefs");
  
  controlP5.Controller outputYposNumberBox = controlP5.addNumberbox("outputYpos",0,columnWidth,240,int(columnWidth*0.9),14);
  outputYposNumberBox.setLabel("output Y position");
  outputYposNumberBox.captionLabel().toUpperCase(false);
  //controlP5.outputYposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
  //outputYposNumberBox.setDirection(Controller.HORIZONTAL); // change the control direction to left/right
  outputYposNumberBox.moveTo(controlWindow,"Prefs");
  
  controlP5.Controller syphonToggle1 = controlP5.addToggle("syphonOutput",false,columnWidth,280,15,15);
  syphonToggle1.setLabel("Syphon output (Mac only)"); syphonToggle1.moveTo(controlWindow,"Prefs");
  
  outputResolutionList = controlP5.addListBox("outputResolution",columnWidth,330,int(columnWidth*0.9),320);
  outputResolutionList.moveTo(controlWindow,"Prefs"); outputResolutionList.setItemHeight(16);
  outputResolutionList.captionLabel().toUpperCase(false);
  outputResolutionList.setLabel("output resolution");
  outputResolutionList.addItem("240 x 180",0);
  outputResolutionList.addItem("320 x 240",1);
  outputResolutionList.addItem("640 x 480",2);
  outputResolutionList.addItem("800 x 600",3);
  outputResolutionList.addItem("1024 x 768",4);
  outputResolutionList.addItem("1280 x 720",5);
  outputResolutionList.addItem("1280 x 1024",6);
  outputResolutionList.addItem("1920 x 1080",7);
  outputResolutionList.addItem("1600 x 1200",8);
  outputResolutionList.addItem("1280 x 480 (2X 640 x 480)",9);
  outputResolutionList.addItem("1600 x 600 (2X 800 x 600)",10);
  outputResolutionList.addItem("2048 x 768 (2X 1024 x 768)",11);
  outputResolutionList.addItem("1920 x 480 (3X 640 x 480)",12);
  outputResolutionList.addItem("2400 x 600 (3X 800 x 600)",13);
  outputResolutionList.addItem("3072 x 768 (3X 1024 x 768)",14);
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  interface
  //  help tab
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  textHelp = controlP5.addTextarea("helpText",
  "Quase-Cinema Feijoada Remix 0.01\n"+
  "Alexandre Rangel, 2011\n"+
  "www.quasecinema.org\n\n\n"+
  "Shortcuts\n\n"+
  "F1 - F8: changes interface panels\n"+
  "1 - 4: selects layers 1 to 4\n"+
  "enter: toggle selected layer visibility on/off\n"+
  "i: marks in point for movie on the selected layer\n"+
  "o: marks out point for movie on the selected layer\n"+
  "I: clears in point for movie on the selected layer\n"+
  "O: clears out point for movie on the selected layer\n"+
  "d: selects root movie directory (with other folders inside)\n"+
  "r: randomize movie on selected layer:\n"+
  "M: randomize audio\n"+
  "t: toggles video scratch for selected layer\n"+
  "[ - ]: select quad-mapping plane\n"+
  "c: mapping control points visibility on/off\n",
  10,170,int(columnWidth*1.9),600);
  textHelp.setFont(ControlP5.grixel);
  textHelp.moveTo(controlWindow,"Help");
  
  QCtranslate();
  
} // end QC setupInterface
