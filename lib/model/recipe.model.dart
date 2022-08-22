import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
    
    final String name;
    final int cookTime;    

    Recipe({     
      required this.name,
      required this.cookTime,     
    });
    
    Map<String,dynamic> toJson() => {      
      'name': name,
      'cookTime': cookTime,     
    };

    //Using with 
    static Recipe fromJson(Map<String, dynamic> json) => Recipe(     
      name: json['name'],
      cookTime: json['cookTime'],      
    );
    
    //Using with QuerySnapshot
    static Recipe fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Recipe(     
      name: json.data()!['name'],
      cookTime: json.data()!['cookTime'],      
    );
   }