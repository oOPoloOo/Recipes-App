
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'as firebase_core;
import 'package:recipes_app/model/models.export.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:tuple/tuple.dart';
import 'package:path/path.dart' as p;


 class StorageServices {  

  // initializing cloud storadge
  final firebase_storage.FirebaseStorage storage = 
    firebase_storage.FirebaseStorage.instance;  

    // Future<void> uploadFile(
    //   String filePath,
    //   String fileName,
    // )  async {
    //   // Pasiimu faila pagal kelia
    //   File file = File(filePath);

    //   //Bandau ikelt i firebase storadge i test folder
    //   try{
    //      await storage.ref('test/$fileName').putFile(file);
       
    //   } 
    //   on firebase_core.FirebaseException catch(e) 
    //   {
    //       print(e.code);  
    //   }
    // }

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

        //doing bloc state changes?
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
