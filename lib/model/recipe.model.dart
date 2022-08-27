import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
    
    final String name;
    final String recipeDesc;
    final int cookTime;  
    final String imgURL; 
    final String category;
    final String? localImgPath; 

    Recipe({     
      required this.name,
      required this.recipeDesc,
      required this.cookTime,
      required this.category,  
      required this.imgURL,
      this.localImgPath 
    });
    
    Map<String,dynamic> toJson() => {      
      'name': name,
      'recipeDesc': recipeDesc,
      'imgURL': imgURL,
      'category': category,
      'cookTime': cookTime,     
    };

    //Using with 
    static Recipe fromJson(Map<String, dynamic> json) => Recipe(     
      name: json['name'],
      recipeDesc: json['recipeDesc'],
      imgURL: json['imgURL'],
      category: json['category'],
      cookTime: json['cookTime'],      
    );
    
    //Using with QuerySnapshot
    static Recipe fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Recipe(     
      name: json.data()!['name'],
      recipeDesc: json.data()!['recipeDesc'],
      imgURL: json.data()!['imgURL'],
      category: json.data()!['category'],
      cookTime: json.data()!['cookTime'],      
    );
   }