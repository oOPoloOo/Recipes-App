// ignore_for_file: unnecessary_const, prefer_const_constructors, unnecessary_new

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
import 'package:recipes_app/widgets/styles/styles.dart';

class AddRecipeScreen extends StatelessWidget {
  final DatabaseServices database = DatabaseServices();
  final StorageServices storage = StorageServices();
  final CustomStyles style = CustomStyles();

  final _mealNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String imgLocalPath = '';

  final TextStyle mealNameStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final DurationPickerBloc durtionBloc =
        BlocProvider.of<DurationPickerBloc>(context);

    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<DurationPickerBloc, DurationPickerState>(
        builder: (durationCont, durationState) {
          return
              // BlocBuilder<ImagePickerBloc, ImagePickerState>(
              //   builder: (imgContext, imgState) {
              //     return
              Container(
            height: media.height,
            width: media.width,
            child: Stack(clipBehavior: Clip.none, children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                buildWhen: (previous, current) => current is ImagePickerPreview || current is ImagePickerInitial,
                builder: (imgContext, imgState) {

                  if(imgState is ImagePickerInitial)
                  {
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
                   if (imgState is ImagePickerPreview)
                  {
                     imgLocalPath = imgState.photoInfo.localPath;

                     return //Container(
                      
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
                        child: AspectRatio(
                          aspectRatio: 3/3,
                          child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(imgLocalPath)), 
                                    fit: BoxFit.cover
                                    ),
                                ),
                              
                              ),
                          ),  
                        );
                     }
                  else {
                  return Text("Something is wrong");
                  }
                  
                },
              ),
              Positioned(
                top: media.height * 0.10,
                left: media.width * 0.38,
                child: GestureDetector(
                  onTap: () => _selectPhoto(context),
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
                                child: TextField(
                                  minLines: 1,
                                  maxLines: null, // Text fills parent
                                  controller: _mealNameController,
                                  style: style.mealNameButton(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter meal name',
                                    hintStyle: mealNameStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
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
                              child: GestureDetector(
                                onTap: () async {
                                  var _duration = await showDurationPicker(
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
                                        Text('Minutes',
                                            style: style.time()),
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
                                          category: ''
                                        );
                                    
                                    BlocProvider.of<ImagePickerBloc>(context).add(PushImage(recipeInfo: newRecipe));
                                    durtionBloc.add(
                                        DurationPickerEvent(cookDuration: 0));
                                    Get.offAll(HomeScreen());
                                    print('Start cooking');
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.yellow[700],
                                    // ignore: prefer_const_constructors
                                    child: Text('Upload Recipe',
                                        // ignore: prefer_const_constructors
                                        style: style.yellowButton()
                                        )),
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
          //   },
          // );
        },
      ),
    );
  }
}

final RecipesRepository repo = RecipesRepository();
Future _selectPhoto(BuildContext context) async {
  await showModalBottomSheet(
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    //repo.pickRecipeImg(ImageSource.camera);
                    BlocProvider.of<ImagePickerBloc>(context).add(ChooseImage(
                        photoInfo: PhotoInfo(imgSource: ImageSource.camera)));
                  }),
              ListTile(
                  leading: Icon(Icons.filter),
                  title: Text('Pick a file'),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Pakeist, kad butu su bloc
                    //repo.pickRecipeImg(ImageSource.gallery);

                    BlocProvider.of<ImagePickerBloc>(context).add(ChooseImage(
                        photoInfo: PhotoInfo(imgSource: ImageSource.gallery)));
                  }),
            ],
          ));
}
