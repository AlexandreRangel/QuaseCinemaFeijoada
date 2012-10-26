
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  directory code:
//  QCrandomMov(selectedLayer)
//  QCrandomImage(selectedLayer)
//  QCrandomDir(selectedLayer)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void QCrandomMov(int layer){
 
  switch (layer) { 
      case 0: // layer 1
        //tempString = rootFolder + dirs1[selectedDir1] +"/";
        //println ("tempString: "+tempString+"\n");
        //fileNames = listFileNames(tempString, txtFilter);
        tempString = rootFolder + dirs1[selectedDir1] +"/"+ fileNames1[int(random(fileNames1.length)-1)];
        println ("\nnew movie layer 1: "+tempString+"\n");
        newMovie = tempString;
        changeMovie1 = true;
        break; // break layer 1
      case 1: // layer 2
        tempString = rootFolder + dirs2[selectedDir2] +"/"+ fileNames2[int(random(fileNames2.length)-1)];
        println ("\nnew movie layer 2: "+tempString+"\n");
        newMovie = tempString;
        changeMovie2 = true;
        break; // break layer 2
      case 2: // layer 3
        tempString = rootFolder + dirs3[selectedDir3] +"/"+ fileNames3[int(random(fileNames3.length)-1)];
        println ("\nnew movie layer 3: "+tempString+"\n");
        newMovie = tempString;
        changeMovie3 = true;
        break; // break layer 3
      case 3: // layer 4
        tempString = rootFolder + dirs4[selectedDir4] +"/"+ fileNames4[int(random(fileNames4.length)-1)];
        println ("\nnew movie layer 4: "+tempString+"\n");
        newMovie = tempString;
        changeMovie4 = true;
        break; // break layer 2
      } // end switch selectedLayer
  
} // end QCrandomMov



public void QCrandomImage(int layer){

// xxx 
  // switch (layer) { 
  //     case 0: // layer 1
  //       //println ("tempString: "+tempString+"\n");
  //       fileNames = listFileNames(defaultFolderPathImage, txtFilterImage);
  //       tempString = defaultFolderPathImage + OSseparator + fileNames[int(random(fileNames.length))];
  //       //println ("tempString: "+tempString+"\n");
  //       myImage1 = loadImage(tempString);
  //       break; // break layer 1
  //     case 1: // layer 2
  //       fileNames = listFileNames(defaultFolderPathImage, txtFilterImage);
  //       tempString = defaultFolderPathImage + OSseparator + fileNames[int(random(fileNames.length))];
  //       myImage2 = loadImage(tempString);
  //       break; // break layer 2
  //     case 2: // layer 3
  //       fileNames = listFileNames(defaultFolderPathImage, txtFilterImage);
  //       tempString = defaultFolderPathImage + OSseparator + fileNames[int(random(fileNames.length))];
  //       myImage3 = loadImage(tempString);
  //       break; // break layer 3
  //     case 3: // layer 4
  //       fileNames = listFileNames(defaultFolderPathImage, txtFilterImage);
  //       tempString = defaultFolderPathImage + OSseparator + fileNames[int(random(fileNames.length))];
  //       myImage4 = loadImage(tempString);
  //       break; // break layer 2
  //     } // end switch selectedLayer
  
} // end QCrandomImage



public void QCrandomDir(int layer){
 
  switch (layer) { 
      case 0: // layer 1
        selectedDir1 = int(random(fileCounter1));
        dirPageSelected1 = int(selectedDir1/21);
        println("dirPageSelected1: "+dirPageSelected1);
        tempString = rootFolder + dirs1[selectedDir1] +"/";
        fileNames1 = listFileNames(tempString, txtFilter);
        break; // break layer 1
      case 1: // layer 2
        selectedDir2 = int(random(fileCounter2));
        dirPageSelected2 = int(selectedDir2/21);
        tempString = rootFolder + dirs2[selectedDir2] +"/";
        fileNames2 = listFileNames(tempString, txtFilter);
        break; // break layer 2
      case 2: // layer 3
        selectedDir3 = int(random(fileCounter3));
        dirPageSelected3 = int(selectedDir3/21);
        tempString = rootFolder + dirs3[selectedDir3] +"/";
        fileNames3 = listFileNames(tempString, txtFilter);
        break; // break layer 3
      case 3: // layer 4
        selectedDir4 = int(random(fileCounter4));
        dirPageSelected4 = int(selectedDir4/21);
        tempString = rootFolder + dirs4[selectedDir4] +"/";
        fileNames4 = listFileNames(tempString, txtFilter);
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

java.io.FilenameFilter txtFilterImage = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".png")
    || name.toLowerCase().endsWith(".jpg")
    || name.toLowerCase().endsWith(".jpeg")
    || name.toLowerCase().endsWith(".gif");
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
