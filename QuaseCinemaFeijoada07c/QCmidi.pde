
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
  if (channel==0 && number==23 && value==0) { layer1visibility = !layer1visibility; }
  else if (channel==0 && number==67 && value==0) { layer2visibility = !layer2visibility; }
  else if (channel==0 && number==107 && value==0) { layer3visibility = !layer3visibility; }
  else if (channel==0 && number==16 && value==0) { layer4visibility = !layer4visibility; }
 
 // layers opacity
 // slider 1
      if (channel==0 && number==2) { layerOpacity1 = value * 2; if(layerOpacity1==254){layerOpacity1=255;} cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==42) { layerOpacity2 = value * 2; if(layerOpacity2==254){layerOpacity2=255;} cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==85) { layerOpacity3 = value * 2; if(layerOpacity3==254){layerOpacity3=255;} cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==7) { layerOpacity4 = value * 2; if(layerOpacity4==254){layerOpacity4=255;} cp5.getTab("Effects").bringToFront(); }
 
 // layers bpm visibility
 // knob 1
      if (channel==0 && number==14) { cp5.controller("layer1bpmVis").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==0 && number==57) { cp5.controller("layer2bpmVis").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==0 && number==94) { cp5.controller("layer3bpmVis").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==0 && number==10) { cp5.controller("layer4bpmVis").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 
 // layers bpm movie time
 // knob 2
      if (channel==0 && number==15) { cp5.controller("layer1bpmTime").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==0 && number==58) { cp5.controller("layer2bpmTime").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==0 && number==95) { cp5.controller("layer3bpmTime").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 else if (channel==1 && number==10) { cp5.controller("layer4bpmTime").setValue(value * 2); cp5.getTab("Rhythm").bringToFront(); }
 
 // layers vertital position
 // knob 3
      if (channel==0 && number==16) { cp5.controller("posH1").setValue(1); cp5.controller("posH1value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==59) { cp5.controller("posH2").setValue(1); cp5.controller("posH2value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==96) { cp5.controller("posH3").setValue(1); cp5.controller("posH3value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==2 && number==10) { cp5.controller("posH4").setValue(1); cp5.controller("posH4value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }

 // layers horizontal position
 // knob 4
      if (channel==0 && number==17) { cp5.controller("posV1").setValue(1); cp5.controller("posV1value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==60) { cp5.controller("posV2").setValue(1); cp5.controller("posV2value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==97) { cp5.controller("posV3").setValue(1); cp5.controller("posV3value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==3 && number==10) { cp5.controller("posV4").setValue(1); cp5.controller("posV4value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }       
 
 // layers horizontal size
 // knob 5
      if (channel==0 && number==18) { cp5.controller("sizeH1").setValue(1); cp5.controller("sizeH1value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==61) { cp5.controller("sizeH2").setValue(1); cp5.controller("sizeH2value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==102) { cp5.controller("sizeH3").setValue(1); cp5.controller("sizeH3value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==4 && number==10) { cp5.controller("sizeH4").setValue(1); cp5.controller("sizeH4value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); } 

 // layers vertical size
 // knob 6
      if (channel==0 && number==19) { cp5.controller("sizeV1").setValue(1); cp5.controller("sizeV1value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==62) { cp5.controller("sizeV2").setValue(1); cp5.controller("sizeV2value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==103) { cp5.controller("sizeV3").setValue(1); cp5.controller("sizeV3value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==5 && number==10) { cp5.controller("sizeV4").setValue(1); cp5.controller("sizeV4value").setValue(map(value,0,127,-1.0,1.0)); cp5.getTab("Transform").bringToFront(); }   
 
 // layers X rotation
 // knob 7
      if (channel==0 && number==20) { cp5.controller("rotX1").setValue(1); cp5.controller("rotX1value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==63) { cp5.controller("rotX2").setValue(1); cp5.controller("rotX2value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==104) { cp5.controller("rotX3").setValue(1); cp5.controller("rotX3value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==6 && number==10) { cp5.controller("rotX4").setValue(1); cp5.controller("rotX4value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }   
 
 // layers Y rotation
 // knob 8
      if (channel==0 && number==21) { cp5.controller("rotY1").setValue(1); cp5.controller("rotY1value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==65) { cp5.controller("rotY2").setValue(1); cp5.controller("rotY2value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==105) { cp5.controller("rotY3").setValue(1); cp5.controller("rotY3value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==7 && number==10) { cp5.controller("rotY4").setValue(1); cp5.controller("rotY4value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }  
 
 // layers Z rotation
 // knob 9
      if (channel==0 && number==22) { cp5.controller("rotZ1").setValue(1); cp5.controller("rotZ1value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==66) { cp5.controller("rotZ2").setValue(1); cp5.controller("rotZ2value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==0 && number==106) { cp5.controller("rotZ3").setValue(1); cp5.controller("rotZ3value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 else if (channel==8 && number==10) { cp5.controller("rotZ4").setValue(1); cp5.controller("rotZ4value").setValue(map(value,0,127,-180,180)); cp5.getTab("Transform").bringToFront(); }
 
 // layers contrast effect amount
 // slider 2
      if (channel==0 && number==3) { cp5.controller("effectContrastLimit1").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==43) { cp5.controller("effectContrastLimit2").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==86) { cp5.controller("effectContrastLimit3").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==1 && number==7) { cp5.controller("effectContrastLimit4").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 
//  // layers saturation effect amount
//  // slider 3
//       if (channel==0 && number==4) { cp5.controller("effectSaturationLimit1").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==0 && number==50) { cp5.controller("effectSaturationLimit2").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==0 && number==87) { cp5.controller("effectSaturationLimit3").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==2 && number==7) { cp5.controller("effectSaturationLimit4").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 
 // layers anaglyph effect amount
 // slider 3
      if (channel==0 && number==4) { cp5.controller("effectAnaglyphAmount1").setValue(map(value,0,127,-64,64)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==50) { cp5.controller("effectAnaglyphAmount2").setValue(map(value,0,127,-64,64)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==87) { cp5.controller("effectAnaglyphAmount3").setValue(map(value,0,127,-64,64)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==2 && number==7) { cp5.controller("effectAnaglyphAmount4").setValue(map(value,0,127,-64,64)); cp5.getTab("Effects").bringToFront(); }
 
//  // layers hue effect amount
//  // slider 4
//       if (channel==0 && number==5) { cp5.controller("effectHueLimit1").setValue(map(value,0,127,0,255)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==0 && number==51) { cp5.controller("effectHueLimit2").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==0 && number==88) { cp5.controller("effectHueLimit3").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
//  else if (channel==3 && number==7) { cp5.controller("effectHueLimit4").setValue(map(value,0,127,0,200)); cp5.getTab("Effects").bringToFront(); }
 
 // luma key effect amount
 // slider 4
      if (channel==0 && number==5) { cp5.controller("effectLumaKeyAmount1").setValue(map(value,0,127,0,255)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==51) { cp5.controller("effectLumaKeyAmount2").setValue(map(value,0,127,0,255)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==0 && number==88) { cp5.controller("effectLumaKeyAmount3").setValue(map(value,0,127,0,255)); cp5.getTab("Effects").bringToFront(); }
 else if (channel==3 && number==7) { cp5.controller("effectLumaKeyAmount4").setValue(map(value,0,127,0,255)); cp5.getTab("Effects").bringToFront(); }
 
 
 
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
 

}
