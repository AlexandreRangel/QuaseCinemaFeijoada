void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println("\n Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  // layers opacity
  if (channel==0 && number==2) { layerOpacity1 = value * 2; if(layerOpacity1==254){layerOpacity1=255;} }
  if (channel==0 && number==3) { layerOpacity2 = value * 2; if(layerOpacity2==254){layerOpacity2=255;} }
  if (channel==0 && number==4) { layerOpacity3 = value * 2; if(layerOpacity3==254){layerOpacity3=255;} }
  if (channel==0 && number==5) { layerOpacity4 = value * 2; if(layerOpacity4==254){layerOpacity4=255;} }
}
