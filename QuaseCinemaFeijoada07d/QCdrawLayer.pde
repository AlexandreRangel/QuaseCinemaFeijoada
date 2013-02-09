
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  various functions
//  QCdrawLayer()
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void QCdrawLayer(int layer, int posX, int posY, int whatWidth, int whatHeight){
  
  switch (layer) {
    
    case 1: // draw layer 1
      // transform update
      if (posH1) { posX = posX + int(outputWidth * posH1value); }
      if (posV1) { posY = posY + int(whatHeight * posV1value); }
      if (sizeH1) { whatWidth = whatWidth+ int(whatWidth * sizeH1value); }
      if (sizeV1) { whatHeight = whatHeight + int(whatHeight * sizeV1value); }
      if (rotX1) { translate(outputWidth/2, outputHeight/2); rotateX(radians(rotX1value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY1) { translate(outputWidth/2, outputHeight/2); rotateY(radians(rotY1value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ1) { translate(outputWidth/2, outputHeight/2); rotateZ(radians(rotZ1value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      
      switch (layerContent1) {
         case 0: outputGL.image(myMovie1, posX, posY, whatWidth, whatHeight); break; // movie
         case 1: outputGL.image(myImage1, posX, posY, whatWidth, whatHeight); break; // image
         //case 2: outputGL.image(pipeline, posX, posY, whatWidth, whatHeight); break; // camera
      } // end switch layerContent1
      break;
      
     case 2: // draw layer 2
      // transform update
      if (posH2) { posX = posX + int(outputWidth * posH2value); }
      if (posV2) { posY = posY + int(whatHeight * posV2value); }
      if (sizeH2) { whatWidth = whatWidth+ int(whatWidth * sizeH2value); }
      if (sizeV2) { whatHeight = whatHeight + int(whatHeight * sizeV2value); }
      if (rotX2) { translate(outputWidth/2, outputHeight/2); rotateX(radians(rotX2value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY2) { translate(outputWidth/2, outputHeight/2); rotateY(radians(rotY2value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ2) { translate(outputWidth/2, outputHeight/2); rotateZ(radians(rotZ2value)); translate(-(outputWidth/2), -(outputHeight/2)); }
     
       switch (layerContent2) {
         case 0: image(myMovie2, posX, posY, whatWidth, whatHeight); break; // movie
         case 1: image(myImage2, posX, posY, whatWidth, whatHeight); break; // image
         //case 2: image(pipeline, posX, posY, whatWidth, whatHeight); break; // camera
       } // end switch layerContent2
       break;
       
     case 3: // draw layer 3
      // transform update
      if (posH3) { posX = posX + int(outputWidth * posH3value); }
      if (posV3) { posY = posY + int(whatHeight * posV3value); }
      if (sizeH3) { whatWidth = whatWidth+ int(whatWidth * sizeH3value); }
      if (sizeV3) { whatHeight = whatHeight + int(whatHeight * sizeV3value); }
      if (rotX3) { translate(outputWidth/2, outputHeight/2); rotateX(radians(rotX3value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY3) { translate(outputWidth/2, outputHeight/2); rotateY(radians(rotY3value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ3) { translate(outputWidth/2, outputHeight/2); rotateZ(radians(rotZ3value)); translate(-(outputWidth/2), -(outputHeight/2)); }
       
       switch (layerContent3) {
         case 0: image(myMovie3, posX, posY, whatWidth, whatHeight); break; // movie
         case 1: image(myImage3, posX, posY, whatWidth, whatHeight); break; // image
         //case 2: image(pipeline, posX, posY, whatWidth, whatHeight); break; // camera
        } // end switch layerContent3
     break;
     
     case 4: // draw layer 4
      // transform update
      if (posH4) { posX = posX + int(outputWidth * posH4value); }
      if (posV4) { posY = posY + int(whatHeight * posV4value); }
      if (sizeH4) { whatWidth = whatWidth+ int(whatWidth * sizeH2value); }
      if (sizeV4) { whatHeight = whatHeight + int(whatHeight * sizeV2value); }
      if (rotX4) { translate(outputWidth/2, outputHeight/2); rotateX(radians(rotX4value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotY4) { translate(outputWidth/2, outputHeight/2); rotateY(radians(rotY4value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      if (rotZ4) { translate(outputWidth/2, outputHeight/2); rotateX(radians(rotZ4value)); translate(-(outputWidth/2), -(outputHeight/2)); }
      
       switch (layerContent4) {
         case 0: image(myMovie4, posX, posY, whatWidth, whatHeight); break; // movie
         case 1: image(myImage4, posX, posY, whatWidth, whatHeight); break; // image
         //case 2: image(pipeline, posX, posY, whatWidth, whatHeight); break; // camera
      } // end switch layerContent4
     break;
     
  } // end switch draw layer
}

// blend xxx
      //
      //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE_MINUS_SRC_COLOR); // ok
      //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_DST_COLOR); // ok
      //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE_MINUS_DST_COLOR); // ok
      //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_SRC_COLOR); // ok
      //gl.glBlendFunc(GL.GL_ONE_MINUS_SRC_COLOR, GL.GL_ONE); // medio
      //gl.glBlendFunc(GL.GL_ONE_MINUS_SRC_ALPHA, GL.GL_ONE_MINUS_SRC_COLOR); // ok escuresce com o inverso
      //gl.glBlendFunc(GL.GL_DST_COLOR, GL.GL_SRC_COLOR); // ok escuresce
