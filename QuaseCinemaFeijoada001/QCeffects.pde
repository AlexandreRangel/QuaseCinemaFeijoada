
// layer effects

//
// effects layer 1
//

void QCeffects1() {

  // gsvideo effects
  
  if (effectInvert1) { myMovie1.filter(INVERT); }
  if (effectPosterize1) { myMovie1.filter(POSTERIZE, 2); }
  
  
  // pixel effects start up
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1 || effectContrast1 || effectSaturation1)
  { myMovie1.loadPixels(); }
  
  
  // effects layer 1
  
  if (effectRG1) { // red x green layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        myMovie1.pixels[loc] =  color(g,r,b);          
      }
    }
  } // end effectRG1
  
  if (effectRB1) { // red x green layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        myMovie1.pixels[loc] =  color(b,g,r);          
      }
    }
  } // end effectRB1
  
  if (effectBG1) { // blue x green layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        myMovie1.pixels[loc] =  color(r,b,g);          
      }
    }
  } // end effectBg1
  
  if (effectBW1) { // black and white layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        
        if (brightness(myMovie1.pixels[loc]) > effectBWlimit1) { myMovie1.pixels[loc]  = color(255); // make pixel white
        } else { myMovie1.pixels[loc]  = color(0); } // make pixel black
        
      }
    }
  } // end effectBW1
  
  if (effectContrast1) { // contrast layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        float r = red(myMovie1.pixels[loc]); float g = green(myMovie1.pixels[loc]); float b = blue(myMovie1.pixels[loc]);
        
        if (brightness(myMovie1.pixels[loc]) > 127) {
          myMovie1.pixels[loc]  = color(r+effectContrastLimit1,g+effectContrastLimit1,b+effectContrastLimit1);  // make pixel lighter
        } else {
          myMovie1.pixels[loc]  = color(r-effectContrastLimit1,g-effectContrastLimit1,b-effectContrastLimit1); // make pixel darker
        } // end if
        
      }
    }
  } // end effectContrast1
  
  if (effectSaturation1) { // saturation layer 1
    for (int y = 0; y < myMovie1.height; y++) {
      for (int x = 0; x < myMovie1.width; x++) {
        int loc = x + y * myMovie1.width;
        
        colorMode(HSB);
        float h = hue(myMovie1.pixels[loc]); float s = saturation(myMovie1.pixels[loc]); float b = brightness(myMovie1.pixels[loc]);
        myMovie1.pixels[loc]  = color(h,s+effectSaturationLimit1,b);  // make pixel lighter
        colorMode(RGB);
        
      }
    }
  } // end effectSaturation1
  
 
  // effects wrap up
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1 || effectContrast1 || effectSaturation1)
  { myMovie1.updatePixels(); }
  
} // end QCeffects1()


//
// effects layer 2
//

