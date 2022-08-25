part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();
  
  @override
  List<Object> get props => [];
}
class ImagePickerInitial extends ImagePickerState {}

class ImagePreviewLoaded extends ImagePickerState {}



class ImagePickerPreview extends ImagePickerState {
  final PhotoInfo photoInfo;

  const ImagePickerPreview({required this.photoInfo});
   

  @override
  List<Object> get props => [photoInfo];
}

class ImagePickerDone extends ImagePickerState {
  final Recipe recipeInfo;

  const ImagePickerDone({required this.recipeInfo});   

  @override
  List<Object> get props => [recipeInfo];
}

class  ImageLoadedState extends ImagePickerState {}

