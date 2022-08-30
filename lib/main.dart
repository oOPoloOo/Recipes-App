// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/features/category_data_mover/bloc/category_data_mover_bloc.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';
import 'package:recipes_app/features/login/cubit/login_cubit.dart';
import 'package:recipes_app/repositories/auth.repository.dart';
import 'package:recipes_app/middleware/auth.router.dart';
import 'features/categories/bloc/categories_bloc.dart';
import 'features/data_mover/bloc/data_mover_bloc.dart';
import 'router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/app.block.observer.dart';
import 'features/database/bloc/database_bloc.dart';
import 'repositories/recipes.repository.dart';
import 'features/duration_picker/bloc/duration_picker_bloc.dart';
import 'package:recipes_app/features/duration_picker/bloc/duration_picker_bloc.dart';
import 'features/image_picker/bloc/image_picker_bloc.dart';
import 'features/signup/cubit/signup_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDCZe2t39ZENbUGOC8t74UPkPrNH2ccXzw",
      appId: "1:385079244008:android:e40d80671623f37a16855d",
      messagingSenderId: "385079244008",
      projectId: "recipes-app-92e9e",
    ),
  );

  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  //Sets Screen position in the app
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);   
  }

  //When leaving app reverts screen positions to original
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
             BlocProvider(
              create: (context) => DatabaseBloc(RecipesRepository()),
             ),
             BlocProvider(
              create: (context) => DurationPickerBloc(),
             ),
             BlocProvider(
              create: (context) => ImagePickerBloc(RecipesRepository()),
             ),
              BlocProvider(
              create: (context) => DataMoverBloc(),
             ),
              BlocProvider(
              create: (context) => CategoriesBloc(),
             ),
              BlocProvider(
              create: (context) => ChooseCategoryBloc(),
             ),
              BlocProvider(
              create: (context) => CategoryDataMoverBloc(),
             ),
              BlocProvider(
              create: (context) => AuthStatusBloc(authRepository: AuthRepository()),
             ),
             BlocProvider(
              create: (context) => SignupCubit(AuthRepository()),
             ),
             BlocProvider(
              create: (context) => LoginCubit(AuthRepository()),
             ),    
        ],  
        child: GetMaterialApp(
          getPages: AppRoutes.routes,        
          home: AuthRouter(), 
        ),     
      ),
    
    );
  }
}