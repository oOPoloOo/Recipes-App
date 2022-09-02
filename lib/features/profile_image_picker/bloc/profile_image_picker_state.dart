part of 'profile_image_picker_bloc.dart';

abstract class ProfileImagePickerState extends Equatable {
  const ProfileImagePickerState();
  
  @override
  List<Object> get props => [];
}


class ProfileImagePickerInitial extends ProfileImagePickerState {}

class ProfileImagePickerPreview extends ProfileImagePickerState {
  final PhotoInfo photoInfo;

  const ProfileImagePickerPreview({required this.photoInfo});   

  @override
  List<Object> get props => [photoInfo];
}
