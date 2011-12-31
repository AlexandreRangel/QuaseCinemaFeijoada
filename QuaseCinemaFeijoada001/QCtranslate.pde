
public void QCtranslate() {
  
   switch (language) {
        case 0: languageList.setLabel("language"); break;
        case 1: languageList.setLabel("lingua"); break;
        case 2: languageList.setLabel("idiome"); break;
        case 3: languageList.setLabel("sprachlich"); break;
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
        case 2: controlWindow.tab("Sequencer").setLabel(" Sequentiel"); break; // French
        case 3: controlWindow.tab("Sequencer").setLabel(" Sequencer"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // English
        case 1: controlWindow.tab("Mapping").setLabel(" Mapeamento"); break; // Portuguese
        case 2: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // French
        case 3: controlWindow.tab("Mapping").setLabel(" Mapping"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("3D").setLabel(" 3D"); break; // English
        case 1: controlWindow.tab("3D").setLabel(" 3D"); break; // Portuguese
        case 2: controlWindow.tab("3D").setLabel(" 3D"); break; // French
        case 3: controlWindow.tab("3D").setLabel(" 3D"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // English
        case 1: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // Portuguese
        case 2: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // French
        case 3: controlWindow.tab("Playlist").setLabel(" Playlist"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Audio").setLabel(" Audio"); break; // English
        case 1: controlWindow.tab("Audio").setLabel(" Audio"); break; // Portuguese
        case 2: controlWindow.tab("Audio").setLabel(" Audio"); break; // French
        case 3: controlWindow.tab("Audio").setLabel(" Audio"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Prefs").setLabel(" Prefs"); break; // English
        case 1: controlWindow.tab("Prefs").setLabel(" Prefs"); break; // Portuguese
        case 2: controlWindow.tab("Prefs").setLabel(" Prefs"); break; // French
        case 3: controlWindow.tab("Prefs").setLabel(" Prefs"); break; // German
   } // end switch language
   
   switch (language) {
        case 0: controlWindow.tab("Help").setLabel(" Help"); break; // English
        case 1: controlWindow.tab("Help").setLabel(" Help"); break; // Portuguese
        case 2: controlWindow.tab("Help").setLabel(" Help"); break; // French
        case 3: controlWindow.tab("Help").setLabel(" Help"); break; // German
   } // end switch language
  
  
   
}
