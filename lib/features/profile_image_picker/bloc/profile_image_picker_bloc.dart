import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/repositories/recipes.repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/models.export.dart';

part 'profile_image_picker_event.dart';
part 'profile_image_picker_state.dart';

class ProfileImagePickerBloc extends Bloc<ProfileImagePickerEvent, ProfileImagePickerState> {
  
  final RecipesRepository _recipesRepo;
 
  ProfileImagePickerBloc(this._recipesRepo) : super(ProfileImagePickerInitial()) {
    on<ProfileImagePickerEvent>((event, emit) {
       on<ChooseImage>(_choseImage);
       on<ImagePicked>(_resetImage);   
    });
  }

   _choseImage(ChooseImage event, Emitter<ProfileImagePickerState> emit) async {
    
      //Cropped and compressed image file saved in temp dir path
      File tidyImg =  await _recipesRepo.pickImg(event.photoInfo.imgSource!);
      
      emit(ProfileImagePickerPreview(photoInfo: PhotoInfo(path: tidyImg.path))); 
  }

   _resetImage(ImagePicked event, Emitter<ProfileImagePickerState> emit) async 
    {  
      emit(ProfileImagePickerInitial());       
    }
  
  // _stopTakingSameImage(LoadedImage event, Emitter<ImagePickerState> emit) async {
  //     emit(ImageLoadedState());
  // }
}
