// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/data_mover/bloc/data_mover_bloc.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/helpers/text.background.blur.dart';

class RecipeTile  {  
  TextBackgroudBlur blur = TextBackgroudBlur(); 

  Widget buildRecipeCard(Recipe recipe, BuildContext context){
    
    return  GestureDetector(
        onTap: () {
          BlocProvider.of<DataMoverBloc>(context).
          add(DataMoverEvent(recipe:  recipe));
          
          Get.toNamed("/details");         
        },
        child: AspectRatio(
          aspectRatio: 6/8,
          child: Container(
            padding: EdgeInsets.only(bottom: 23),
            child: ClipRRect(
              //Clipping the whole widget
              borderRadius: BorderRadius.circular(30.0), 
              child: Container(
                  //I adjusted here for responsiveness problems on my device     
                  height: MediaQuery.of(context).size.height * 0.58, 
                  width: MediaQuery.of(context).size.width * 0.85,                
                  color: Colors.white,
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Stack(
                        children: [
                            Container( // Luzta
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(recipe.imgURL), 
                                  fit: BoxFit.fill
                                  ),
                              ),                            
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
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Text(
                                          recipe.name, 
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600
                                            ),                         
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${recipe.cookTime}', 
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.w600
                                                ),                         
                                            ),
                                            Text(
                                              'min.',        
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.w600
                                                ),                         
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
        ),
      );  
    }  
  }
