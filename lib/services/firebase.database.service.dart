import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes_app/model/models.dart';


 class DatabaseServices {

  Stream<List<Recipe>> readRecipes() => FirebaseFirestore.instance
  .collection('Recipes')// kolekcija recipes
  .snapshots() // visi jos dokumentai json info
  .map((snapshot) => snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  writeRecipeImg() async {
    
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

    //testing
    print(path);
    print(fileName);
  }
}