void QCeffects2() {

  // gsvideo effects
  
  if (effectInvert2) { myMovie2.filter(INVERT); }
  if (effectPosterize2) { myMovie2.filter(POSTERIZE, 2); }
  
  
  // pixel effects start up
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2 || effectContrast2 || effectSaturation2)
  { myMovie2.loadPixels(); }
  
  
  // effects layer 2
  
  if (effectRG2) { // red x green layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        float r = red(myMovie2.pixels[loc]); float g = green(myMovie2.pixels[loc]); float b = blue(myMovie2.pixels[loc]);
        myMovie2.pixels[loc] =  color(g,r,b);          
      }
    }
  } // end effectRG2
  
  if (effectRB2) { // red x green layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        float r = red(myMovie2.pixels[loc]); float g = green(myMovie2.pixels[loc]); float b = blue(myMovie2.pixels[loc]);
        myMovie2.pixels[loc] =  color(b,g,r);          
      }
    }
  } // end effectRB2
  
  if (effectBG2) { // blue x green layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        float r = red(myMovie2.pixels[loc]); float g = green(myMovie2.pixels[loc]); float b = blue(myMovie2.pixels[loc]);
        myMovie2.pixels[loc] =  color(r,b,g);          
      }
    }
  } // end effectBg2
  
  if (effectBW2) { // black and white layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        float r = red(myMovie2.pixels[loc]); float g = green(myMovie2.pixels[loc]); float b = blue(myMovie2.pixels[loc]);
        
        if (brightness(myMovie2.pixels[loc]) > effectBWlimit2) { myMovie2.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie2.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW2
  
  if (effectContrast2) { // contrast layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        float r = red(myMovie2.pixels[loc]); float g = green(myMovie2.pixels[loc]); float b = blue(myMovie2.pixels[loc]);
        
        if (brightness(myMovie2.pixels[loc]) > 127) {
          myMovie2.pixels[loc]  = color(r+effectContrastLimit2,g+effectContrastLimit2,b+effectContrastLimit2);  // make pixel lighter
        } else {
          myMovie2.pixels[loc]  = color(r-effectContrastLimit2,g-effectContrastLimit2,b-effectContrastLimit2); // make pixel darker
        } // end if
        
      }
    }
  } // end effectContrast2
  
  if (effectSaturation2) { // saturation layer 2
    for (int y = 0; y < myMovie2.height; y++) {
      for (int x = 0; x < myMovie2.width; x++) {
        int loc = x + y * myMovie2.width;
        
        colorMode(HSB);
        float h = hue(myMovie2.pixels[loc]); float s = saturation(myMovie2.pixels[loc]); float b = brightness(myMovie2.pixels[loc]);
        myMovie2.pixels[loc]  = color(h,s+effectSaturationLimit2,b);  // make pixel lighter
        colorMode(RGB);
        
      }
    }
  } // end effectSaturation2
  
  // effects wrap up
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2 || effectContrast2 || effectSaturation2)
  { myMovie2.updatePixels(); }
  
  //QCblend2();
  
  
} // end QCeffects2()


//
// effects layer 3
//

void QCeffects3() {

  // gsvideo effects
  
  if (effectInvert3) { myMovie3.filter(INVERT); }
  if (effectPosterize3) { myMovie3.filter(POSTERIZE, 2); }
  
  
  // pixel effects start up
  
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3 || effectContrast3 || effectSaturation3)
  { myMovie3.loadPixels(); }

  
  //
  // effects layer 3
  //
  
  if (effectRG3) { // red x green layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        float r = red(myMovie3.pixels[loc]); float g = green(myMovie3.pixels[loc]); float b = blue(myMovie3.pixels[loc]);
        myMovie3.pixels[loc] =  color(g,r,b);          
      }
    }
  } // end effectRG3
  
  if (effectRB3) { // red x green layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        float r = red(myMovie3.pixels[loc]); float g = green(myMovie3.pixels[loc]); float b = blue(myMovie3.pixels[loc]);
        myMovie3.pixels[loc] =  color(b,g,r);          
      }
    }
  } // end effectRB3
  
  if (effectBG3) { // blue x green layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        float r = red(myMovie3.pixels[loc]); float g = green(myMovie3.pixels[loc]); float b = blue(myMovie3.pixels[loc]);
        myMovie3.pixels[loc] =  color(r,b,g);          
      }
    }
  } // end effectBg3
  
  if (effectBW3) { // black and white layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        float r = red(myMovie3.pixels[loc]); float g = green(myMovie3.pixels[loc]); float b = blue(myMovie3.pixels[loc]);
        
        if (brightness(myMovie3.pixels[loc]) > effectBWlimit3) { myMovie3.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie3.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW3
  
    if (effectContrast3) { // contrast layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        float r = red(myMovie3.pixels[loc]); float g = green(myMovie3.pixels[loc]); float b = blue(myMovie3.pixels[loc]);
        
        if (brightness(myMovie3.pixels[loc]) > 127) {
          myMovie3.pixels[loc]  = color(r+effectContrastLimit3,g+effectContrastLimit3,b+effectContrastLimit3);  // make pixel lighter
        } else {
          myMovie3.pixels[loc]  = color(r-effectContrastLimit3,g-effectContrastLimit3,b-effectContrastLimit3); // make pixel darker
        } // end if
        
      }
    }
  } // end effectContrast3
  
  if (effectSaturation3) { // saturation layer 3
    for (int y = 0; y < myMovie3.height; y++) {
      for (int x = 0; x < myMovie3.width; x++) {
        int loc = x + y * myMovie3.width;
        
        colorMode(HSB);
        float h = hue(myMovie3.pixels[loc]); float s = saturation(myMovie3.pixels[loc]); float b = brightness(myMovie3.pixels[loc]);
        myMovie3.pixels[loc]  = color(h,s+effectSaturationLimit3,b);  // make pixel lighter
        colorMode(RGB);
        
      }
    }
  } // end effectSaturation3
  
  // effects wrap up
 
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3 || effectContrast3 || effectSaturation3)
  { myMovie3.updatePixels(); }
  
  //QCblend3();
  
  
} // end QCeffects3()



