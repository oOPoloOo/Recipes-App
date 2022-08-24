import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes_app/model/models.dart';


 class DatabaseServices {

 final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Using with StreamBuilder
  Stream<List<Recipe>> readRecipesStream() => FirebaseFirestore.instance
  .collection('Recipes')// Recipes collection
  .snapshots() // All collection documents with json info
  .map((snapshot) => snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  //Using with QuerySnapshot
  Future<List<Recipe>> readRecipesQuery() async {
   QuerySnapshot<Map<String, dynamic>> snapshot = await
   _db.collection('Recipes').get();

   return snapshot.docs
        .map((docSnapshot) => Recipe.fromDocSnap(docSnapshot))
        .toList();
  }

   uploadRecipeData(Recipe recipe) async {
    await _db.collection("Recipes").doc(recipe.name).set(recipe.toJson());
  }
   
  // Move to somewhere else
   takeFromPhoneRecipeImg() async {
    
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
