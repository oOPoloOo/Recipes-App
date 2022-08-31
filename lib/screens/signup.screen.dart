// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/signup/cubit/signup_cubit.dart';
import 'package:recipes_app/repositories/auth.repository.dart';
import 'package:recipes_app/router/route.names.dart';

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
                // key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: const Color(0xFFFFD600),
                ),
                onPressed: () {
                   context.read<SignupCubit>().signupFormSubmitter();
                    Get.offAllNamed(homeRouteName);
                },
                child: const Text('SIGNUP'),
              );              
        });
  }
}
