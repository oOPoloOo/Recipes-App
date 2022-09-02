
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as p;


 class StorageServices {  

  // initializing cloud storadge
  final firebase_storage.FirebaseStorage storage = 
    firebase_storage.FirebaseStorage.instance;  

  Future<String> UploadFile2(String path) async{
    //Creating storadge reference
    final ref = storage.ref()
        .child('test')// place
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');// name

        //Puting file in storage. Path from phone: path
        final result = await ref.putFile(File(path));

        //Getting image URL
        final imgURL = await result.ref.getDownloadURL();
        

        return imgURL;  
  } 

  Future<firebase_storage.ListResult> listFiles() async {

    //Returns all items names in cloud storage 'test' bucket
    firebase_storage.ListResult results = await storage.ref('test').listAll();

    //test
    results.items.forEach((firebase_storage.Reference ref) {
        print('Found file: $ref');
     });

     return results;
  }

  //Gets image url from cloud storage
  Future<String> downloadImgURL(String imageName) async {
    String url = await storage.ref('test/$imageName').getDownloadURL();
    return url;
  }
}
