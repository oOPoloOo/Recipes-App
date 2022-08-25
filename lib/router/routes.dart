import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'route.names.dart';
import 'package:recipes_app/screens/screens.export.dart';

class AppRoutes {

  //this is to prevent anyone from instantiating this object
  AppRoutes._(); 
  
  static final routes = [    
     GetPage(name: homeRouteName, page: () => HomeScreen()),
     GetPage(name: addRouteName, page: () => AddRecipeScreen()),
     GetPage(name: detailsRouteName, page: () => RecipeDetailsScreen()),
  ];
}