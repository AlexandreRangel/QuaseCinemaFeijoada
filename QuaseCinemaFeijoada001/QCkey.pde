void keyPressed(){
 
  projectedQuads.keyPressed();
  
  switch(key) {
    case '1':
       selectedLayer = 0; break; 
    case '2':
       selectedLayer = 1; break;
    case '3':
       selectedLayer = 2; break;
    case '4':
       selectedLayer = 3; break;
       
    case 'd':
      for(int i = 0; i< 200; i++) { dirs1[i]=""; } // clear dirs
      setInputFolder(selectFolder("select library master folder"));
  
      //String folderPath = selectFolder();
//    if (folderPath == null) {
//      println("No folder was selected..."); // if no folder was selected
//    } 
//    else {
//      // println(folderPath);
//      fileNames = listFileNames(folderPath, txtFilter);
//      println("filenames: \n"+ fileNames[0]);
//      //dirListBox.addItem(fileNames[0],0);
////      for(int i=0;i<fileNames.length;i++) { //
////        dirListBox.addItem(fileNames[i],i);
////      }
//      
//    }
break; // break 'd'
    
  case 'M':
    selectedDirMp3 = int(random(fileNamesMp3.length));
    tempString = defaultFolderPathMp3 +"/"+fileNamesMp3[selectedDirMp3];
    audio1.close();
    audio1 = minim.loadFile(tempString,512);
    audio1.loop();
    break;
  
  case 'r': //r
    //String tempString = rootFolder + "/" + fileNames[int(random(fileNames.length))]; // works if master root is selected
    QCrandomMov(selectedLayer);  
    break; // break 'r'
    
  case 'i': //
   effectInvert1 = !(effectInvert1);
  break; // break 'i'
    
  } // end switch key
  
  if (keyCode == ENTER) {
    switch (selectedLayer) { 
      case 0: layer1visibility = !(layer1visibility); ((Toggle)controlP5.controller("layer1visibility")).toggle(); break; // layer 1
      case 1: layer2visibility = !(layer2visibility); ((Toggle)controlP5.controller("layer2visibility")).toggle(); break; // layer 2
      case 2: layer3visibility = !(layer3visibility); ((Toggle)controlP5.controller("layer3visibility")).toggle(); break; // layer 3
      case 3: layer4visibility = !(layer4visibility); ((Toggle)controlP5.controller("layer4visibility")).toggle(); break; // layer 4
    } // end switch
   } // end ENTER
  
  if (key == CODED) {
      if (keyCode == KeyEvent.VK_F1) { controlWindow.activateTab("default"); }
      if (keyCode == KeyEvent.VK_F2) { controlWindow.activateTab("Effects"); }
      if (keyCode == KeyEvent.VK_F3) { controlWindow.activateTab("Rhythm"); }
      if (keyCode == KeyEvent.VK_F4) { controlWindow.activateTab("Sequencer"); }
      if (keyCode == KeyEvent.VK_F5) { controlWindow.activateTab("Mapping"); }
      if (keyCode == KeyEvent.VK_F6) { controlWindow.activateTab("3D"); }
      if (keyCode == KeyEvent.VK_F7) { controlWindow.activateTab("Playlist"); }
      if (keyCode == KeyEvent.VK_F8) { controlWindow.activateTab("Audio"); }
      if (keyCode == KeyEvent.VK_F9) { controlWindow.activateTab("Prefs"); }
      if (keyCode == KeyEvent.VK_F10) { controlWindow.activateTab("Help"); }
    } // end if keyCoded  
    
} // end keyPressed
