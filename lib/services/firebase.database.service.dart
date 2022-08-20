import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes_app/model/models.dart';


 class DatabaseServices {

  Stream<List<Recipe>> readRecipes() => FirebaseFirestore.instance
  .collection('Recipes')// Recipes collection
  .snapshots() // All collection documents with json info
  .map((snapshot) => snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  //
  writeRecipeImg() async {
    
    //Configuring parameters of whanted files
    final mealImg = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png','jpg'],
    );

    //Check if null (implement)

    //Saving image name and path from phone
    final path = mealImg!.files.single.path!;
    final fileName = mealImg.files.single.name; 
  }
}
