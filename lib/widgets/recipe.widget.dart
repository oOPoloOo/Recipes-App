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

  Widget buildRecipeCard(Recipe recipe, BuildContext context) => 
      GestureDetector(
        onTap: () {
          //Add functionality
          print('TAPPED CARD');
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 23),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0), //clipping the whole widget
            child: Container(     
                height: MediaQuery.of(context).size.height * 0.58, //I adjusted here for responsiveness problems on my device
                width: MediaQuery.of(context).size.width * 0.85,                
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Stack(
                      children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(recipe.imgURL), 
                                fit: BoxFit.fill
                                ),
                            ),
                          //   child:  Text(recipe.name),
                          ),                          
                        Positioned(
                          bottom: 0.0,
                          child: blur.buildBlur(
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: constraint.biggest.width,
                              color: Colors.transparent.withOpacity(0.4),
                              // ignore: prefer_const_constructors
                              child: Container(
                                width: constraint.biggest.width * 0.85,
                                child: Text(
                                  'Healthy Vegetarian And Rice',        
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600
                                    )                         
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),                  
          ),
        ),
      );    
  }
