 // ignore_for_file: prefer_const_constructors

 import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.grey,
        child: Center(
         child: Container(
            height: 50,
            width: 50,
          //   decoration:  BoxDecoration(          
          //     image: DecorationImage(
          //     image: AssetImage(
          //       "images/splash.png",
          //     ),
          //     fit: BoxFit.cover,
          //     ),
          // ),
        ),
      )
    )
   );
  }
}