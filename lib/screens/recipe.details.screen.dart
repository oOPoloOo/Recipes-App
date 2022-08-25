
// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/features/image_picker/bloc/image_picker_bloc.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:recipes_app/features/duration_picker/bloc/duration_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/features/database/bloc/database_bloc.dart';
import 'screens.export.dart';
import 'package:recipes_app/repositories/recipes.repository.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final DatabaseServices database = DatabaseServices();
  final StorageServices storage = StorageServices();

 

  @override
  Widget build(BuildContext context) {
    final DurationPickerBloc durtionBloc =
        BlocProvider.of<DurationPickerBloc>(context);

    var media = MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
            height: media.height,
            width: media.width,
            child: Stack(clipBehavior: Clip.none, children: [
              
              ShaderMask(
              shaderCallback: (rect) {
                // ignore: prefer_const_constructors
                return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(
                    Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'images/plateBlack.jpg',
              )),

              Positioned(
                top: media.height * 0.10,
                left: media.width * 0.38,
                child: Text('text2')
                
              ),
              Positioned(
                top: media.height * 0.26,
                left: (media.width - media.width * 0.85) / 2,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(30.0), //clipping the whole widget
                  child: Container(
                    height: MediaQuery.of(context).size.height *
                        0.7, //I adjusted here for responsiveness problems on my device
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraint) {
                        return Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: constraint.biggest.width * 0.85,
                                height: constraint.biggest.height * 0.2,
                                alignment: Alignment.centerLeft,
                                child: Text('kazkas1')
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: constraint.biggest.width * 0.85,
                                height: constraint.biggest.height * 0.2,
                                child: Text('Kazkas'),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  decoration: new BoxDecoration(
                                      color: const Color(0xFFA0A0A0)
                                          .withOpacity(0.35)),
                                  child: Container(
                                    width: constraint.biggest.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Cooking time',
                                          style: TextStyle(fontSize: 30),
                                        ),                                       
                                      ],
                                    ),
                                  ),
                                ),
                              
                            ),
                            Expanded(
                              flex: 1,
                              child:  Container(
                                    alignment: Alignment.center,
                                    color: Colors.yellow[700],
                                    // ignore: prefer_const_constructors
                                    child: const Text('Start Cooking',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600))),
                             
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]),
          )
    );
  }
}