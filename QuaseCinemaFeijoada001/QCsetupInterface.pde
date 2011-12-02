void QCsetupInterface() {
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  controlP5 setup
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("Quase-Cinema Feijoada Remix 0.01",0,0,1024,748); 
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(20));
  // for continuous update use ControlWindow.NORMAL  to update a control
  // window only when it is in focus, use ControlWindow.ECONOMIC is the default update value.
  //controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.frameRate(30);  
  
  controlP5.setColorForeground(#0AA000);
  controlP5.setColorBackground(#343434);
  controlP5.setColorLabel(#B7B7B7);
  controlP5.setColorValue(#E5E5E5);
  controlP5.setColorActive(#00FF00);
   
  cc = new MyCanvas(); // create a control window canvas
  cc.pre(); // use cc.post(); to draw on top of the controllers.
  controlWindow.addCanvas(cc);
  
  // tabs
  controlWindow.tab("default").setLabel("  Main  ");
  controlWindow.tab("default").setId(1);
  controlWindow.addTab("Effects"); controlWindow.tab("Effects").setLabel("  Effects  ");
  controlWindow.tab("Effects").setId(2);
  controlWindow.addTab("Rhythm"); controlWindow.tab("Rhythm").setLabel("  Rhythm  ");
  controlWindow.tab("Rhythm").setId(3);
  controlWindow.addTab("Sequencer"); controlWindow.tab("Sequencer").setLabel("  Sequencer  ");
  controlWindow.tab("Sequencer").setId(4);
  controlWindow.addTab("Mapping"); controlWindow.tab("Mapping").setLabel("  Mapping  ");
  controlWindow.tab("Mapping").setId(5);
  controlWindow.addTab("3D"); controlWindow.tab("3D").setLabel("  3D  ");
  controlWindow.tab("3D").setId(6);
  controlWindow.addTab("Playlist"); controlWindow.tab("Playlist").setLabel("  Playlist  ");
  controlWindow.tab("Playlist").setId(7);
  controlWindow.addTab("Audio"); controlWindow.tab("Audio").setLabel(" Audio  ");
  controlWindow.tab("Audio").setId(8);
  controlWindow.addTab("Prefs"); controlWindow.tab("Prefs").setLabel("  Prefs  ");
  controlWindow.tab("Prefs").setId(9);
  controlWindow.addTab("Help"); controlWindow.tab("Help").setLabel("  Help  ");
  controlWindow.tab("Help").setId(10);
  
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
  
  // interface main - column 1
  controlP5.Controller visibilityToggle1 = controlP5.addToggle("layer1visibility",true,180+(columnWidth*0),24,20,20);
  visibilityToggle1.setLabel("visible"); visibilityToggle1.moveTo(controlWindow,"global");
  
  layerContentButton1 = controlP5.addRadioButton("layerContent1",180+(columnWidth*0),109);
  layerContentButton1.setNoneSelectedAllowed(false); layerContentButton1.setItemsPerRow(1);
  layerContentButton1.addItem("Movie1",0); layerContentButton1.activate(0);
  layerContentButton1.addItem("Image1",1);
  layerContentButton1.addItem("Camera1",2);
  layerContentButton1.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider1 = controlP5.addSlider("layer1playback",0,1.0,0.0,10+(columnWidth*0),200,int(columnWidth*0.7),14);
  playbackSlider1.setLabel("playback"); playbackSlider1.moveTo(controlWindow);
  
  controlP5.Controller mySlider = controlP5.addSlider("layer1speed",0,5.0,1.0,10+(columnWidth*0),220,int(columnWidth*0.7),14);
  mySlider.setLabel("speed"); mySlider.moveTo(controlWindow);
  
  // interface main - column 2
  controlP5.Controller visibilityToggle2 = controlP5.addToggle("layer2visibility",false,180+(columnWidth*1),24,20,20);
  visibilityToggle2.setLabel("visible"); visibilityToggle2.moveTo(controlWindow,"global");
  
  layerContentButton2 = controlP5.addRadioButton("layerContent2",180+(columnWidth*1),109);
  layerContentButton2.setNoneSelectedAllowed(false); layerContentButton2.setItemsPerRow(1);
  layerContentButton2.addItem("Movie2",0); layerContentButton2.activate(0);
  layerContentButton2.addItem("Image2",1);
  layerContentButton2.addItem("Camera2",2);
  layerContentButton2.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider2 = controlP5.addSlider("layer2playback",0,1.0,0.0,10+(columnWidth*1),200,int(columnWidth*0.7),14);
  playbackSlider2.setLabel("playback"); playbackSlider2.moveTo(controlWindow);
  
  controlP5.Controller speedSlider2 = controlP5.addSlider("layer2speed",0,5.0,1.0,10+(columnWidth*1),220,int(columnWidth*0.7),14);
  speedSlider2.setLabel("speed"); speedSlider2.moveTo(controlWindow);
  
  
  // interface main - column 3
  controlP5.Controller visibilityToggle3 = controlP5.addToggle("layer3visibility",false,180+(columnWidth*2),24,20,20);
  visibilityToggle3.setLabel("visible"); visibilityToggle3.moveTo(controlWindow,"global");
  
  layerContentButton3 = controlP5.addRadioButton("layerContent3",180+(columnWidth*2),109);
  layerContentButton3.setNoneSelectedAllowed(false); layerContentButton3.setItemsPerRow(1);
  layerContentButton3.addItem("Movie3",0); layerContentButton3.activate(0);
  layerContentButton3.addItem("Image3",1);
  layerContentButton3.addItem("Camera3",2);
  layerContentButton3.moveTo(controlWindow,"global");
  
  controlP5.Controller playbackSlider3 = controlP5.addSlider("layer3playback",0,1.0,0.0,10+(columnWidth*2),200,int(columnWidth*0.7),14);
  playbackSlider3.setLabel("playback"); playbackSlider3.moveTo(controlWindow);
  
  controlP5.Controller speedSlider3 = controlP5.addSlider("layer3speed",0,5.0,1.0,10+(columnWidth*2),220,int(columnWidth*0.7),14);
  speedSlider3.setLabel("speed"); speedSlider3.moveTo(controlWindow);
  
  
  // interface main - column 4
  controlP5.Controller visibilityToggle4 = controlP5.addToggle("layer4visibility",false,180+(columnWidth*3),24,20,20);
  visibilityToggle4.setLabel("visible"); visibilityToggle4.moveTo(controlWindow,"global");
  
  layerContentButton4 = controlP5.addRadioButton("layerContent4",180+(columnWidth*3),109);
  layerContentButton4.setNoneSelectedAllowed(false); layerContentButton4.setItemsPerRow(1);
  layerContentButton4.addItem("Movie4",0); layerContentButton4.activate(0);
  layerContentButton4.addItem("Image4",1);
  layerContentButton4.addItem("Camera4",2);
  layerContentButton4.moveTo(controlWindow,"global");
  
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
  
  controlP5.Controller invertToggle1 = controlP5.addToggle("effectInvert1",false,10+(columnWidth*0),265,20,20);
  invertToggle1.setLabel("invert"); invertToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle1 = controlP5.addToggle("effectPosterize1",false,50+(columnWidth*0),265,20,20);
  posterizeToggle1.setLabel("poster"); posterizeToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRgToggle1 = controlP5.addToggle("effectRG1",false,10+(columnWidth*0),315,20,20);
  effectRgToggle1.setLabel("R -> G"); effectRgToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle1 = controlP5.addToggle("effectRB1",false,50+(columnWidth*0),315,20,20);
  effectRbToggle1.setLabel("R -> B"); effectRbToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle1 = controlP5.addToggle("effectBG1",false,90+(columnWidth*0),315,20,20);
  effectGbToggle1.setLabel("G -> B"); effectGbToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle1 = controlP5.addToggle("effectBW1",false,10+(columnWidth*0),355,20,20);
  effectBWToggle1.setLabel("BW"); effectBWToggle1.moveTo(controlWindow,"Effects");
  controlP5.Controller effectBWlimit1slider = controlP5.addSlider("effectBWlimit1",0,255,127,40+(columnWidth*0),355,int(columnWidth*0.7),12);
  effectBWlimit1slider.setLabel("limit"); effectBWlimit1slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectContrastToggle1 = controlP5.addToggle("effectContrast1",false,10+(columnWidth*0),395,20,20);
  effectContrastToggle1.setLabel("Contrast"); effectContrastToggle1.moveTo(controlWindow,"Effects");
  controlP5.Controller effectContrastLimit1slider = controlP5.addSlider("effectContrastLimit1",0,200,0,40+(columnWidth*0),395,int(columnWidth*0.7),12);
  effectContrastLimit1slider.setLabel("amount"); effectContrastLimit1slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectSaturationToggle1 = controlP5.addToggle("effectSaturation1",false,10+(columnWidth*0),435,20,20);
  effectSaturationToggle1.setLabel("Saturation"); effectSaturationToggle1.moveTo(controlWindow,"Effects");
  controlP5.Controller effectSaturationLimit1slider = controlP5.addSlider("effectSaturationLimit1",0,256,0,40+(columnWidth*0),435,int(columnWidth*0.7),12);
  effectSaturationLimit1slider.setLabel("amount"); effectSaturationLimit1slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectHueToggle1 = controlP5.addToggle("effectHue1",false,10+(columnWidth*0),475,20,20);
  effectHueToggle1.setLabel("Hue"); effectHueToggle1.moveTo(controlWindow,"Effects");
  controlP5.Controller effectHueLimit1slider = controlP5.addSlider("effectHueLimit1",0,256,0,40+(columnWidth*0),475,int(columnWidth*0.7),12);
  effectHueLimit1slider.setLabel("amount"); effectHueLimit1slider.moveTo(controlWindow,"Effects");
  
  layerBlendButton1 = controlP5.addRadioButton("layerBlend1",10+(columnWidth*0),600);
  layerBlendButton1.setNoneSelectedAllowed(false); layerBlendButton1.setItemsPerRow(1);
  layerBlendButton1.addItem("Normal",0); layerBlendButton1.activate(0);
  layerBlendButton1.addItem("Lightest",1);
  layerBlendButton1.addItem("Add",2);
  layerBlendButton1.addItem("Darkest",3);
  layerBlendButton1.addItem("Subtract",4);
  layerBlendButton1.moveTo(controlWindow,"Effects");
  
  // interface effects - column 2
  
  colorPicker2 = controlP5.addColorPicker("layer2color",10+(columnWidth*1),200,int(columnWidth*0.9),20);
  colorPicker2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle2 = controlP5.addToggle("effectInvert2",false,10+(columnWidth*1),265,20,20);
  invertToggle2.setLabel("invert"); invertToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle2 = controlP5.addToggle("effectPosterize2",false,50+(columnWidth*1),265,20,20);
  posterizeToggle2.setLabel("poster"); posterizeToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRgToggle2 = controlP5.addToggle("effectRG2",false,10+(columnWidth*1),315,20,20);
  effectRgToggle2.setLabel("R -> G"); effectRgToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle2 = controlP5.addToggle("effectRB2",false,50+(columnWidth*1),315,20,20);
  effectRbToggle2.setLabel("R -> B"); effectRbToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle2 = controlP5.addToggle("effectBG2",false,90+(columnWidth*1),315,20,20);
  effectGbToggle2.setLabel("G -> B"); effectGbToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle2 = controlP5.addToggle("effectBW2",false,10+(columnWidth*1),355,20,20);
  effectBWToggle2.setLabel("BW"); effectBWToggle2.moveTo(controlWindow,"Effects");
  controlP5.Controller effectBWlimit2slider = controlP5.addSlider("effectBWlimit2",0,255,127,50+(columnWidth*1),355,int(columnWidth*0.6),12);
  effectBWlimit2slider.setLabel("limit"); effectBWlimit2slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectContrastToggle2 = controlP5.addToggle("effectContrast2",false,10+(columnWidth*1),395,20,20);
  effectContrastToggle2.setLabel("Contrast"); effectContrastToggle2.moveTo(controlWindow,"Effects");
  controlP5.Controller effectContrastLimit2slider = controlP5.addSlider("effectContrastLimit2",0,200,0,40+(columnWidth*1),395,int(columnWidth*0.7),12);
  effectContrastLimit2slider.setLabel("amount"); effectContrastLimit2slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectSaturationToggle2 = controlP5.addToggle("effectSaturation2",false,10+(columnWidth*1),435,20,20);
  effectSaturationToggle2.setLabel("Saturation"); effectSaturationToggle2.moveTo(controlWindow,"Effects");
  controlP5.Controller effectSaturationLimit2slider = controlP5.addSlider("effectSaturationLimit2",0,256,0,40+(columnWidth*1),435,int(columnWidth*0.7),12);
  effectSaturationLimit2slider.setLabel("amount"); effectSaturationLimit2slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectHueToggle2 = controlP5.addToggle("effectHue2",false,10+(columnWidth*1),475,20,20);
  effectHueToggle2.setLabel("Hue"); effectHueToggle2.moveTo(controlWindow,"Effects");
  controlP5.Controller effectHueLimit2slider = controlP5.addSlider("effectHueLimit2",0,256,0,40+(columnWidth*1),475,int(columnWidth*0.7),12);
  effectHueLimit2slider.setLabel("amount"); effectHueLimit2slider.moveTo(controlWindow,"Effects");
  
  // interface effects - column 3
  
  colorPicker3 = controlP5.addColorPicker("layer3color",10+(columnWidth*2),200,int(columnWidth*0.9),20);
  colorPicker3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle3 = controlP5.addToggle("effectInvert3",false,10+(columnWidth*2),265,20,20);
  invertToggle3.setLabel("invert"); invertToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle3 = controlP5.addToggle("effectPosterize3",false,50+(columnWidth*2),265,20,20);
  posterizeToggle3.setLabel("poster"); posterizeToggle3.moveTo(controlWindow,"Effects");

  controlP5.Controller effectRgToggle3 = controlP5.addToggle("effectRG3",false,10+(columnWidth*2),315,20,20);
  effectRgToggle3.setLabel("R -> G"); effectRgToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle3 = controlP5.addToggle("effectRB3",false,50+(columnWidth*2),315,20,20);
  effectRbToggle3.setLabel("R -> B"); effectRbToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle3 = controlP5.addToggle("effectBG3",false,90+(columnWidth*2),315,20,20);
  effectGbToggle3.setLabel("G -> B"); effectGbToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle3 = controlP5.addToggle("effectBW3",false,10+(columnWidth*2),355,20,20);
  effectBWToggle3.setLabel("BW"); effectBWToggle3.moveTo(controlWindow,"Effects");
  controlP5.Controller effectBWlimit3slider = controlP5.addSlider("effectBWlimit3",0,255,127,50+(columnWidth*2),355,int(columnWidth*0.6),12);
  effectBWlimit3slider.setLabel("limit"); effectBWlimit3slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectContrastToggle3 = controlP5.addToggle("effectContrast3",false,10+(columnWidth*2),395,20,20);
  effectContrastToggle3.setLabel("Contrast"); effectContrastToggle3.moveTo(controlWindow,"Effects");
  controlP5.Controller effectContrastLimit3slider = controlP5.addSlider("effectContrastLimit3",0,200,0,40+(columnWidth*2),395,int(columnWidth*0.7),12);
  effectContrastLimit3slider.setLabel("amount"); effectContrastLimit3slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectSaturationToggle3 = controlP5.addToggle("effectSaturation3",false,10+(columnWidth*2),435,20,20);
  effectSaturationToggle3.setLabel("Saturation"); effectSaturationToggle3.moveTo(controlWindow,"Effects");
  controlP5.Controller effectSaturationLimit3slider = controlP5.addSlider("effectSaturationLimit3",0,256,0,40+(columnWidth*2),435,int(columnWidth*0.7),12);
  effectSaturationLimit3slider.setLabel("amount"); effectSaturationLimit3slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectHueToggle3 = controlP5.addToggle("effectHue3",false,10+(columnWidth*2),475,20,20);
  effectHueToggle3.setLabel("Hue"); effectHueToggle3.moveTo(controlWindow,"Effects");
  controlP5.Controller effectHueLimit3slider = controlP5.addSlider("effectHueLimit3",0,256,0,40+(columnWidth*2),475,int(columnWidth*0.7),12);
  effectHueLimit3slider.setLabel("amount"); effectHueLimit3slider.moveTo(controlWindow,"Effects");
  
  
  // interface effects - column 4
  
  colorPicker4 = controlP5.addColorPicker("layer4color",10+(columnWidth*3),200,int(columnWidth*0.9),20);
  colorPicker4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle4 = controlP5.addToggle("effectInvert4",false,10+(columnWidth*3),265,20,20);
  invertToggle4.setLabel("invert"); invertToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle4 = controlP5.addToggle("effectPosterize4",false,50+(columnWidth*3),265,20,20);
  posterizeToggle4.setLabel("poster"); posterizeToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRgToggle4 = controlP5.addToggle("effectRG4",false,10+(columnWidth*3),315,20,20);
  effectRgToggle4.setLabel("R -> G"); effectRgToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectRbToggle4 = controlP5.addToggle("effectRB4",false,50+(columnWidth*3),315,20,20);
  effectRbToggle4.setLabel("R -> B"); effectRbToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectGbToggle4 = controlP5.addToggle("effectBG4",false,90+(columnWidth*3),315,20,20);
  effectGbToggle4.setLabel("G -> B"); effectGbToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectBWToggle4 = controlP5.addToggle("effectBW4",false,10+(columnWidth*3),355,20,20);
  effectBWToggle4.setLabel("BW"); effectBWToggle4.moveTo(controlWindow,"Effects");
  controlP5.Controller effectBWlimit4slider = controlP5.addSlider("effectBWlimit4",0,255,127,50+(columnWidth*3),355,int(columnWidth*0.6),12);
  effectBWlimit4slider.setLabel("limit"); effectBWlimit4slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectContrastToggle4 = controlP5.addToggle("effectContrast4",false,10+(columnWidth*3),395,20,20);
  effectContrastToggle4.setLabel("Contrast"); effectContrastToggle4.moveTo(controlWindow,"Effects");
  controlP5.Controller effectContrastLimit4slider = controlP5.addSlider("effectContrastLimit4",0,200,0,40+(columnWidth*3),395,int(columnWidth*0.7),12);
  effectContrastLimit4slider.setLabel("amount"); effectContrastLimit4slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectSaturationToggle4 = controlP5.addToggle("effectSaturation4",false,10+(columnWidth*3),435,20,20);
  effectSaturationToggle4.setLabel("Saturation"); effectSaturationToggle4.moveTo(controlWindow,"Effects");
  controlP5.Controller effectSaturationLimit4slider = controlP5.addSlider("effectSaturationLimit4",0,256,0,40+(columnWidth*3),435,int(columnWidth*0.7),12);
  effectSaturationLimit4slider.setLabel("amount"); effectSaturationLimit4slider.moveTo(controlWindow,"Effects");
  
  controlP5.Controller effectHueToggle4 = controlP5.addToggle("effectHue4",false,10+(columnWidth*3),475,20,20);
  effectHueToggle4.setLabel("Hue"); effectHueToggle4.moveTo(controlWindow,"Effects");
  controlP5.Controller effectHueLimit4slider = controlP5.addSlider("effectHueLimit4",0,256,0,40+(columnWidth*3),475,int(columnWidth*0.7),12);
  effectHueLimit4slider.setLabel("amount"); effectHueLimit4slider.moveTo(controlWindow,"Effects");
  
  //
  // interface
  // bpm tab
  //
  
  // interface bpm - column 1
  controlP5.Controller bpmVisSlider1 = controlP5.addSlider("layer1bpmVis",0,240,0,10+(columnWidth*0),210,int(columnWidth*0.7),14);
  bpmVisSlider1.setLabel("bpm vis"); bpmVisSlider1.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmTimeSlider1 = controlP5.addSlider("layer1bpmTime",0,240,0,10+(columnWidth*0),235,int(columnWidth*0.7),14);
  bpmTimeSlider1.setLabel("bpm time"); bpmTimeSlider1.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmMovieSlider1 = controlP5.addSlider("layer1bpmMovie",0,240,0,10+(columnWidth*0),260,int(columnWidth*0.7),14);
  bpmMovieSlider1.setLabel("bpm movie"); bpmMovieSlider1.moveTo(controlWindow,"Rhythm");
  
  // interface bpm - column 2  
  controlP5.Controller bpmVisSlider2 = controlP5.addSlider("layer2bpmVis",0,240,0,10+(columnWidth*1),210,int(columnWidth*0.7),14);
  bpmVisSlider2.setLabel("bpm vis"); bpmVisSlider2.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmTimeSlider2 = controlP5.addSlider("layer2bpmTime",0,240,0,10+(columnWidth*1),235,int(columnWidth*0.7),14);
  bpmTimeSlider2.setLabel("bpm time"); bpmTimeSlider2.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmMovieSlider2 = controlP5.addSlider("layer2bpmMovie",0,240,0,10+(columnWidth*1),260,int(columnWidth*0.7),14);
  bpmMovieSlider2.setLabel("bpm movie"); bpmMovieSlider2.moveTo(controlWindow,"Rhythm");
  
  
  // interface bpm - column 3
  controlP5.Controller bpmVisSlider3 = controlP5.addSlider("layer3bpmVis",0,240,0,10+(columnWidth*2),210,int(columnWidth*0.7),14);
  bpmVisSlider3.setLabel("bpm vis"); bpmVisSlider3.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmTimeSlider3 = controlP5.addSlider("layer3bpmTime",0,240,0,10+(columnWidth*2),235,int(columnWidth*0.7),14);
  bpmTimeSlider3.setLabel("bpm time"); bpmTimeSlider3.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmMovieSlider3 = controlP5.addSlider("layer3bpmMovie",0,240,0,10+(columnWidth*2),260,int(columnWidth*0.7),14);
  bpmMovieSlider3.setLabel("bpm movie"); bpmMovieSlider3.moveTo(controlWindow,"Rhythm");
  
  
  // interface bpm - column 4
  controlP5.Controller bpmVisSlider4 = controlP5.addSlider("layer4bpmVis",0,240,0,10+(columnWidth*3),210,int(columnWidth*0.7),14);
  bpmVisSlider4.setLabel("bpm vis"); bpmVisSlider4.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmTimeSlider4 = controlP5.addSlider("layer4bpmTime",0,240,0,10+(columnWidth*3),235,int(columnWidth*0.7),14);
  bpmTimeSlider4.setLabel("bpm time"); bpmTimeSlider4.moveTo(controlWindow,"Rhythm");
  
  controlP5.Controller bpmMovieSlider4 = controlP5.addSlider("layer4bpmMovie",0,240,0,10+(columnWidth*3),260,int(columnWidth*0.7),14);
  bpmMovieSlider4.setLabel("bpm movie"); bpmMovieSlider4.moveTo(controlWindow,"Rhythm");
  
  
  //
  // interface
  // sequencer tab
  //
  
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
  
  
  //
  // interface
  // mapping tab
  //
  
  // interface mapping - column 1
  controlP5.Controller mappingToggle1 = controlP5.addToggle("mapping1",false,50+(columnWidth*0),265,20,20);
  mappingToggle1.setLabel("quad mapping"); mappingToggle1.moveTo(controlWindow,"Mapping");
  
  controlP5.Controller bmappingToggle1 = controlP5.addToggle("bmapping1",false,50+(columnWidth*0),300,20,20);
  bmappingToggle1.setLabel("berzier mapping"); bmappingToggle1.moveTo(controlWindow,"Mapping");
  
  
  // interface mapping - column 2
  controlP5.Controller mappingToggle2 = controlP5.addToggle("mapping2",false,50+(columnWidth*1),265,20,20);
  mappingToggle2.setLabel("mapping"); mappingToggle2.moveTo(controlWindow,"Mapping");
  
  controlP5.Controller bmappingToggle2 = controlP5.addToggle("bmapping2",false,50+(columnWidth*1),300,20,20);
  bmappingToggle2.setLabel("berzier mapping"); bmappingToggle2.moveTo(controlWindow,"Mapping");
  
  
  // interface mapping - column 3
  controlP5.Controller mappingToggle3 = controlP5.addToggle("mapping3",false,50+(columnWidth*2),265,20,20);
  mappingToggle3.setLabel("mapping"); mappingToggle3.moveTo(controlWindow,"Mapping");
  
  controlP5.Controller bmappingToggle3 = controlP5.addToggle("bmapping3",false,50+(columnWidth*2),300,20,20);
  bmappingToggle3.setLabel("berzier mapping"); bmappingToggle3.moveTo(controlWindow,"Mapping");

  
  // interface mapping - column 4
  controlP5.Controller mappingToggle4 = controlP5.addToggle("mapping4",false,50+(columnWidth*3),265,20,20);
  mappingToggle4.setLabel("mapping"); mappingToggle4.moveTo(controlWindow,"Mapping");
  
  controlP5.Controller bmappingToggle4 = controlP5.addToggle("bmapping4",false,50+(columnWidth*3),300,20,20);
  bmappingToggle4.setLabel("berzier mapping"); bmappingToggle4.moveTo(controlWindow,"Mapping");
  
  
  //
  // audio
  // prefs tab
  //
  
  controlP5.Controller layer1volumeSlider = controlP5.addSlider("layer1volume",0,1.0,0.0,10+(columnWidth*0),180,int(columnWidth*0.7),14);
  layer1volumeSlider.setLabel("volume1"); layer1volumeSlider.moveTo(controlWindow,"Audio");
  
  controlP5.Controller layer2volumeSlider = controlP5.addSlider("layer2volume",0,1.0,0.0,10+(columnWidth*1),180,int(columnWidth*0.7),14);
  layer2volumeSlider.setLabel("volume2"); layer2volumeSlider.moveTo(controlWindow,"Audio");
  
  controlP5.Controller layer3volumeSlider = controlP5.addSlider("layer3volume",0,1.0,0.0,10+(columnWidth*2),180,int(columnWidth*0.7),14);
  layer3volumeSlider.setLabel("volume3"); layer3volumeSlider.moveTo(controlWindow,"Audio");
  
  controlP5.Controller layer4volumeSlider = controlP5.addSlider("layer4volume",0,1.0,0.0,10+(columnWidth*3),180,int(columnWidth*0.7),14);
  layer4volumeSlider.setLabel("volume4"); layer4volumeSlider.moveTo(controlWindow,"Audio");
  
  
  //
  // interface
  // prefs tab
  //
  
  outputResolutionList = controlP5.addListBox("outputResolution",10,200,int(columnWidth*0.9),240);
  outputResolutionList.setLabel("output resolution");
  outputResolutionList.moveTo(controlWindow,"Prefs");
  
  outputResolutionList.addItem("240 x 180",0);
  outputResolutionList.addItem("320 x 240",1);
  outputResolutionList.addItem("640 x 480",2);
  outputResolutionList.addItem("800 x 600",3);
  outputResolutionList.addItem("1024 x 768",4);
  outputResolutionList.addItem("1280 x 720",5);
  outputResolutionList.addItem("1280 x 1024",6);
  outputResolutionList.addItem("1920 x 1080",7);
  outputResolutionList.addItem("1600 x 1200",8);
  outputResolutionList.addItem("1280 x 480, dual 640 x 480)",9);
  outputResolutionList.addItem("1600 x 600, dual 800 x 600)",10);
  outputResolutionList.addItem("2048 x 768, dual 1024 x 768)",11);
  outputResolutionList.addItem("1920 x 480, triple 640 x 480)",12);
  outputResolutionList.addItem("2400 x 600, triple 800 x 600)",13);
  outputResolutionList.addItem("3072 x 768, triple 1024 x 768)",14);
  
  controlP5.Controller outputXposNumberBox = controlP5.addNumberbox("outputXpos",screenWidth,columnWidth,200,int(columnWidth*0.9),14);
  //controlP5.outputXposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
  //outputXposNumberBox.setDirection(controlP5.Controller.HORIZONTAL); // change the control direction to left/right
  outputXposNumberBox.moveTo(controlWindow,"Prefs");
  
  controlP5.Controller outputYposNumberBox = controlP5.addNumberbox("outputYpos",0,columnWidth,240,int(columnWidth*0.9),14);
  //controlP5.outputYposNumberBox.setMultiplier(1); // set the sensitifity of the numberbox
  //outputYposNumberBox.setDirection(Controller.HORIZONTAL); // change the control direction to left/right
  outputYposNumberBox.moveTo(controlWindow,"Prefs");
  
} // end QC setupInterface
