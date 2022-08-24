
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'as firebase_core;
import 'package:recipes_app/model/models.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:tuple/tuple.dart';
import 'package:path/path.dart' as p;


 class StorageServices {  

  // initializing cloud storadge
  final firebase_storage.FirebaseStorage storage = 
    firebase_storage.FirebaseStorage.instance;  

    Future<void> uploadFile(
      String filePath,
      String fileName,
    )  async {
      // Pasiimu faila pagal kelia
      File file = File(filePath);

      //Bandau ikelt i firebase storadge i test folder
      try{
         await storage.ref('test/$fileName').putFile(file);
       
      } 
      on firebase_core.FirebaseException catch(e) 
      {
          print(e.code);  
      }
    }

  Future UploadFile2(String path) async{
    //Creating storadge reference
    final ref = storage.ref()
        .child('test')// place
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');// name

        //Puting file in storage. Path from phone: path
        final result = await ref.putFile(File(path));

        //Getting image URL
        final imgURL = await result.ref.getDownloadURL();
        
        //Save image url to local/ db??

        //doing bloc state changes?
  }

  Future<List<String>> pickRecipeImg() async {
    
    //nustatau tinkamu failu param
    final    mealImg = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png','jpg'],
    );

    // tikrinu ar null, jei nebuvo rasta

    //issaugau pavadinima ir kelia
    final path = mealImg!.files.single.path!;
    final fileName = mealImg.files.single.name;
    List<String> data = [path,fileName];


    //testing
    print(path);
    print(fileName);
   
     //final data = Tuple2<String,String>(path, fileName);
     return data;    
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
