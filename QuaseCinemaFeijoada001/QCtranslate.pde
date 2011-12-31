
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
        case 4: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // Chinese
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("3D").setLabel(" 3D"); break; // English
        case 1: controlWindow.tab("3D").setLabel(" 3D"); break; // Portuguese
        case 2: controlWindow.tab("3D").setLabel(" 3D"); break; // French
        case 3: controlWindow.tab("3D").setLabel(" 3D"); break; // German
        case 4: controlWindow.tab("3D").setLabel(" 3D"); break; // Chinese
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
      controlP5.controller("layer1loop").setLabel("schleife");
      controlP5.controller("layer2loop").setLabel("schleife");
      controlP5.controller("layer3loop").setLabel("schleife");
      controlP5.controller("layer4loop").setLabel("schleife");
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
   
} // end QCtranslate()
