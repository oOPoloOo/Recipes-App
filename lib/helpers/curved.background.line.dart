import 'package:flutter/material.dart';


class CurvedClipPath extends CustomClipper<Path>{

 
    @override
    Path getClip(Size size){
      double w = size.width;
      double h = size.height;

      //Starts at top left corner 1
      final path = Path();

      //Drawing the box
      // path.lineTo(0, h); // 2
      // path.lineTo(w,h);  // 3
      // path.lineTo(w, 0); // 4
      // path.close();      // 5

      //Drawing curved line
      path.lineTo(0, h *0.3); // 2
      path.quadraticBezierTo(
        w * 0.5, // x is 50 % width. 3 point
        h *0.3 + 70, // y is 100 distance from bottom 3 point
        w, //4
        h*0.3 //4
        );
      path.lineTo(w, 0); //5
      path.close(); 

      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper){
      return false;
    }
  

}
