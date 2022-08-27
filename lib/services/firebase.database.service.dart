import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<List<Category>> readCategoriesQuery() async {
   QuerySnapshot<Map<String, dynamic>> snapshot = await
   _db.collection('Categories').get();

   //Luzta mappinant
   return snapshot.docs
        .map((docSnapshot) => Category.fromDocSnap(docSnapshot))
        .toList();
  }

   uploadRecipeData(Recipe recipe) async {
    
    await _db.collection('Recipes').doc(recipe.name).set(recipe.toJson());
  }
   
  
}
