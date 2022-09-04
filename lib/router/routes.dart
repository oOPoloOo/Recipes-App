
import 'package:get/get.dart';
import 'package:recipes_app/middleware/auth.login.middleware.dart';
import 'route.names.dart';
import 'package:recipes_app/screens/screens.export.dart';

class AppRoutes {

  //this is to prevent anyone from instantiating this object
  AppRoutes._(); 
  
  static final routes = [    
     GetPage(
      name: homeRouteName, 
      page: () => HomeScreen(),
      middlewares: [AuthLoginMiddleware()], 
     ),
     GetPage(name: addRouteName, page: () => AddRecipeScreen()),
     GetPage(name: detailsRouteName, page: () => RecipeDetailsScreen()),
     GetPage(name: loginRouteName, page: () => LoginScreen()),
     GetPage(name: signUpRouteName, page: () => SignUpScreen()),
     GetPage(name: profileRouteName, page: () => ProfileScreen()),
  ];
}