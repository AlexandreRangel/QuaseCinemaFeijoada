
// layer effects

//
// effects layer 1
//

void QCeffects1() {

  // gsvideo effects
  
  if (effectInvert1) { myMovie1.filter(INVERT); }
  if (effectPosterize1) { myMovie1.filter(POSTERIZE, 2); }
  
  
  // pixel effects start up
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1)
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
        
        if (brightness(myMovie1.pixels[loc]) > effectBWlimit1) { myMovie1.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie1.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW1
  
 
  // effects wrap up
  
  if (effectRG1 || effectRB1 || effectBG1 || effectBW1)
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
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2)
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
  
  
  // effects wrap up
  
  if (effectRG2 || effectRB2 || effectBG2 || effectBW2)
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
  
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3)
  { myMovie3.loadPixels(); }

  
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
        
        if (brightness(myMovie1.pixels[loc]) > effectBWlimit1) { myMovie1.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie1.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW1
  
  
  // effects wrap up
 
  if (effectRG3 || effectRB3 || effectBG3 || effectBW3)
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
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4)
  { myMovie4.loadPixels(); }
  
  
  // effects layer 4
  
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
        
        if (brightness(myMovie1.pixels[loc]) > effectBWlimit1) { myMovie1.pixels[loc]  = color(255);  // make pixel white
        }  else { myMovie1.pixels[loc]  = color(0); }    // make pixel black
        
      }
    }
  } // end effectBW1
  
  
  // effects wrap up
  
  if (effectRG4 || effectRB4 || effectBG4 || effectBW4)
  { myMovie4.updatePixels(); }
  
  //QCblend4();
  
} // end QCeffects4()
