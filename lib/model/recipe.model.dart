import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
    
    final String name;
    final String recipeDesc;
    final int cookTime;  
    final String imgURL; 
    final String? localImgPath; 

    Recipe({     
      required this.name,
      required this.recipeDesc,
      required this.cookTime, 
      required this.imgURL,
      this.localImgPath 
    });
    
    Map<String,dynamic> toJson() => {      
      'name': name,
      'recipeDesc': recipeDesc,
      'imgURL': imgURL,
      'cookTime': cookTime,     
    };

    //Using with 
    static Recipe fromJson(Map<String, dynamic> json) => Recipe(     
      name: json['name'],
      recipeDesc: json['recipeDesc'],
      imgURL: json['imgURL'],
      cookTime: json['cookTime'],      
    );
    
    //Using with QuerySnapshot
    static Recipe fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Recipe(     
      name: json.data()!['name'],
      recipeDesc: json.data()!['recipeDesc'],
      imgURL: json.data()!['imgURL'],
      cookTime: json.data()!['cookTime'],      
    );
   }