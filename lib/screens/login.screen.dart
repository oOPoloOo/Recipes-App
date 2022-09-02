// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/login/cubit/login_cubit.dart';
import 'package:recipes_app/router/route.names.dart';



class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
       if (state.status == LoginStatus.error) {}
      },
      child: Scaffold(       
        body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/back.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
        
       child:  Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    _EmailInput(),
                    const SizedBox(height: 8),
                    _PasswordInput(),
                    const SizedBox(height: 8),
                    _LoginButton(),
                    const SizedBox(height: 4),
                    _SignUpButton(),
                  ],
                ),
              ),
            )),
      )
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          obscuringCharacter: '*',
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
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
                  context.read<LoginCubit>().logInWithCredentials();
                  Get.offAllNamed(homeRouteName);
                },
                child: const Text('LOGIN'),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return ElevatedButton(
                // key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: const Color(0xFFFFD600),
                ),
                onPressed: () {
                  Get.toNamed(signUpRouteName);
                },
                child: const Text('CREATE ACCOUNT'),
              );
            }
          }
