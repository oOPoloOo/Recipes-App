import 'package:image_picker/image_picker.dart';

class PhotoInfo {
    
     String? path;
     String? storageURL;
     ImageSource? imgSource;

    PhotoInfo({     
       this.path,
       this.storageURL,
       this.imgSource,
        
    });

    String get localPath { return path!; }
    String get url { return storageURL!; }
    ImageSource get source { return imgSource!; }

    void set localPath (String newPath) {
      path = newPath;
    }
    void set url(String newUrl) {
      storageURL = newUrl;
    }
    void set source(ImageSource newSource) {
      imgSource = newSource;
    }   
  }