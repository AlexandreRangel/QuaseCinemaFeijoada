
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  directory code,
//  QCrandomMov(selectedLayer)
//  QCrandomDir(selectedLayer)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void QCrandomMov(int layer){
 
  switch (layer) { 
      case 0: // layer 1
        tempString = rootFolder + dirs1[selectedDir1] +"/";
        //println ("tempString: "+tempString+"\n");
        fileNames = listFileNames(tempString, txtFilter);
        tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames[int(random(fileNames.length))];
        //println ("tempString: "+tempString+"\n");
        myMovie1.delete(); myMovie1 = new GSMovie(this, tempString); // myMovie1.read(); myMovie1.play();
        layer1in = 0; layer1out = 0;
        //if(layer1loop){ myMovie1.loop(); }
        break; // break layer 1
      case 1: // layer 2
        tempString = rootFolder + dirs2[selectedDir2] +"/";
        fileNames = listFileNames(tempString, txtFilter);
        tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames[int(random(fileNames.length))];
        myMovie2.delete(); myMovie2 = new GSMovie(this, tempString); //myMovie2.read(); myMovie2.play();
        layer2in = 0; layer2out = 0;
        //if(layer2loop){ myMovie2.loop(); }
        break; // break layer 2
      case 2: // layer 3
        tempString = rootFolder + dirs3[selectedDir3] +"/";
        fileNames = listFileNames(tempString, txtFilter);
        tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames[int(random(fileNames.length))];
        myMovie3.delete(); myMovie3 = new GSMovie(this, tempString); // myMovie3.read(); myMovie3.play();
        layer3in = 0; layer3out = 0;
        //if(layer3loop){ myMovie3.loop(); }
        break; // break layer 3
      case 3: // layer 4
        tempString = rootFolder + dirs4[selectedDir4] +"/";
        fileNames = listFileNames(tempString, txtFilter);
        tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames[int(random(fileNames.length))];
        myMovie4.delete(); myMovie4 = new GSMovie(this, tempString); // myMovie4.read(); myMovie4.play();
        layer4in = 0; layer4out = 0;
        //if(layer4loop){ myMovie4.loop(); }
        break; // break layer 2
      } // end switch selectedLayer
  
} // end QCrandomMov

public void QCrandomDir(int layer){
 
  switch (layer) { 
      case 0: // layer 1
        selectedDir1 = int(random(fileCounter1));
        
        break; // break layer 1
      case 1: // layer 2
        selectedDir2 = int(random(fileCounter2));
        
        break; // break layer 2
      case 2: // layer 3
        selectedDir3 = int(random(fileCounter3));
        
        break; // break layer 3
      case 3: // layer 4
        selectedDir4 = int(random(fileCounter4));
        
        break; // break layer 2
      } // end switch selectedLayer
  
} // end QCrandomMov



//
// file filters
//

java.io.FilenameFilter txtFilter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".mov")
    || name.toLowerCase().endsWith(".avi")
    || name.toLowerCase().endsWith(".mp4")
    || name.toLowerCase().endsWith(".ogg")
    || name.toLowerCase().endsWith(".mpg");
  }
};

java.io.FilenameFilter txtFilterMp3 = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".mp3")
    || name.toLowerCase().endsWith(".wav");
  }
};


//
// This function returns all the files in a directory as an array of Strings  
//

String[] listFileNames(String dir,java.io.FilenameFilter extension) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list(extension);
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

//
// select an input dir
//

File[] listFiles(String dir) {
  
    File file = new File(dir);

    if (file.isDirectory()) {
	File[] files = file.listFiles();
	return files;
    } else {
	// If it's not a directory
	return null;
    }
}


// ------ folder selection dialog + init visualization ------
void setInputFolder(String theFolderPath) {
  // get files on harddisk
  println("\n"+theFolderPath+"\n");
  FileSystemItem selectedFolder = new FileSystemItem(new File(theFolderPath));
  selectedFolder.printDepthFirst();
  rootFolder = theFolderPath + "/";
  println("\n rootFolder: "+theFolderPath+"\n");
}


class FileSystemItem {
  File file;
  public FileSystemItem[] children;
  int childCount;

  // ------ constructor ------
  FileSystemItem(File theFile) {
    file = theFile;

    if (file.isDirectory()) {
      String[] contents = file.list();
      if (contents != null) {
        // Sort the file names in case insensitive order
        contents = sort(contents);

        children = new FileSystemItem[contents.length];
        for (int i = 0 ; i < contents.length; i++) {
          // skip the . and .. directory entries on Unix systems
          if (contents[i].equals(".") || contents[i].equals("..")
            || contents[i].substring(0,1).equals(".")) {
            continue;
          }
          File childFile = new File(file, contents[i]);
          // skip any file that appears to be a symbolic link
          try {
            String absPath = childFile.getAbsolutePath();
            String canPath = childFile.getCanonicalPath();
            if (!absPath.equals(canPath)) continue;
          }
          catch (IOException e) {
          }
          FileSystemItem child = new FileSystemItem(childFile);
          children[childCount] = child;
          childCount++;
        }
      }
    }
  }



// ------ print and debug functions ------

// Depth First Search
void printDepthFirst() {
  //println("printDepthFirst");
  // global fileCounter1
  fileCounter1 = 0; fileCounter2 = 0; fileCounter3 = 0; fileCounter4 = 0; fileCounterMp3 = 0; 
  printDepthFirst(0,-1);
  //println(fileCounter1+" files");
}
  
  
void printDepthFirst(int depth, int indexToParent) {

    if (file.isDirectory()) {
      //println(file.getName());
      dirs1[fileCounter1] = file.getName();
      dirs2[fileCounter2] = file.getName();
      dirs3[fileCounter3] = file.getName();
      dirs4[fileCounter4] = file.getName();
      indexToParent = fileCounter1; indexToParent = fileCounter2; indexToParent = fileCounter3; indexToParent = fileCounter4;
      fileCounter1++; fileCounter2++; fileCounter3++; fileCounter4++;
    }
    
    // now handle the children, if any
    for (int i = 0; i < childCount; i++) {
      if (depth == 1) { break; }
      children[i].printDepthFirst(depth+1,indexToParent);
    } // end for
    
  }

}

