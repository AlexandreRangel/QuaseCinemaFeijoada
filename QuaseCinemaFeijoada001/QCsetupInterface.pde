void QCsetupInterface() {
  
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //  controlP5 setup
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("Quase-Cinema Feijoada VJ 0.01",0,0,1024,748); 
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(20));
  // for continuous update use ControlWindow.NORMAL  to update a control
  // window only when it is in focus, use ControlWindow.ECONOMIC is the default update value.
  //controlWindow.setUpdateMode(ControlWindow.NORMAL);
  controlWindow.setUpdateMode(ControlWindow.NORMAL);
    
  cc = new MyCanvas(); // create a control window canvas
  cc.pre(); // use cc.post(); to draw on top of the controllers.
  controlWindow.addCanvas(cc);
  
  // tabs
  controlWindow.tab("default").setLabel("  Main  ");
  controlWindow.addTab("Effects"); controlWindow.tab("Effects").setLabel("  Effects  ");
  controlWindow.addTab("Rhythm"); controlWindow.tab("Rhythm").setLabel("  Rhythm  ");
  controlWindow.addTab("Sequencer"); controlWindow.tab("Sequencer").setLabel("  Sequencer  ");
  controlWindow.addTab("Mapping"); controlWindow.tab("Mapping").setLabel("  Mapping  ");
  controlWindow.addTab("3D"); controlWindow.tab("3D").setLabel("  3D  ");
  controlWindow.addTab("Playlist"); controlWindow.tab("Playlist").setLabel("  Playlist  ");
  controlWindow.addTab("Prefs"); controlWindow.tab("Prefs").setLabel("  Prefs  ");
  
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
  
  controlP5.Controller invertToggle1 = controlP5.addToggle("effectInvert1",false,10+(columnWidth*0),265,20,20);
  invertToggle1.setLabel("invert"); invertToggle1.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle1 = controlP5.addToggle("effectPosterize1",false,50+(columnWidth*0),265,20,20);
  posterizeToggle1.setLabel("poster"); posterizeToggle1.moveTo(controlWindow,"Effects");
  
  
  // interface effects - column 2
  colorPicker2 = controlP5.addColorPicker("layer2color",10+(columnWidth*1),200,int(columnWidth*0.9),20);
  colorPicker2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle2 = controlP5.addToggle("effectInvert2",false,10+(columnWidth*1),265,20,20);
  invertToggle2.setLabel("invert"); invertToggle2.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle2 = controlP5.addToggle("effectPosterize2",false,50+(columnWidth*1),265,20,20);
  posterizeToggle2.setLabel("poster"); posterizeToggle2.moveTo(controlWindow,"Effects");
  
  
  // interface effects - column 3
  colorPicker3 = controlP5.addColorPicker("layer3color",10+(columnWidth*2),200,int(columnWidth*0.9),20);
  colorPicker3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle3 = controlP5.addToggle("effectInvert3",false,10+(columnWidth*2),265,20,20);
  invertToggle3.setLabel("invert"); invertToggle3.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle3 = controlP5.addToggle("effectPosterize3",false,50+(columnWidth*2),265,20,20);
  posterizeToggle3.setLabel("poster"); posterizeToggle3.moveTo(controlWindow,"Effects");

  
  // interface effects - column 4
  colorPicker4 = controlP5.addColorPicker("layer4color",10+(columnWidth*3),200,int(columnWidth*0.9),20);
  colorPicker4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller invertToggle4 = controlP5.addToggle("effectInvert4",false,10+(columnWidth*3),265,20,20);
  invertToggle4.setLabel("invert"); invertToggle4.moveTo(controlWindow,"Effects");
  
  controlP5.Controller posterizeToggle4 = controlP5.addToggle("effectPosterize4",false,50+(columnWidth*3),265,20,20);
  posterizeToggle4.setLabel("poster"); posterizeToggle4.moveTo(controlWindow,"Effects");
  
  
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
  
} // end QC setupInterface
