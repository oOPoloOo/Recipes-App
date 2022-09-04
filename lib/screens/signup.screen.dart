// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/features/profile_image_picker/bloc/profile_image_picker_bloc.dart';
import 'package:recipes_app/features/signup/cubit/signup_cubit.dart';
import 'package:recipes_app/repositories/auth.repository.dart';
import 'package:recipes_app/router/route.names.dart';
import 'package:recipes_app/widgets/signup/signup.select.media.modal.dart';

import '../widgets/add_recipe_screen/select.media.modal.dart';

class SignUpScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
           image: AssetImage("images/back.jpg"),
           fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: SignUpForm())          
            ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener if error
      },
      child: Material(
      color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _UserImage(),
            const SizedBox(height: 8),
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _fullNameInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
class _UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    
    return BlocBuilder<ProfileImagePickerBloc, ProfileImagePickerState>(
      builder: (context, state) {
       if(state is ProfileImagePickerInitial)
       {
          return Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => selectProfilePhoto(context),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: media.width * 0.2,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: media.width * 0.2,
              ),
            ),
          ),
        );
       } 
       else
      if(state is ProfileImagePickerPreview)
       {
         context.read<SignupCubit>().photoChanged(state.photoInfo.localPath);
         return Padding(
          padding: EdgeInsets.all(15),
          child: CircleAvatar(
            backgroundImage: FileImage(File(state.photoInfo.localPath)),
            radius: media.width * 0.2,
            
          ),
        );
       } else {
        return Container(child: Text('Something wrong'),);
       }    
      },
    );
  }
}

class _fullNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          onChanged: (name) => context.read<SignupCubit>().nameChanged(name),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Full name',
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<SignupCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          obscuringCharacter: '*' ,
          onChanged: (password) =>
              context.read<SignupCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == SignupStatus.submitting
              ? const CircularProgressIndicator()
              : ElevatedButton(               
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: const Color(0xFFFFD600),
                ),
                onPressed: () {
                   //Push data to server
                   context.read<SignupCubit>().signupFormSubmitter();
                   //Resets signup image to blank
                   context.read<ProfileImagePickerBloc>().add(ImagePicked());
                   
                    Get.offAllNamed(homeRouteName);
                },
                child: const Text('SIGNUP'),
              );              
        });
  }
}
