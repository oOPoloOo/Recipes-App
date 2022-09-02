// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipes_app/features/database/bloc/database_bloc.dart';
// import 'package:recipes_app/screens/home_screen.dart';
// // import 'package:recipes_app/screens/profile.screen.dart';
// import 'package:recipes_app/screens/screens.export.dart';

// import '../features/auth/bloc/auth_status_bloc.dart';


// //Go to home page on app start if user logged in
// class AuthRouter extends StatelessWidget{

//   @override 
//   Widget build(BuildContext context) {
  
//    return BlocBuilder<DatabaseBloc, DatabaseState>(
//          builder: (context, dbState) { //dbContext
//     return BlocBuilder<AuthStatusBloc, AuthStatusState>(
//          builder: (context, aState) { //aContext
//           return Navigator(
//             pages: 
//             // ignore: prefer_const_literals_to_create_immutables
//             [
              
//               if (aState.status.name == "authenticated"  
//                   && dbState is DatabaseLoading) ...[
//                        MaterialPage(child: SplashScreen())
//                   ]
//                   else if(aState.status.name == "unauthenticated") ...[
//                     MaterialPage(child: LoginScreen())
//                   ] 
//                   else  MaterialPage(child: HomeScreen())
              
//             ],
//             onPopPage: (route, result) {
//               return route.didPop(result);
//             },
//           );
//         });
//       });
//   }
// }