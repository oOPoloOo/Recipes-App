import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/profile.screen.dart';
import 'route.names.dart';
import 'package:recipes_app/screens/screens.export.dart';
import "package:recipes_app/middleware/auth.middleware.dart";

class AppRoutes {

  //this is to prevent anyone from instantiating this object
  AppRoutes._(); 
  
  static final routes = [    
     GetPage(
      name: homeRouteName, 
      page: () => HomeScreen(), 
      middlewares: []),
     GetPage(name: addRouteName, page: () => AddRecipeScreen()),
     GetPage(name: detailsRouteName, page: () => RecipeDetailsScreen()),
     GetPage(name: loginRouteName, page: () => LoginScreen()),
     GetPage(name: signUpRouteName, page: () => SignUpScreen()),
      GetPage(name: profileRouteName, page: () => ProfileScreen()),
  ];
}