
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  various functions
//  QCdrawLayer()
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void QCdrawLayer(int layer, int whatWidth, int whatHeight){
  
  switch (layer) {
    
    case 1: // draw layer 1
      switch (layerContent1) {
         case 0: image(myMovie1, 0, 0, whatWidth, whatHeight); break; // movie
         case 1: break; // image
         case 2: image(pipeline, 0, 0, whatWidth, whatHeight); break; // camera
      } // end switch layerContent1
      break;
      
     case 2: // draw layer 2
       switch (layerContent2) {
         case 0: image(myMovie2, 0, 0, whatWidth, whatHeight); break; // movie
         case 1: break; // image
         case 2: image(pipeline, 0, 0, whatWidth, whatHeight); break; // camera
       } // end switch layerContent2
       break;
       
     case 3: // draw layer 3
       switch (layerContent3) {
         case 0: image(myMovie3, 0, 0, whatWidth, whatHeight); break; // movie
         case 1: break; // image
         case 2: image(pipeline, 0, 0, whatWidth, whatHeight); break; // camera
      } // end switch layerContent3
     break;
     
     case 4: // draw layer 4
       switch (layerContent4) {
         case 0: image(myMovie4, 0, 0, whatWidth, whatHeight); break; // movie
         case 1: break; // image
         case 2: image(pipeline, 0, 0, whatWidth, whatHeight); break; // camera
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
