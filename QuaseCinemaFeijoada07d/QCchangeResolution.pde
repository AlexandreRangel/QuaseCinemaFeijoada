
void QCmoveOutput() {
  frame.setLocation(outputXpos,outputYpos);
}

void QCchangeResolution() { // update resolution

  // layer2visibility = false; layer3visibility = false; layer4visibility = false;

  switch (changeResolution) {
    case 0:
      outputWidth = 240; outputHeight = 180;
      //outputGL = null; outputGL = (PGraphicsOpenGL) createGraphics(outputGLw, outputGLh, OPENGL);
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      changeMovie1=true;
      break;
    case 1:
      outputWidth = 320; outputHeight = 240;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 2:
      outputWidth = 640; outputHeight = 480;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      break;
    case 3:
      outputWidth = 800; outputHeight = 600;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 4:
      outputWidth = 854; outputHeight = 480;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 5:
      outputWidth = 1024; outputHeight = 768;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 6:
      outputWidth = 1280; outputHeight = 720;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 7:
      outputWidth = 1280; outputHeight = 1024;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 8:
      outputWidth = 1920; outputHeight = 1080;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 9:
      outputWidth = 1600; outputHeight = 1200;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 10:
      outputWidth = 1280; outputHeight = 480;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 11:
      outputWidth = 1600; outputHeight = 600;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 12:
      outputWidth = 2048; outputHeight = 768;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 13:
      outputWidth = 1920; outputHeight = 480;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 14:
      outputWidth = 2400; outputHeight = 600;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    case 15:
      outputWidth = 3072; outputHeight = 768;
      frame.setSize(outputWidth,outputHeight);
      size(outputWidth,outputHeight, P3D);
      changeResolution = 100;
      break;
    default: break; // value = 100
  } // end switch
  
  // reload movies; otherwise, movies freeze
  if (layer1visibility == true){ layer1visibility = false; QCrandomMov(0); layer1visibility = true; }
  if (layer2visibility == true){ layer2visibility = false; QCrandomMov(1); layer2visibility = true; }
  if (layer3visibility == true){ layer3visibility = false; QCrandomMov(2); layer3visibility = true; }
  if (layer4visibility == true){ layer4visibility = false; QCrandomMov(3); layer4visibility = true; }
  
} // end QCchangeResolution
