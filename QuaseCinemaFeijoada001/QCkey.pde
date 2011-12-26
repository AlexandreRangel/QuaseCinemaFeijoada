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
       
    case 'd': // select root dir
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
    
  case 'M': // random audio file
    selectedDirMp3 = int(random(fileNamesMp3.length));
    tempString = defaultFolderPathMp3 +"/"+fileNamesMp3[selectedDirMp3];
    audio1.close();
    audio1 = minim.loadFile(tempString,512);
    audio1.loop();
    break; // end M
  
  case 'r': // random movie
    //String tempString = rootFolder + "/" + fileNames[int(random(fileNames.length))]; // works if master root is selected
    QCrandomMov(selectedLayer);  
    break; // break 'r'
    
  case 'R': // random dir
    QCrandomDir(selectedLayer);  
    break; // break 'R'
    
  case 'i': // marks in
   switch (selectedLayer) {
     case 0: layer1in = myMovie1.frame(); break;
     case 1: layer2in = myMovie2.frame(); break;
     case 2: layer3in = myMovie3.frame(); break;
     case 3: layer4in = myMovie4.frame(); break;
   } // end switch
   break; // break 'i'
   
  case 'o': // marks out
   switch (selectedLayer) {
     case 0: layer1out = myMovie1.frame(); break;
     case 1: layer2out = myMovie2.frame(); break;
     case 2: layer3out = myMovie3.frame(); break;
     case 3: layer4out = myMovie4.frame(); break;
   } // end switch
   break; // break 'o'
   
  case 'I': // clears in
   switch (selectedLayer) {
     case 0: layer1in = 0; break;
     case 1: layer2in = 0; break;
     case 2: layer3in = 0; break;
     case 3: layer4in = 0; break;
   } // end switch
   break; // break 'I'
   
  case 'O': // clears out
   switch (selectedLayer) {
     case 0: layer1out = int(myMovie1.length()); break;
     case 1: layer2out = int(myMovie2.length()); break;
     case 2: layer3out = int(myMovie3.length()); break;
     case 3: layer4out = int(myMovie4.length()); break;
   } // end switch
   break; // break 'O'
  
  case 'P': // start-stop recording movie
      recordingMovie = !recordingMovie;
      if (recordingMovie) {
        //frameRate(30);
        //mm = new GSMovieMaker(this, outputWidth, outputHeight, "output.ogg", GSMovieMaker.THEORA, GSMovieMaker.BEST, 30);
        //mm = new GSMovieMaker(this, outputWidth, outputHeight, "output.mj2", GSMovieMaker.MJPEG2K, GSMovieMaker.BEST, 30);
        //mm.start();
      } else {
        //mm.finish(); frameRate(60);
      }
      break; // break 'P'
      
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
