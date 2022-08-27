import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
    
    final String category;
    final String imageURL;
   

    Category({     
      required this.category,
      required this.imageURL,     
    });
    
    Map<String,dynamic> toJson() => {      
      'category': category,
      'imageURL': imageURL,          
    };

    
    static Category fromJson(Map<String, dynamic> json) => Category(     
      category: json['category'],
      imageURL: json['imageURL'],          
    );
    
    //Using with QuerySnapshot
    static Category fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Category(     
      category: json.data()!['category'],
      imageURL: json.data()!['imageURL'],         
    );
   }