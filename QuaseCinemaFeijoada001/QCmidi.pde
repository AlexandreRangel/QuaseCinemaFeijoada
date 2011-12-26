
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  MIDI events
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void controllerChange(int channel, int number, int value) {
// Receive a controllerChange
  println("\n --- Midi Controller Change ---");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  //
  // Korg Nano Kontrol
  //
  
  // layers bpm visibility
//  if (channel==0 && number==23 && value==0) { layer1visibility = !layer1visibility; }
//  else if (channel==0 && number==67 && value==0) { layer2visibility = !layer2visibility; }
//  else if (channel==0 && number==107 && value==0) { layer3visibility = !layer3visibility; }
//  else if (channel==0 && number==16 && value==0) { layer4visibility = !layer4visibility; }
  
  // layers opacity
  if (channel==0 && number==2) { layerOpacity1 = value * 2; if(layerOpacity1==254){layerOpacity1=255;} }
  if (channel==0 && number==42) { layerOpacity2 = value * 2; if(layerOpacity2==254){layerOpacity2=255;} }
  if (channel==0 && number==85) { layerOpacity3 = value * 2; if(layerOpacity3==254){layerOpacity3=255;} }
  if (channel==0 && number==7) { layerOpacity4 = value * 2; if(layerOpacity4==254){layerOpacity4=255;} }
  
  // layers bpm visibility
  if (channel==0 && number==14) { controlP5.controller("layer1bpmVis").setValue(value * 2); }
  if (channel==0 && number==57) { controlP5.controller("layer2bpmVis").setValue(value * 2); }
  if (channel==0 && number==94) { controlP5.controller("layer3bpmVis").setValue(value * 2); }
  if (channel==0 && number==10) { controlP5.controller("layer4bpmVis").setValue(value * 2); }
  
  // layers bpm movie time
  if (channel==0 && number==15) { controlP5.controller("layer1bpmTime").setValue(value * 2); }
  if (channel==0 && number==58) { controlP5.controller("layer2bpmTime").setValue(value * 2); }
  if (channel==0 && number==95) { controlP5.controller("layer3bpmTime").setValue(value * 2); }
  if (channel==1 && number==10) { controlP5.controller("layer4bpmTime").setValue(value * 2); }
  
  // layers bpm random movie
  if (channel==0 && number==16) { controlP5.controller("layer1bpmMovie").setValue(value * 2); }
  if (channel==0 && number==59) { controlP5.controller("layer2bpmMovie").setValue(value * 2); }
  if (channel==0 && number==96) { controlP5.controller("layer3bpmMovie").setValue(value * 2); }
  if (channel==2 && number==10) { controlP5.controller("layer4bpmMovie").setValue(value * 2); }
  
 
}
