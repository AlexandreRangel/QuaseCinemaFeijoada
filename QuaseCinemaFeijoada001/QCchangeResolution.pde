
void QCchangeResolution() { // update resolution

  switch (changeResolution) {
    case 0:
      outputWidth = 240; outputHeight = 180; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 1:
      outputWidth = 320; outputHeight = 240; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 2:
      outputWidth = 640; outputHeight = 480; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 3:
      outputWidth = 800; outputHeight = 600; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 4:
      outputWidth = 1024; outputHeight = 768; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 5:
      outputWidth = 1280; outputHeight = 720; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 6:
      outputWidth = 1920; outputHeight = 1080; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 7:
      outputWidth = 1920; outputHeight = 1080; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 8:
      outputWidth = 1280; outputHeight = 480; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 9:
      outputWidth = 1600; outputHeight = 600; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 10:
      outputWidth = 2048; outputHeight = 768; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 11:
      outputWidth = 1920; outputHeight = 480; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 12:
      outputWidth = 2400; outputHeight = 600; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    case 13:
      outputWidth = 3072; outputHeight = 768; frame.setSize(outputWidth,outputHeight);
      changeResolution = 100;
      break;
    default: break;
  } // end switch
  
} // end QCchangeResolution
