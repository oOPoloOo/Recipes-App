// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/helpers/text.background.blur.dart';

class RecipeTile  {  
  TextBackgroudBlur blur = TextBackgroudBlur();

  Widget buildRecipe(Recipe recipe) => ListTile(
  //leading: CircleAvatar(child:Text(recipe.name)), // paveiksliukas
  title: Text(recipe.name ), // didelis txt
  subtitle: Text( '${recipe.cookTime}') // mazas txt zemiau
  );

  // Widget buildRecipeCard(Recipe recipe) => Container(    
  //   padding: EdgeInsets.only(bottom: 23),
  //   height: 420,
  //   child: Card(
  //    // semanticContainer: true, // aded
  //     shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //     color: Colors.blue,
  //     child: 
  //     Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: NetworkImage(recipe.imgURL), 
  //           fit: BoxFit.fill
  //           ),
  //       ),
  //       child:  Text(recipe.name),
  //     )
  //     // ListTile(
  //     //   //leading: CircleAvatar(child:Text(recipe.name)), // paveiksliukas
  //     //   title: Text(recipe.name ), // didelis txt
  //     //   subtitle: Text( '${recipe.cookTime}') // mazas txt zemiau
  //     //   ),
      
  //   ),
  // );

    Widget buildRecipeCard(Recipe recipe) => Container(
      padding: EdgeInsets.only(bottom: 23),
      height: 420,
      child: GestureDetector(
        onTap: () {
          //Add functionality
          print('TAPPED CARD');
        },
        child: ClipRRect( 
        borderRadius: BorderRadius.circular(45),
        child: Stack(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: 
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(recipe.imgURL), 
                  fit: BoxFit.fill
                  ),
              ),
           //   child:  Text(recipe.name),
            )
            ),
          // Image.network(recipe.imgURL, fit: BoxFit.cover),
           Positioned(
            top: 295,
            left: 4,
             child: Center( 
              child: blur.buildBlur(
                child: Container(
                  height: 98,
                  width: 345,
                  color: Colors.transparent.withOpacity(0.4),
                  
                  child: Text(
                    'TNT',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                ),
              ),
             ),
           )
          ]
          // Card(
          //  // semanticContainer: true, // aded
          //   shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //   color: Colors.blue,
          //   child: 
          //   Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage(recipe.imgURL), 
          //         fit: BoxFit.fill
          //         ),
          //     ),
          //     child:  Text(recipe.name),
          //   )
          //   // ListTile(
          //   //   //leading: CircleAvatar(child:Text(recipe.name)), // paveiksliukas
          //   //   title: Text(recipe.name ), // didelis txt
          //   //   subtitle: Text( '${recipe.cookTime}') // mazas txt zemiau
          //   //   ),
            
          // ),
        ),
        ),
      ),
    );

    // buildBlur({
    //   required Widget child,
    //   double sigmaX = 10,
    //   double sigmaY = 10,
    // }) => ClipRRect(
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(sigmaX: sigmaX,sigmaY: sigmaY),
    //     child: child,
    //     ),
    // );
}
