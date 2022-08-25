import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/model/photo.info.dart';
import 'package:recipes_app/repositories/recipes.repository.dart';
import 'dart:io';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
    final RecipesRepository _recipesRepo;
    
  ImagePickerBloc(this._recipesRepo) : super(ImagePickerInitial()) {   
    on<ChooseImage>(_choseImage);
    on<PushImage>(_pushImage);
     on<LoadedImage>(_stopTakingSameImage);

  }

  _choseImage(ChooseImage event, Emitter<ImagePickerState> emit) async {
    
      
        //Cropped and compressed image file saved in temp dir path
        File tidyImg =  await _recipesRepo.pickRecipeImg(event.photoInfo.imgSource!);
      
      emit(ImagePickerPreview(photoInfo: PhotoInfo(path: tidyImg.path)));
   
     // await _recipesRepo.pickRecipeImg(event.photoInfo.imgSource!);
       
  }

   _pushImage(PushImage event, Emitter<ImagePickerState> emit) async {
    
      
       
     // TO DO///
     final imgURL = await _recipesRepo.uploadFile(event.recipeInfo.localImgPath!);
      var recipe = event.recipeInfo;
      var newRecipe =
            Recipe(
            name: recipe.name,
            recipeDesc: recipe.recipeDesc,
            cookTime: recipe.cookTime,
            imgURL: imgURL            
            );
            _recipesRepo.writeRecipe(newRecipe);

           emit(ImagePickerDone(recipeInfo: newRecipe));
           emit(ImagePickerInitial());
       
  }
  
  _stopTakingSameImage(LoadedImage event, Emitter<ImagePickerState> emit) async {
      emit(ImageLoadedState());
  }
}

