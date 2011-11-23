
// effects

void QCeffects() {

  if (effectInvert1) { myMovie1.filter(INVERT); }
  if (effectInvert2) { myMovie2.filter(INVERT); }
  if (effectInvert3) { myMovie3.filter(INVERT); }
  if (effectInvert4) { myMovie4.filter(INVERT); }

  if (effectPosterize1) { myMovie1.filter(POSTERIZE, 2); }
  if (effectPosterize2) { myMovie2.filter(POSTERIZE, 2); }
  if (effectPosterize3) { myMovie3.filter(POSTERIZE, 2); }
  if (effectPosterize4) { myMovie4.filter(POSTERIZE, 2); }
  
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1)
  { myMovie1.loadPixels(); }
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2)
  { myMovie2.loadPixels(); }
  
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3)
  { myMovie3.loadPixels(); }
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4)
  { myMovie4.loadPixels(); }
  
  
  if (effectRG1) {
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        
      if (brightness(myMovie1.pixels[loc]) > 127) {
        myMovie1.pixels[loc]  = color(255);  // White
      }  else {
        myMovie1.pixels[loc]  = color(0);    // Black
      }
        
      myMovie1.pixels[loc] =  color(g,r,b);          
      }
    }
  } // end effectRG1
  
  
  if (effectRB1) {
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        myMovie1.pixels[loc] =  color(b,g,r);          
      }
    }
  } // end effectRB1
  
  
  if (effectBG1) {
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        myMovie1.pixels[loc] =  color(r,b,g);          
      }
    }
  } // end effectBg1
  
  
  if (effectBW1) {
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        
        if (brightness(myMovie1.pixels[loc]) > 127) { myMovie1.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie1.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW1
  
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1)
  { myMovie1.updatePixels(); }
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2)
  { myMovie2.updatePixels(); }
  
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3)
  { myMovie3.updatePixels(); }
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4)
  { myMovie4.updatePixels(); }
  
}


    //myMovie1.filter(INVERT);
    //myMovie1.filter(POSTERIZE,4);
    //myMovie1.filter(BLUR,2);
    //myMovie1.filter(DILATE);