//
// effects layer 4
//

void QCeffects4() {

  // gsvideo effects
  
  if (effectInvert4) { myMovie4.filter(INVERT); }
  if (effectPosterize4) { myMovie4.filter(POSTERIZE, 2); }
  
  
  // pixel effects start up
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4 || effectContrast4 || effectSaturation4)
  { myMovie4.loadPixels(); }
  
  
  //
  // effects layer 4
  //
  
  if (effectRG4) { // red x green layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        float r = red(myMovie4.pixels[loc]); float g = green(myMovie4.pixels[loc]); float b = blue(myMovie4.pixels[loc]);
        myMovie4.pixels[loc] =  color(g,r,b);          
      }
    }
  } // end effectRG4
  
  if (effectRB4) { // red x green layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        float r = red(myMovie4.pixels[loc]); float g = green(myMovie4.pixels[loc]); float b = blue(myMovie4.pixels[loc]);
        myMovie4.pixels[loc] =  color(b,g,r);          
      }
    }
  } // end effectRB4
  
  if (effectBG4) { // blue x green layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        float r = red(myMovie4.pixels[loc]); float g = green(myMovie4.pixels[loc]); float b = blue(myMovie4.pixels[loc]);
        myMovie4.pixels[loc] =  color(r,b,g);          
      }
    }
  } // end effectBg4
  
  if (effectBW4) { // black and white layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        float r = red(myMovie4.pixels[loc]); float g = green(myMovie4.pixels[loc]); float b = blue(myMovie4.pixels[loc]);
        
        if (brightness(myMovie4.pixels[loc]) > effectBWlimit4) { myMovie4.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie4.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW4
  
    if (effectContrast4) { // contrast layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        float r = red(myMovie4.pixels[loc]); float g = green(myMovie4.pixels[loc]); float b = blue(myMovie4.pixels[loc]);
        
        if (brightness(myMovie4.pixels[loc]) > 127) {
          myMovie4.pixels[loc]  = color(r+effectContrastLimit4,g+effectContrastLimit4,b+effectContrastLimit4);  // make pixel lighter
        } else {
          myMovie4.pixels[loc]  = color(r-effectContrastLimit4,g-effectContrastLimit4,b-effectContrastLimit4); // make pixel darker
        } // end if
        
      }
    }
  } // end effectContrast4
  
  if (effectSaturation4) { // saturation layer 4
    for (int y = 0; y < myMovie4.height; y++) {
      for (int x = 0; x < myMovie4.width; x++) {
        int loc = x + y * myMovie4.width;
        
        colorMode(HSB);
        float h = hue(myMovie4.pixels[loc]); float s = saturation(myMovie4.pixels[loc]); float b = brightness(myMovie4.pixels[loc]);
        myMovie4.pixels[loc]  = color(h,s+effectSaturationLimit4,b);  // make pixel lighter
        colorMode(RGB);
        
      }
    }
  } // end effectSaturation4
  
  // effects wrap up
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4 || effectContrast4 || effectSaturation4)
  { myMovie4.updatePixels(); }
  
  //QCblend4();
  
} // end QCeffects4()
