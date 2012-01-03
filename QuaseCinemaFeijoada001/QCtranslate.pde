
public void QCtranslate() {
  
   switch (language) {
        case 0: languageList.setLabel("language"); break;
        case 1: languageList.setLabel("lingua"); break;
        case 2: languageList.setLabel("idiome"); break;
        case 3: languageList.setLabel("sprachlich"); break;
        case 4: languageList.setLabel("语言"); break;
   } // end switch language
   
   
   //
   // Tabs
   //
   
   switch (language) {
        case 0: controlWindow.tab("default").setLabel(" Main"); break; // English
        case 1: controlWindow.tab("default").setLabel(" Principal"); break; // Portuguese
        case 2: controlWindow.tab("default").setLabel(" Main"); break; // French
        case 3: controlWindow.tab("default").setLabel(" Principal"); break; // German
        case 4: controlWindow.tab("default").setLabel(" 总管道"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Effects").setLabel(" Effects"); break; // English
        case 1: controlWindow.tab("Effects").setLabel(" Efeitos"); break; // Portuguese
        case 2: controlWindow.tab("Effects").setLabel(" Effets"); break; // French
        case 3: controlWindow.tab("Effects").setLabel(" Effekten"); break; // German
        case 4: controlWindow.tab("Effects").setLabel(" 动产"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Rhythm").setLabel(" Rhythm"); break; // English
        case 1: controlWindow.tab("Rhythm").setLabel(" Ritmo"); break; // Portuguese
        case 2: controlWindow.tab("Rhythm").setLabel(" Rythme"); break; // French
        case 3: controlWindow.tab("Rhythm").setLabel(" Rhythmik"); break; // German
        case 4: controlWindow.tab("Rhythm").setLabel(" 旋律"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Sequencer").setLabel(" Sequencer"); break; // English
        case 1: controlWindow.tab("Sequencer").setLabel(" Sequenciador"); break; // Portuguese
        case 2: controlWindow.tab("Sequencer").setLabel(" Séquentiel"); break; // French
        case 3: controlWindow.tab("Sequencer").setLabel(" Sequencer"); break; // German
        case 4: controlWindow.tab("Sequencer").setLabel(" 程序装置"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // English
        case 1: controlWindow.tab("Mapping").setLabel(" Mapeamento"); break; // Portuguese
        case 2: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // French
        case 3: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // German
        case 4: controlWindow.tab("Mapping").setLabel(" 绘图"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("3D").setLabel(" 3D"); break; // English
        case 1: controlWindow.tab("3D").setLabel(" 3D"); break; // Portuguese
        case 2: controlWindow.tab("3D").setLabel(" 3D"); break; // French
        case 3: controlWindow.tab("3D").setLabel(" 3D"); break; // German
        case 4: controlWindow.tab("3D").setLabel(" 三维简化"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // English
        case 1: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // Portuguese
        case 2: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // French
        case 3: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // German
        case 4: controlWindow.tab("Playlist").setLabel(" 播放列表"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Audio").setLabel(" Audio"); break; // English
        case 1: controlWindow.tab("Audio").setLabel(" Audio"); break; // Portuguese
        case 2: controlWindow.tab("Audio").setLabel(" Audio"); break; // French
        case 3: controlWindow.tab("Audio").setLabel(" Audio"); break; // German
        case 4: controlWindow.tab("Audio").setLabel(" 声音的"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Prefs").setLabel(" Preferences"); break; // English
        case 1: controlWindow.tab("Prefs").setLabel(" Preferências"); break; // Portuguese
        case 2: controlWindow.tab("Prefs").setLabel(" Préférences"); break; // French
        case 3: controlWindow.tab("Prefs").setLabel(" Vorrang"); break; // German
        case 4: controlWindow.tab("Prefs").setLabel(" 偏爱"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Help").setLabel(" Help"); break; // English
        case 1: controlWindow.tab("Help").setLabel(" Ajuda"); break; // Portuguese
        case 2: controlWindow.tab("Help").setLabel(" Aide"); break; // French
        case 3: controlWindow.tab("Help").setLabel(" Hilfe"); break; // German
        case 4: controlWindow.tab("Help").setLabel(" 帮助"); break; // Chinese
   } // end switch language
  
  
  //
  // main tab
  //
  
  switch (language) {
    case 0: // English
      controlP5.controller("layer1visibility").setLabel("visible");
      controlP5.controller("layer2visibility").setLabel("visible");
      controlP5.controller("layer3visibility").setLabel("visible");
      controlP5.controller("layer4visibility").setLabel("visible");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1visibility").setLabel("visível");
      controlP5.controller("layer2visibility").setLabel("visível");
      controlP5.controller("layer3visibility").setLabel("visível");
      controlP5.controller("layer4visibility").setLabel("visível");
      break;
    case 2: // French
      controlP5.controller("layer1visibility").setLabel("visible");
      controlP5.controller("layer2visibility").setLabel("visible");
      controlP5.controller("layer3visibility").setLabel("visible");
      controlP5.controller("layer4visibility").setLabel("visible");
      break;
    case 3: // German
      controlP5.controller("layer1visibility").setLabel("sichtbar");
      controlP5.controller("layer2visibility").setLabel("sichtbar");
      controlP5.controller("layer3visibility").setLabel("sichtbar");
      controlP5.controller("layer4visibility").setLabel("sichtbar");
      break;
    case 4: // Chinese
      controlP5.controller("layer1visibility").setLabel("看得见的");
      controlP5.controller("layer2visibility").setLabel("看得见的");
      controlP5.controller("layer3visibility").setLabel("看得见的");
      controlP5.controller("layer4visibility").setLabel("看得见的");
      break;
   } // end switch language
  
  switch (language) {
    case 0: // English
      controlP5.controller("layer1loop").setLabel("loop");
      controlP5.controller("layer2loop").setLabel("loop");
      controlP5.controller("layer3loop").setLabel("loop");
      controlP5.controller("layer4loop").setLabel("loop");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1loop").setLabel("loop");
      controlP5.controller("layer2loop").setLabel("loop");
      controlP5.controller("layer3loop").setLabel("loop");
      controlP5.controller("layer4loop").setLabel("loop");
      break;
    case 2: // French
      controlP5.controller("layer1loop").setLabel("boucle");
      controlP5.controller("layer2loop").setLabel("boucle");
      controlP5.controller("layer3loop").setLabel("boucle");
      controlP5.controller("layer4loop").setLabel("boucle");
      break;
    case 3: // German
      controlP5.controller("layer1loop").setLabel("Schleife");
      controlP5.controller("layer2loop").setLabel("Schleife");
      controlP5.controller("layer3loop").setLabel("Schleife");
      controlP5.controller("layer4loop").setLabel("Schleife");
      break;
    case 4: // Chinese
      controlP5.controller("layer1loop").setLabel("圈");
      controlP5.controller("layer2loop").setLabel("圈");
      controlP5.controller("layer3loop").setLabel("圈");
      controlP5.controller("layer4loop").setLabel("圈");
      break;
   } // end switch language

switch (language) {
    case 0: // English
      controlP5.controller("layer1playback").setLabel("playback");
      controlP5.controller("layer2playback").setLabel("playback");
      controlP5.controller("layer3playback").setLabel("playback");
      controlP5.controller("layer4playback").setLabel("playback");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1playback").setLabel("playback");
      controlP5.controller("layer2playback").setLabel("playback");
      controlP5.controller("layer3playback").setLabel("playback");
      controlP5.controller("layer4playback").setLabel("playback");
      break;
    case 2: // French
      controlP5.controller("layer1playback").setLabel("playback");
      controlP5.controller("layer2playback").setLabel("playback");
      controlP5.controller("layer3playback").setLabel("playback");
      controlP5.controller("layer4playback").setLabel("playback");
      break;
    case 3: // German
      controlP5.controller("layer1playback").setLabel("abspielen");
      controlP5.controller("layer2playback").setLabel("abspielen");
      controlP5.controller("layer3playback").setLabel("abspielen");
      controlP5.controller("layer4playback").setLabel("abspielen");
      break;
    case 4: // Chinese
      controlP5.controller("layer1playback").setLabel("录音再生");
      controlP5.controller("layer2playback").setLabel("录音再生");
      controlP5.controller("layer3playback").setLabel("录音再生");
      controlP5.controller("layer4playback").setLabel("录音再生");
      break;
   } // end switch language
  
  switch (language) {
    case 0: // English
      controlP5.controller("layer1speed").setLabel("speed");
      controlP5.controller("layer2speed").setLabel("speed");
      controlP5.controller("layer3speed").setLabel("speed");
      controlP5.controller("layer4speed").setLabel("speed");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1speed").setLabel("velocidade");
      controlP5.controller("layer2speed").setLabel("velocidade");
      controlP5.controller("layer3speed").setLabel("velocidade");
      controlP5.controller("layer4speed").setLabel("velocidade");
      break;
    case 2: // French
      controlP5.controller("layer1speed").setLabel("vitesse");
      controlP5.controller("layer2speed").setLabel("vitesse");
      controlP5.controller("layer3speed").setLabel("vitesse");
      controlP5.controller("layer4speed").setLabel("vitesse");
      break;
    case 3: // German
      controlP5.controller("layer1speed").setLabel("gang");
      controlP5.controller("layer2speed").setLabel("gang");
      controlP5.controller("layer3speed").setLabel("gang");
      controlP5.controller("layer4speed").setLabel("gang");
      break;
    case 4: // Chinese
      controlP5.controller("layer1speed").setLabel("录音再生");
      controlP5.controller("layer2speed").setLabel("录音再生");
      controlP5.controller("layer3speed").setLabel("录音再生");
      controlP5.controller("layer4speed").setLabel("录音再生");
      break;
   } // end switch language
  
  switch (language) {
    case 0: // English
      controlP5.controller("randomDir1").setLabel("random folder");
      controlP5.controller("randomDir2").setLabel("random folder");
      controlP5.controller("randomDir3").setLabel("random folder");
      controlP5.controller("randomDir4").setLabel("random folder");
      break;
    case 1: // Portuguese
      controlP5.controller("randomDir1").setLabel("muda pasta");
      controlP5.controller("randomDir2").setLabel("muda pasta");
      controlP5.controller("randomDir3").setLabel("muda pasta");
      controlP5.controller("randomDir4").setLabel("muda pasta");
      break;
    case 2: // French
      controlP5.controller("randomDir1").setLabel("dossier aléatoire");
      controlP5.controller("randomDir2").setLabel("dossier aléatoire");
      controlP5.controller("randomDir3").setLabel("dossier aléatoire");
      controlP5.controller("randomDir4").setLabel("dossier aléatoire");
      break;
    case 3: // German
      controlP5.controller("randomDir1").setLabel("zufällig archiv");
      controlP5.controller("randomDir2").setLabel("zufällig archiv");
      controlP5.controller("randomDir3").setLabel("zufällig archiv");
      controlP5.controller("randomDir4").setLabel("zufällig archiv");
      break;
    case 4: // Chinese
      controlP5.controller("randomDir1").setLabel("任意的 夹子");
      controlP5.controller("randomDir2").setLabel("任意的 夹子");
      controlP5.controller("randomDir3").setLabel("任意的 夹子");
      controlP5.controller("randomDir4").setLabel("任意的 夹子");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("randomMov1").setLabel("random movie");
      controlP5.controller("randomMov2").setLabel("random movie");
      controlP5.controller("randomMov3").setLabel("random movie");
      controlP5.controller("randomMov4").setLabel("random movie");
      break;
    case 1: // Portuguese
      controlP5.controller("randomMov1").setLabel("muda filme");
      controlP5.controller("randomMov2").setLabel("muda filme");
      controlP5.controller("randomMov3").setLabel("muda filme");
      controlP5.controller("randomMov4").setLabel("muda filme");
      break;
    case 2: // French
      controlP5.controller("randomMov1").setLabel("film aléatoire");
      controlP5.controller("randomMov2").setLabel("film aléatoire");
      controlP5.controller("randomMov3").setLabel("film aléatoire");
      controlP5.controller("randomMov4").setLabel("film aléatoire");
      break;
    case 3: // German
      controlP5.controller("randomMov1").setLabel("zufällig film");
      controlP5.controller("randomMov2").setLabel("zufällig film");
      controlP5.controller("randomMov3").setLabel("zufällig film");
      controlP5.controller("randomMov4").setLabel("zufällig film");
      break;
    case 4: // Chinese
      controlP5.controller("randomMov1").setLabel("任意的 电影");
      controlP5.controller("randomMov2").setLabel("任意的 电影");
      controlP5.controller("randomMov3").setLabel("任意的 电影");
      controlP5.controller("randomMov4").setLabel("任意的 电影");
      break;
   } // end switch language
   
   
   //
   // Effects tab
   //
   
   switch (language) {
    case 0: // English
      controlP5.group("layerComposite1").setLabel("composition");
      controlP5.group("layerComposite2").setLabel("composition");
      controlP5.group("layerComposite3").setLabel("composition");
      controlP5.group("layerComposite4").setLabel("composition");
      break;
    case 1: // Portuguese
      controlP5.group("layerComposite1").setLabel("composição");
      controlP5.group("layerComposite2").setLabel("composição");
      controlP5.group("layerComposite3").setLabel("composição");
      controlP5.group("layerComposite4").setLabel("composição");
      break;
    case 2: // French
      controlP5.group("layerComposite1").setLabel("composition");
      controlP5.group("layerComposite2").setLabel("composition");
      controlP5.group("layerComposite3").setLabel("composition");
      controlP5.group("layerComposite4").setLabel("composition");
      break;
    case 3: // German
      controlP5.group("layerComposite1").setLabel("Komposition");
      controlP5.group("layerComposite2").setLabel("Komposition");
      controlP5.group("layerComposite3").setLabel("Komposition");
      controlP5.group("layerComposite4").setLabel("Komposition");
      break;
    case 4: // Chinese
      controlP5.group("layerComposite1").setLabel("写作");
      controlP5.group("layerComposite2").setLabel("写作");
      controlP5.group("layerComposite3").setLabel("写作");
      controlP5.group("layerComposite4").setLabel("写作");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectInvert1").setLabel("invert");
      controlP5.controller("effectInvert2").setLabel("invert");
      controlP5.controller("effectInvert3").setLabel("invert");
      controlP5.controller("effectInvert4").setLabel("invert");
      break;
    case 1: // Portuguese
      controlP5.controller("effectInvert1").setLabel("inverter");
      controlP5.controller("effectInvert2").setLabel("inverter");
      controlP5.controller("effectInvert3").setLabel("inverter");
      controlP5.controller("effectInvert4").setLabel("inverter");
      break;
    case 2: // French
      controlP5.controller("effectInvert1").setLabel("invertir");
      controlP5.controller("effectInvert2").setLabel("invertir");
      controlP5.controller("effectInvert3").setLabel("invertir");
      controlP5.controller("effectInvert4").setLabel("invertir");
      break;
    case 3: // German
      controlP5.controller("effectInvert1").setLabel("Umkehren");
      controlP5.controller("effectInvert2").setLabel("Umkehren");
      controlP5.controller("effectInvert3").setLabel("Umkehren");
      controlP5.controller("effectInvert4").setLabel("Umkehren");
      break;
    case 4: // Chinese
      controlP5.controller("effectInvert1").setLabel("使反转");
      controlP5.controller("effectInvert2").setLabel("使反转");
      controlP5.controller("effectInvert3").setLabel("使反转");
      controlP5.controller("effectInvert4").setLabel("使反转");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectPosterize1").setLabel("poster");
      controlP5.controller("effectPosterize2").setLabel("poster");
      controlP5.controller("effectPosterize3").setLabel("poster");
      controlP5.controller("effectPosterize4").setLabel("poster");
      break;
    case 1: // Portuguese
      controlP5.controller("effectPosterize1").setLabel("poster");
      controlP5.controller("effectPosterize2").setLabel("poster");
      controlP5.controller("effectPosterize3").setLabel("poster");
      controlP5.controller("effectPosterize4").setLabel("poster");
      break;
    case 2: // French
      controlP5.controller("effectPosterize1").setLabel("postériser");
      controlP5.controller("effectPosterize2").setLabel("postériser");
      controlP5.controller("effectPosterize3").setLabel("postériser");
      controlP5.controller("effectPosterize4").setLabel("postériser");
      break;
    case 3: // German
      controlP5.controller("effectPosterize1").setLabel("posterisieren");
      controlP5.controller("effectPosterize2").setLabel("posterisieren");
      controlP5.controller("effectPosterize3").setLabel("posterisieren");
      controlP5.controller("effectPosterize4").setLabel("posterisieren");
      break;
    case 4: // Chinese
      controlP5.controller("effectPosterize1").setLabel("海报效果");
      controlP5.controller("effectPosterize2").setLabel("海报效果");
      controlP5.controller("effectPosterize3").setLabel("海报效果");
      controlP5.controller("effectPosterize4").setLabel("海报效果");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectBW1").setLabel("black & white");
      controlP5.controller("effectBW2").setLabel("black & white");
      controlP5.controller("effectBW3").setLabel("black & white");
      controlP5.controller("effectBW4").setLabel("black & white");
      break;
    case 1: // Portuguese
      controlP5.controller("effectBW1").setLabel("preto e branco");
      controlP5.controller("effectBW2").setLabel("preto e branco");
      controlP5.controller("effectBW3").setLabel("preto e branco");
      controlP5.controller("effectBW4").setLabel("preto e branco");
      break;
    case 2: // French
      controlP5.controller("effectBW1").setLabel("noir et blanc");
      controlP5.controller("effectBW2").setLabel("noir et blanc");
      controlP5.controller("effectBW3").setLabel("noir et blanc");
      controlP5.controller("effectBW4").setLabel("noir et blanc");
      break;
    case 3: // German
      controlP5.controller("effectBW1").setLabel("schwarz auf weiß");
      controlP5.controller("effectBW2").setLabel("schwarz auf weiß");
      controlP5.controller("effectBW3").setLabel("schwarz auf weiß");
      controlP5.controller("effectBW4").setLabel("schwarz auf weiß");
      break;
    case 4: // Chinese
      controlP5.controller("effectBW1").setLabel("白纸黑字");
      controlP5.controller("effectBW2").setLabel("白纸黑字");
      controlP5.controller("effectBW3").setLabel("白纸黑字");
      controlP5.controller("effectBW4").setLabel("白纸黑字");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectContrast1").setLabel("contrast");
      controlP5.controller("effectContrast2").setLabel("contrast");
      controlP5.controller("effectContrast3").setLabel("contrast");
      controlP5.controller("effectContrast4").setLabel("contrast");
      break;
    case 1: // Portuguese
      controlP5.controller("effectContrast1").setLabel("contraste");
      controlP5.controller("effectContrast2").setLabel("contraste");
      controlP5.controller("effectContrast3").setLabel("contraste");
      controlP5.controller("effectContrast4").setLabel("contraste");
      break;
    case 2: // French
      controlP5.controller("effectContrast1").setLabel("contraste");
      controlP5.controller("effectContrast2").setLabel("contraste");
      controlP5.controller("effectContrast3").setLabel("contraste");
      controlP5.controller("effectContrast4").setLabel("contraste");
      break;
    case 3: // German
      controlP5.controller("effectContrast1").setLabel("Kontrast");
      controlP5.controller("effectContrast2").setLabel("Kontrast");
      controlP5.controller("effectContrast3").setLabel("Kontrast");
      controlP5.controller("effectContrast4").setLabel("Kontrast");
      break;
    case 4: // Chinese
      controlP5.controller("effectContrast1").setLabel("对比");
      controlP5.controller("effectContrast2").setLabel("对比");
      controlP5.controller("effectContrast3").setLabel("对比");
      controlP5.controller("effectContrast4").setLabel("对比");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectSaturation1").setLabel("saturation");
      controlP5.controller("effectSaturation2").setLabel("saturation");
      controlP5.controller("effectSaturation3").setLabel("saturation");
      controlP5.controller("effectSaturation4").setLabel("saturation");
      break;
    case 1: // Portuguese
      controlP5.controller("effectSaturation1").setLabel("saturação");
      controlP5.controller("effectSaturation2").setLabel("saturação");
      controlP5.controller("effectSaturation3").setLabel("saturação");
      controlP5.controller("effectSaturation4").setLabel("saturação");
      break;
    case 2: // French
      controlP5.controller("effectSaturation1").setLabel("saturation");
      controlP5.controller("effectSaturation2").setLabel("saturation");
      controlP5.controller("effectSaturation3").setLabel("saturation");
      controlP5.controller("effectSaturation4").setLabel("saturation");
      break;
    case 3: // German
      controlP5.controller("effectSaturation1").setLabel("Sättigung");
      controlP5.controller("effectSaturation2").setLabel("Sättigung");
      controlP5.controller("effectSaturation3").setLabel("Sättigung");
      controlP5.controller("effectSaturation4").setLabel("Sättigung");
      break;
    case 4: // Chinese
      controlP5.controller("effectSaturation1").setLabel("饱和");
      controlP5.controller("effectSaturation2").setLabel("饱和");
      controlP5.controller("effectSaturation3").setLabel("饱和");
      controlP5.controller("effectSaturation4").setLabel("饱和");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectHue1").setLabel("hue");
      controlP5.controller("effectHue2").setLabel("hue");
      controlP5.controller("effectHue3").setLabel("hue");
      controlP5.controller("effectHue4").setLabel("hue");
      break;
    case 1: // Portuguese
      controlP5.controller("effectHue1").setLabel("tonalidade");
      controlP5.controller("effectHue2").setLabel("tonalidade");
      controlP5.controller("effectHue3").setLabel("tonalidade");
      controlP5.controller("effectHue4").setLabel("tonalidade");
      break;
    case 2: // French
      controlP5.controller("effectHue1").setLabel("teinte");
      controlP5.controller("effectHue2").setLabel("teinte");
      controlP5.controller("effectHue3").setLabel("teinte");
      controlP5.controller("effectHue4").setLabel("teinte");
      break;
    case 3: // German
      controlP5.controller("effectHue1").setLabel("Geschrei");
      controlP5.controller("effectHue2").setLabel("Geschrei");
      controlP5.controller("effectHue3").setLabel("Geschrei");
      controlP5.controller("effectHue4").setLabel("Geschrei");
      break;
    case 4: // Chinese
      controlP5.controller("effectHue1").setLabel("色调");
      controlP5.controller("effectHue2").setLabel("色调");
      controlP5.controller("effectHue3").setLabel("色调");
      controlP5.controller("effectHue4").setLabel("色调");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("effectPaint1").setLabel("light paint");
      controlP5.controller("effectPaint2").setLabel("light paint");
      controlP5.controller("effectPaint3").setLabel("light paint");
      controlP5.controller("effectPaint4").setLabel("light paint");
      break;
    case 1: // Portuguese
      controlP5.controller("effectPaint1").setLabel("pintura com luz");
      controlP5.controller("effectPaint2").setLabel("pintura com luz");
      controlP5.controller("effectPaint3").setLabel("pintura com luz");
      controlP5.controller("effectPaint4").setLabel("pintura com luz");
      break;
    case 2: // French
      controlP5.controller("effectPaint1").setLabel("peindre avec lumière");
      controlP5.controller("effectPaint2").setLabel("peindre avec lumière");
      controlP5.controller("effectPaint3").setLabel("peindre avec lumière");
      controlP5.controller("effectPaint4").setLabel("peindre avec lumière");
      break;
    case 3: // German
      controlP5.controller("effectPaint1").setLabel("Licht farbe");
      controlP5.controller("effectPaint2").setLabel("Licht farbe");
      controlP5.controller("effectPaint3").setLabel("Licht farbe");
      controlP5.controller("effectPaint4").setLabel("Licht farbe");
      break;
    case 4: // Chinese
      controlP5.controller("effectPaint1").setLabel("光 油漆");
      controlP5.controller("effectPaint2").setLabel("光 油漆");
      controlP5.controller("effectPaint3").setLabel("光 油漆");
      controlP5.controller("effectPaint4").setLabel("光 油漆");
      break;
   } // end switch language
   
   
   //
   // BPM tab
   //
   
   switch (language) {
    case 0: // English
      controlP5.controller("layer1bpmVis").setLabel("bpm visible");
      controlP5.controller("layer2bpmVis").setLabel("bpm visible");
      controlP5.controller("layer3bpmVis").setLabel("bpm visible");
      controlP5.controller("layer4bpmVis").setLabel("bpm visible");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1bpmVis").setLabel("bpm visível");
      controlP5.controller("layer2bpmVis").setLabel("bpm visível");
      controlP5.controller("layer3bpmVis").setLabel("bpm visível");
      controlP5.controller("layer4bpmVis").setLabel("bpm visível");
      break;
    case 2: // French
      controlP5.controller("layer1bpmVis").setLabel("bpm visible");
      controlP5.controller("layer2bpmVis").setLabel("bpm visible");
      controlP5.controller("layer3bpmVis").setLabel("bpm visible");
      controlP5.controller("layer4bpmVis").setLabel("bpm visible");
      break;
    case 3: // German
      controlP5.controller("layer1bpmVis").setLabel("bpm sichtbar");
      controlP5.controller("layer2bpmVis").setLabel("bpm sichtbar");
      controlP5.controller("layer3bpmVis").setLabel("bpm sichtbar");
      controlP5.controller("layer4bpmVis").setLabel("bpm sichtbar");
      break;
    case 4: // Chinese
      controlP5.controller("layer1bpmVis").setLabel("bpm 看得见的");
      controlP5.controller("layer2bpmVis").setLabel("bpm 看得见的");
      controlP5.controller("layer3bpmVis").setLabel("bpm 看得见的");
      controlP5.controller("layer4bpmVis").setLabel("bpm 看得见的");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("layer1bpmTime").setLabel("bpm time");
      controlP5.controller("layer2bpmTime").setLabel("bpm time");
      controlP5.controller("layer3bpmTime").setLabel("bpm time");
      controlP5.controller("layer4bpmTime").setLabel("bpm time");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1bpmTime").setLabel("bpm tempo");
      controlP5.controller("layer2bpmTime").setLabel("bpm tempo");
      controlP5.controller("layer3bpmTime").setLabel("bpm tempo");
      controlP5.controller("layer4bpmTime").setLabel("bpm tempo");
      break;
    case 2: // French
      controlP5.controller("layer1bpmTime").setLabel("bpm temps");
      controlP5.controller("layer2bpmTime").setLabel("bpm temps");
      controlP5.controller("layer3bpmTime").setLabel("bpm temps");
      controlP5.controller("layer4bpmTime").setLabel("bpm temps");
      break;
    case 3: // German
      controlP5.controller("layer1bpmTime").setLabel("bpm Zeit");
      controlP5.controller("layer2bpmTime").setLabel("bpm Zeit");
      controlP5.controller("layer3bpmTime").setLabel("bpm Zeit");
      controlP5.controller("layer4bpmTime").setLabel("bpm Zeit");
      break;
    case 4: // Chinese
      controlP5.controller("layer1bpmTime").setLabel("bpm 时间");
      controlP5.controller("layer2bpmTime").setLabel("bpm 时间");
      controlP5.controller("layer3bpmTime").setLabel("bpm 时间");
      controlP5.controller("layer4bpmTime").setLabel("bpm 时间");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("layer1bpmMovie").setLabel("bpm movie");
      controlP5.controller("layer2bpmMovie").setLabel("bpm movie");
      controlP5.controller("layer3bpmMovie").setLabel("bpm movie");
      controlP5.controller("layer4bpmMovie").setLabel("bpm movie");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1bpmMovie").setLabel("bpm vídeo");
      controlP5.controller("layer2bpmMovie").setLabel("bpm vídeo");
      controlP5.controller("layer3bpmMovie").setLabel("bpm vídeo");
      controlP5.controller("layer4bpmMovie").setLabel("bpm vídeo");
      break;
    case 2: // French
      controlP5.controller("layer1bpmMovie").setLabel("bpm film");
      controlP5.controller("layer2bpmMovie").setLabel("bpm film");
      controlP5.controller("layer3bpmMovie").setLabel("bpm film");
      controlP5.controller("layer4bpmMovie").setLabel("bpm film");
      break;
    case 3: // German
      controlP5.controller("layer1bpmMovie").setLabel("bpm film");
      controlP5.controller("layer2bpmMovie").setLabel("bpm film");
      controlP5.controller("layer3bpmMovie").setLabel("bpm film");
      controlP5.controller("layer4bpmMovie").setLabel("bpm film");
      break;
    case 4: // Chinese
      controlP5.controller("layer1bpmMovie").setLabel("bpm 电影");
      controlP5.controller("layer2bpmMovie").setLabel("bpm 电影");
      controlP5.controller("layer3bpmMovie").setLabel("bpm 电影");
      controlP5.controller("layer4bpmMovie").setLabel("bpm 电影");
      break;
   } // end switch language
   
   
   //
   // mapping tab
   //
   
   switch (language) {
    case 0: // English
      controlP5.controller("mapping1").setLabel("quad mapping");
      controlP5.controller("mapping2").setLabel("quad mapping");
      controlP5.controller("mapping3").setLabel("quad mapping");
      controlP5.controller("mapping4").setLabel("quad mapping");
      break;
    case 1: // Portuguese
      controlP5.controller("mapping1").setLabel("mapeamento retangular");
      controlP5.controller("mapping2").setLabel("mapeamento retangular");
      controlP5.controller("mapping3").setLabel("mapeamento retangular");
      controlP5.controller("mapping4").setLabel("mapeamento retangular");
      break;
    case 2: // French
      controlP5.controller("mapping1").setLabel("mapping rectangulaire");
      controlP5.controller("mapping2").setLabel("mapping rectangulaire");
      controlP5.controller("mapping3").setLabel("mapping rectangulaire");
      controlP5.controller("mapping4").setLabel("mapping rectangulaire");
      break;
    case 3: // German
      controlP5.controller("mapping1").setLabel("rechteckig mapping");
      controlP5.controller("mapping2").setLabel("rechteckig mapping");
      controlP5.controller("mapping3").setLabel("rechteckig mapping");
      controlP5.controller("mapping4").setLabel("rechteckig mapping");
      break;
    case 4: // Chinese
      controlP5.controller("mapping1").setLabel("mapping 矩形的");
      controlP5.controller("mapping2").setLabel("mapping 矩形的");
      controlP5.controller("mapping3").setLabel("mapping 矩形的");
      controlP5.controller("mapping4").setLabel("mapping 矩形的");
      break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("bmapping1").setLabel("curved mapping");
      controlP5.controller("bmapping2").setLabel("curved mapping");
      controlP5.controller("bmapping3").setLabel("curved mapping");
      controlP5.controller("bmapping4").setLabel("curved mapping");
      break;
    case 1: // Portuguese
      controlP5.controller("bmapping1").setLabel("mapeamento curvo");
      controlP5.controller("bmapping2").setLabel("mapeamento curvo");
      controlP5.controller("bmapping3").setLabel("mapeamento curvo");
      controlP5.controller("bmapping4").setLabel("mapeamento curvo");
      break;
    case 2: // French
      controlP5.controller("bmapping1").setLabel("curved mapping");
      controlP5.controller("bmapping2").setLabel("curved mapping");
      controlP5.controller("bmapping3").setLabel("curved mapping");
      controlP5.controller("bmapping4").setLabel("curved mapping");
      break;
    case 3: // German
      controlP5.controller("bmapping1").setLabel("krumm mapping");
      controlP5.controller("bmapping2").setLabel("krumm mapping");
      controlP5.controller("bmapping3").setLabel("krumm mapping");
      controlP5.controller("bmapping4").setLabel("krumm mapping");
      break;
    case 4: // Chinese
      controlP5.controller("bmapping1").setLabel("mapping 弯曲的");
      controlP5.controller("bmapping2").setLabel("mapping 弯曲的");
      controlP5.controller("bmapping3").setLabel("mapping 弯曲的");
      controlP5.controller("bmapping4").setLabel("mapping 弯曲的");
      break;
   } // end switch language
   
   
   //
   // audio tab
   //
   
   switch (language) {
    case 0: // English
      controlP5.controller("layer1volume").setLabel("volume");
      controlP5.controller("layer2volume").setLabel("volume");
      controlP5.controller("layer3volume").setLabel("volume");
      controlP5.controller("layer4volume").setLabel("volume");
      break;
    case 1: // Portuguese
      controlP5.controller("layer1volume").setLabel("volume");
      controlP5.controller("layer2volume").setLabel("volume");
      controlP5.controller("layer3volume").setLabel("volume");
      controlP5.controller("layer4volume").setLabel("volume");
      break;
    case 2: // French
      controlP5.controller("layer1volume").setLabel("volume");
      controlP5.controller("layer2volume").setLabel("volume");
      controlP5.controller("layer3volume").setLabel("volume");
      controlP5.controller("layer4volume").setLabel("volume");
      break;
    case 3: // German
      controlP5.controller("layer1volume").setLabel("Volumen");
      controlP5.controller("layer2volume").setLabel("Volumen");
      controlP5.controller("layer3volume").setLabel("Volumen");
      controlP5.controller("layer4volume").setLabel("Volumen");
      break;
    case 4: // Chinese
      controlP5.controller("layer1volume").setLabel("体积");
      controlP5.controller("layer2volume").setLabel("体积");
      controlP5.controller("layer3volume").setLabel("体积");
      controlP5.controller("layer4volume").setLabel("体积");
      break;
   } // end switch language
   
   
   //
   // prefs tab
   //
   
   switch (language) {
    case 0: // English
      controlP5.group("outputResolution").setLabel("output resolution"); break;
    case 1: // Portuguese
      controlP5.controller("outputResolution").setLabel("resolução de saída"); break;
    case 2: // French
      controlP5.controller("outputResolution").setLabel("output resolution"); break;
    case 3: // German
      controlP5.controller("outputResolution").setLabel("output resolution"); break;
    case 4: // Chinese
      controlP5.controller("outputResolution").setLabel("output resolution"); break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("outputXpos").setLabel("output X position"); break;
    case 1: // Portuguese
      controlP5.controller("outputXpos").setLabel("posição X da saída"); break;
    case 2: // French
      controlP5.controller("outputXpos").setLabel("output X position"); break;
    case 3: // German
      controlP5.controller("outputXpos").setLabel("output X position"); break;
    case 4: // Chinese
      controlP5.controller("outputXpos").setLabel("output X position"); break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("outputYpos").setLabel("output Y position"); break;
    case 1: // Portuguese
      controlP5.controller("outputYpos").setLabel("posição Y da saída"); break;
    case 2: // French
      controlP5.controller("outputYpos").setLabel("output Y position"); break;
    case 3: // German
      controlP5.controller("outputYpos").setLabel("output Y position"); break;
    case 4: // Chinese
      controlP5.controller("outputYpos").setLabel("output Y position"); break;
   } // end switch language
   
   switch (language) {
    case 0: // English
      controlP5.controller("syphonOutput").setLabel("Syphon output (Mac only)"); break;
    case 1: // Portuguese
      controlP5.controller("syphonOutput").setLabel("saída Syphon (Mac)"); break;
    case 2: // French
      controlP5.controller("syphonOutput").setLabel("Syphon output (Mac only)"); break;
    case 3: // German
      controlP5.controller("syphonOutput").setLabel("Syphon output (Mac only)"); break;
    case 4: // Chinese
      controlP5.controller("syphonOutput").setLabel("Syphon output (Mac only)"); break;
   } // end switch language
   
   
   
} // end QCtranslate()
