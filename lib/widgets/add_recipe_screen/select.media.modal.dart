


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/image_picker/bloc/image_picker_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/models.dart';

Future selectPhoto(BuildContext context) async {
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
                    
                    BlocProvider.of<ImagePickerBloc>(context).add(ChooseImage(
                        photoInfo: PhotoInfo(imgSource: ImageSource.camera)));
                  }),
              ListTile(
                  leading: Icon(Icons.filter),
                  title: Text('Pick a file'),
                  onTap: () {
                    Navigator.of(context).pop();                    
                    BlocProvider.of<ImagePickerBloc>(context).add(ChooseImage(
                        photoInfo: PhotoInfo(imgSource: ImageSource.gallery)));
                  }),
            ],
          ));
}