import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_app/model/models.export.dart';


 class DatabaseServices {

 final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Using with StreamBuilder
  Stream<List<Recipe>> readRecipesStream() => FirebaseFirestore.instance
  .collection('Recipes')// Recipes collection
  .snapshots() // All collection documents with json info
  .map((snapshot) => snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  //Using with StreamBuilder
  Stream<List<Comment>> readCommentsStream(String mealName) => 
  _db
  .collection('Recipes')// Recipes collection
  .doc(mealName)
  .collection('Comments')
  .snapshots() // All collection documents with json info
  .map((snapshot) => snapshot.docs.map((doc) => Comment.fromJson(doc.data())).toList());

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
  
   return snapshot.docs
        .map((docSnapshot) => Category.fromDocSnap(docSnapshot))
        .toList();
  }

  uploadRecipeData(Recipe recipe) async {
    
    await _db.collection('Recipes').doc(recipe.name).set(recipe.toJson());
  }

  Future<bool> doCommentsExists(String mealName) async {

     final snapshots = await _db.collection("Recipes")
     .doc(mealName)
     .collection('Comments')
     .snapshots();
      if (snapshots.length == 0) {
       return false;
      } 
      else return true;
  }
 
 //Using with QuerySnapshot 
  Future<List<Comment>> readCommentsQuery(String mealName) async {
   QuerySnapshot<Map<String, dynamic>> snapshot = await
   _db.collection('Recipes')
   .doc(mealName)
   .collection('Comments').get();

   return snapshot.docs 
    .map((docSnapshot) => Comment.fromDocSnap(docSnapshot))
    .toList();
  }
  
   uploadCommentData(Comment comment, String mealName) async {
    
    await _db.collection('Recipes')
          .doc(mealName)
          .collection('Comments')
          .doc()
          .set(comment.toJson());
   }
  
}
