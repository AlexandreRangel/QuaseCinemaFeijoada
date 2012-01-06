
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
  
  // layers opacity
  // slider 1
       if (channel==0 && number==2) { layerOpacity1 = value * 2; if(layerOpacity1==254){layerOpacity1=255;} controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==42) { layerOpacity2 = value * 2; if(layerOpacity2==254){layerOpacity2=255;} controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==85) { layerOpacity3 = value * 2; if(layerOpacity3==254){layerOpacity3=255;} controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==7) { layerOpacity4 = value * 2; if(layerOpacity4==254){layerOpacity4=255;} controlWindow.activateTab("Effects"); }
  
  // layers bpm visibility
  // knob 1
       if (channel==0 && number==14) { controlP5.controller("layer1bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==57) { controlP5.controller("layer2bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==94) { controlP5.controller("layer3bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==10) { controlP5.controller("layer4bpmVis").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  
  // layers bpm movie time
  // knob 2
       if (channel==0 && number==15) { controlP5.controller("layer1bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==58) { controlP5.controller("layer2bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==95) { controlP5.controller("layer3bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==1 && number==10) { controlP5.controller("layer4bpmTime").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  
  // layers bpm random movie
  // knob 3
       if (channel==0 && number==16) { controlP5.controller("layer1bpmMovie").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==59) { controlP5.controller("layer2bpmMovie").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==0 && number==96) { controlP5.controller("layer3bpmMovie").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  else if (channel==2 && number==10) { controlP5.controller("layer4bpmMovie").setValue(value * 2); controlWindow.activateTab("Rhythm"); }
  
  
  // layers contrast effect amount
  // slider 2
       if (channel==0 && number==3) { controlP5.controller("effectContrastLimit1").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==43) { controlP5.controller("effectContrastLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==86) { controlP5.controller("effectContrastLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==1 && number==7) { controlP5.controller("effectContrastLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  
  // layers saturation effect amount
  // slider 3
       if (channel==0 && number==4) { controlP5.controller("effectSaturationLimit1").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==50) { controlP5.controller("effectSaturationLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==87) { controlP5.controller("effectSaturationLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==2 && number==7) { controlP5.controller("effectSaturationLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  
  // layers hue effect amount
  // slider 4
       if (channel==0 && number==5) { controlP5.controller("effectHueLimit1").setValue(map(value,0,127,0,255)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==51) { controlP5.controller("effectHueLimit2").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==0 && number==88) { controlP5.controller("effectHueLimit3").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  else if (channel==3 && number==7) { controlP5.controller("effectHueLimit4").setValue(map(value,0,127,0,200)); controlWindow.activateTab("Effects"); }
  
  // layers red amount
  // slider 5
  if (channel==0 && number==6) {
    colorPicker1.setColorValue(color(map(value,0,127,0,255),green(colorPicker1.getColorValue()),blue(colorPicker1.getColorValue()),alpha(colorPicker1.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==52) {
    colorPicker2.setColorValue(color(map(value,0,127,0,255),green(colorPicker2.getColorValue()),blue(colorPicker2.getColorValue()),alpha(colorPicker2.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==89) {
    colorPicker3.setColorValue(color(map(value,0,127,0,255),green(colorPicker3.getColorValue()),blue(colorPicker3.getColorValue()),alpha(colorPicker3.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==4 && number==7) {
    colorPicker4.setColorValue(color(map(value,0,127,0,255),green(colorPicker4.getColorValue()),blue(colorPicker4.getColorValue()),alpha(colorPicker4.getColorValue())));
    controlWindow.activateTab("Effects");
  }
  
  // layers green amount
  // slider 5
  if (channel==0 && number==8) {
    colorPicker1.setColorValue(red(colorPicker1.getColorValue(),color(map(value,0,127,0,255)),blue(colorPicker1.getColorValue()),alpha(colorPicker1.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==53) {
    colorPicker2.setColorValue(red(colorPicker2.getColorValue(),color(map(value,0,127,0,255)),blue(colorPicker2.getColorValue()),alpha(colorPicker2.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==90) {
    colorPicker3.setColorValue(red(colorPicker3.getColorValue(),color(map(value,0,127,0,255)),blue(colorPicker3.getColorValue()),alpha(colorPicker3.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==5 && number==7) {
    colorPicker4.setColorValue(red(colorPicker4.getColorValue(),color(map(value,0,127,0,255)),blue(colorPicker4.getColorValue()),alpha(colorPicker4.getColorValue())));
    controlWindow.activateTab("Effects");
  }
  
  // layers blue amount
  // slider 5
  if (channel==0 && number==9) {
    colorPicker1.setColorValue(red(colorPicker1.getColorValue(),green(colorPicker1.getColorValue()),color(map(value,0,127,0,255)),alpha(colorPicker1.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==54) {
    colorPicker2.setColorValue(red(colorPicker2.getColorValue(),green(colorPicker2.getColorValue()),color(map(value,0,127,0,255)),alpha(colorPicker2.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==0 && number==91) {
    colorPicker3.setColorValue(red(colorPicker3.getColorValue(),green(colorPicker3.getColorValue()),color(map(value,0,127,0,255)),alpha(colorPicker3.getColorValue())));
    controlWindow.activateTab("Effects");
  } else if (channel==6 && number==7) {
    colorPicker4.setColorValue(red(colorPicker4.getColorValue(),green(colorPicker4.getColorValue()),color(map(value,0,127,0,255)),alpha(colorPicker4.getColorValue())));
    controlWindow.activateTab("Effects");
  }
  
  // layers speed
  // knob 8
       if (channel==0 && number==21) { controlP5.controller("layer1speed").setValue(map(value,0,127,-4.0,4.0)); scratch1=false; controlWindow.activateTab("default"); }
  else if (channel==0 && number==65) { controlP5.controller("layer2speed").setValue(map(value,0,127,-4.0,4.0)); scratch2=false; controlWindow.activateTab("default"); }
  else if (channel==0 && number==105) { controlP5.controller("layer3speed").setValue(map(value,0,127,-4.0,4.0)); scratch3=false; controlWindow.activateTab("default"); }
  else if (channel==7 && number==10) { controlP5.controller("layer4speed").setValue(map(value,0,127,-4.0,4.0)); scratch4=false; controlWindow.activateTab("default"); }
  
  // layers scratch
  // slider 8
       if (channel==0 && number==12) { scratch1 = true; scratchPos1 = int(map(value,0,127,layer1in,layer1out)); controlWindow.activateTab("default"); }
  else if (channel==0 && number==55) { scratch2 = true; scratchPos2 = int(map(value,0,127,layer2in,layer2out)); controlWindow.activateTab("default"); }
  else if (channel==0 && number==92) { scratch3 = true; scratchPos3 = int(map(value,0,127,layer3in,layer3out)); controlWindow.activateTab("default"); }
  else if (channel==7 && number==7) { scratch4 = true; scratchPos4 = int(map(value,0,127,layer4in,layer4out)); controlWindow.activateTab("default"); }
  
 
}
