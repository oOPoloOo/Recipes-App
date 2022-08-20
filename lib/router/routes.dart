import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'route.names.dart';
import 'package:recipes_app/screens/screens.export.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  
  static final routes = [    
     GetPage(name: homeRouteName, page: () => HomeScreen()),
     GetPage(name: detailsRouteName, page: () => RecipeDetails()),
  ];
}