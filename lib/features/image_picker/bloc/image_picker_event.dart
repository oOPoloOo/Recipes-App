part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class ChooseImage extends ImagePickerEvent {
   final PhotoInfo photoInfo;

  const ChooseImage({required this.photoInfo});
   

  @override
  List<Object> get props => [photoInfo];
}

class PushImage extends ImagePickerEvent {
  final Recipe recipeInfo;

  const PushImage({required this.recipeInfo});
   

  @override
  List<Object> get props => [recipeInfo];
}

