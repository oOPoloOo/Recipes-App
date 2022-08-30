// // import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';

 import 'dart:async';

import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/repositories/auth.repository.dart';
import 'package:recipes_app/router/route.names.dart';


// Remove getx and use Navigator wih go route
//  class AuthMiddleware extends GetMiddleware { 

// //   var  authBloc = AuthStatusBloc(authRepository:  AuthRepository());

// // @override
// //   RouteSettings? redirect(String? route) {
     
// //     print("INSIDE MIDDLEWARE, validated: ${authBloc.authState.status}");
// //     if(authBloc.authState.status.name != "authenticated") {return  RouteSettings(name: loginRouteName); }
      
// //   }
//  }
