
import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {

  final String userName;
  final String comment;

  Comment({required this.userName, required this.comment});
      static Comment fromJson(Map<String, dynamic> json) => Comment(     
      userName: json['userName'],
      comment: json['comment'],     
  );

  //Using with QuerySnapshot
  static Comment fromDocSnap(DocumentSnapshot<Map<String, dynamic>> json) => Comment(     
    userName: json.data()!['userName'],
    comment: json.data()!['comment'],
  );

   Map<String,dynamic> toJson() => {      
      'userName': userName,
      'comment': comment,   
    };
}