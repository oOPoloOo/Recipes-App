// ignore_for_file: unnecessary_const, prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipes_app/features/categories/bloc/categories_bloc.dart';
import 'package:recipes_app/features/image_picker/bloc/image_picker_bloc.dart';

import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:recipes_app/features/duration_picker/bloc/duration_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/model/models.export.dart';

import 'screens.export.dart';
import 'package:recipes_app/widgets/widgets.export.dart';
import 'package:recipes_app/widgets/styles/styles.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';

class AddRecipeScreen extends StatelessWidget {
  final DatabaseServices database = DatabaseServices();
  final StorageServices storage = StorageServices();
  final CustomStyles style = CustomStyles();

  final _mealNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  String imgLocalPath = '';  

  @override
  Widget build(BuildContext context) {
    final DurationPickerBloc durtionBloc =
        BlocProvider.of<DurationPickerBloc>(context);

    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<DurationPickerBloc, DurationPickerState>(
        builder: (durationCont, durationState) {
          return Container(
            height: media.height,
            width: media.width,
            child: Stack(clipBehavior: Clip.none, children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                buildWhen: (previous, current) =>
                    current is ImagePickerPreview ||
                    current is ImagePickerInitial,
                builder: (imgContext, imgState) {
                  if (imgState is ImagePickerInitial) {
                    return ShaderMask(
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
                        ));
                  }
                  if (imgState is ImagePickerPreview) {
                      imgLocalPath = imgState.photoInfo.localPath;

                    return  ShaderMask(
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
                      child: AspectRatio(
                        aspectRatio: 3 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(imgLocalPath)),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text("Something is wrong");
                  }
                },
              ),
              Positioned(
                top: media.height * 0.10,
                left: media.width * 0.38,
                child: GestureDetector(
                  onTap: () => selectPhoto(context),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.grey.withOpacity(0.3),
                    size: 100,
                  ),
                ),
              ),
              Positioned(
                top: media.height * 0.26,
                left: (media.width - media.width * 0.85) / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    //I adjusted here for responsiveness problems on my device
                    height: MediaQuery.of(context).size.height * 0.7,                        
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
                                child: TextField(
                                  minLines: 1,
                                  maxLines: null, // Text fills parent
                                  controller: _mealNameController,
                                  style: style.mealNameButton(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter meal name',
                                    hintStyle: style.mealNameButton(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: constraint.biggest.width * 0.85,
                                height: constraint.biggest.height * 0.2,
                                child: TextField(
                                  minLines: 1,
                                  maxLines: null,
                                  controller: _descriptionController,
                                  style: style.descriptionButton(),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Meal description',
                                    hintStyle: TextStyle(fontSize: 19),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(                             
                              flex: 2,
                              child: Container(
                                  width: constraint.biggest.width * 0.85,
                                  height: constraint.biggest.height * 0.2,
                                  child: chooseCatField(context, _categoryController) 
                                ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () async {
                                  var _duration = await showDurationPicker(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      context: context,
                                      initialTime: const Duration(minutes: 0));
                                  durtionBloc.add(DurationPickerEvent(
                                      cookDuration: _duration!.inMinutes));
                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                      color: const Color(0xFFA0A0A0)
                                          .withOpacity(0.35)),
                                  child: Container(
                                    width: constraint.biggest.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cooking time',
                                          style: style.time(),
                                        ),
                                        Text('${durationState.cookDuration}',
                                            style: style.time()),
                                        Text('Minutes', style: style.time()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  if (_descriptionController.text != '' &&
                                      _mealNameController.text != '' &&
                                      durtionBloc.state.cookDuration != 0) {
                                    var newRecipe = Recipe(
                                        name: _mealNameController.text,
                                        recipeDesc: _descriptionController.text,
                                        cookTime: durtionBloc.state.cookDuration,
                                        imgURL: imgLocalPath,
                                        localImgPath: imgLocalPath,
                                        category: _categoryController.text);
                                    
                                    //Uploads new recipe to db
                                    BlocProvider.of<ImagePickerBloc>(context)
                                        .add(PushImage(recipeInfo: newRecipe));

                                    //Resets duration picker value
                                    durtionBloc.add(DurationPickerEvent(cookDuration: 0));

                                    //Resets category pick field
                                    BlocProvider.of<ChooseCategoryBloc>(context)
                                        .add(ChooseCategoryReset());
                                    
                                    //Reset category filter in main page
                                    BlocProvider.of<CategoriesBloc>(context)
                                        .add(CategoriesReset());   
                                        
                                    Get.offAll(HomeScreen());                                    
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.yellow[700],
                                    // ignore: prefer_const_constructors
                                    child: Text('Upload Recipe',
                                        // ignore: prefer_const_constructors
                                        style: style.yellowButton())),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]),
          );     
        },
      ),
    );
  }
}


