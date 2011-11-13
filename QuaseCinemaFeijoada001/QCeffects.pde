
// effects

void QCeffects() {

  if (effectInvert1) { myMovie1.filter(INVERT); }
  if (effectInvert2) { myMovie2.filter(INVERT); }
  if (effectInvert3) { myMovie3.filter(INVERT); }
  if (effectInvert4) { myMovie4.filter(INVERT); }

  if (effectPosterize1) { myMovie1.filter(POSTERIZE, 3); }
  if (effectPosterize2) { myMovie2.filter(POSTERIZE, 3); }
  if (effectPosterize3) { myMovie3.filter(POSTERIZE, 3); }
  if (effectPosterize4) { myMovie4.filter(POSTERIZE, 3); }
  
}

    //myMovie1.filter(INVERT);
    //myMovie1.filter(POSTERIZE,4);
    //myMovie1.filter(BLUR,2);
    //myMovie1.filter(DILATE);
