 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/router/route.names.dart';
import 'package:recipes_app/screens/screens.export.dart';

class ProfileScreen extends StatelessWidget {
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile screen')),
      body: ElevatedButton(
          child: Text('log out'),
          onPressed: () {
            BlocProvider.of<AuthStatusBloc>(context).
             add(AuthLogoutRequest());
             Get.offAllNamed(loginRouteName);
          },
        )
    );
  }
}