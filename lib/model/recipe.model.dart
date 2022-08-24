import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
    
    final String name;
    final String imgName;
    final int cookTime;  
    final String imgURL;  

    Recipe({     
      required this.name,
      required this.imgName,
      required this.cookTime, 
      required this.imgURL    
    });
    
    Map<String,dynamic> toJson() => {      
      'name': name,
      'imgName': imgName,
      'imgURL': imgURL,
      'cookTime': cookTime,     
    };

    //Using with 
    static Recipe fromJson(Map<String, dynamic> json) => Recipe(     
      name: json['name'],
      imgName: json['imgName'],
      imgURL: json['imgURL'],
      cookTime: json['cookTime'],      
    );
    
    //Using with QuerySnapshot
    static Recipe fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Recipe(     
      name: json.data()!['name'],
      imgName: json.data()!['imgName'],
      imgURL: json.data()!['imgURL'],
      cookTime: json.data()!['cookTime'],      
    );
   }