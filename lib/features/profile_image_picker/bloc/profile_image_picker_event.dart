part of 'profile_image_picker_bloc.dart';

abstract class ProfileImagePickerEvent extends Equatable {
  const ProfileImagePickerEvent();

  @override
  List<Object> get props => [];
}

class ChooseImage extends ProfileImagePickerEvent {
   final PhotoInfo photoInfo;

  const ChooseImage({required this.photoInfo});   

  @override
  List<Object> get props => [photoInfo];
}

class  ImagePicked extends ProfileImagePickerEvent {}
