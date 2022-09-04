import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/repositories/auth.repository.dart';
import 'package:recipes_app/router/route.names.dart';


// From login redirect back if try go to home page and unauthenticated
 class AuthLoginMiddleware extends GetMiddleware { 

  var  authBloc = AuthStatusBloc(authRepository:  AuthRepository());
  

  @override
  RouteSettings? redirect(String? route) {    
    
    if(authBloc.authState.status.name != "authenticated") {return  RouteSettings(name: loginRouteName); }
      
  }
 }
