 


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
        if (state.status == LoginStatus.error) {
        
        }
      },
      child: Material(
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(
                //   'assets/bloc_logo_small.png',
                //   height: 120,
                // ),
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
        ),
      ),
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
        return 
        TextField( 
          obscuringCharacter: '*' ,         
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

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(          
//           onChanged: (password) =>
//               context.read<LoginCubit>().passwordChanged(password),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'password',  
//           ),
//         );
//       },
//     );
//   }
// }

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
    final theme = Theme.of(context);
    return TextButton(
     // key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => Get.toNamed(signUpRouteName),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
 }
}