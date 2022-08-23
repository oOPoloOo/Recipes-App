// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/app.block.observer.dart';
import 'features/database/bloc/database_bloc.dart';
import 'repositories/recipes.repository.dart';
import 'features/duration_picker/bloc/duration_picker_bloc.dart';
import 'package:recipes_app/features/duration_picker/bloc/duration_picker_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: AppBlocObserver());
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
           BlocProvider(
            create: (context) => DatabaseBloc(RecipesRepository()),
           ),
           BlocProvider(
            create: (context) => DurationPickerBloc(),
           ),
      ],
      child: GetMaterialApp(
        getPages: AppRoutes.routes,
        initialRoute: '/home',
      ),     
    );
  }
}
