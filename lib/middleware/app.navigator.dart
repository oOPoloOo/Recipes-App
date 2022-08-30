// // ignore_for_file: prefer_const_constructors

// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
// import 'package:recipes_app/features/database/bloc/database_bloc.dart';
// import 'package:recipes_app/repositories/auth.repository.dart';
// import 'package:recipes_app/screens/screens.export.dart';

// import '../screens/screens.export.dart';

// class AppNavigator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // AuthStatusState  _authState = AuthStatusState.unauthenticated();
//     // DatabaseState _dbState = DatabaseInitial as DatabaseState;
//     var _authState;
//     var _dbState;

//     print("_authState: ${_authState}");
//     print("_dbState: ${_dbState}");
   
    
//  // return MaterialApp();
//   // MaterialApp.router(
//   //           // routeInformationParser:  RouterMy(authState: _authState, dbState: _dbState),
//   //           // routerDelegate: router
//   //           )
    
//   //  final routerR = RouterMy(authState: _authState, dbState: _dbState);
//     // return BlocListener<AuthStatusBloc, AuthStatusState>(
//     //   listener: (context, aState) {
        
//     //       _authState = aState;
//     //       print("aState: ${aState}");
//     //   },
//     //   child: BlocListener<DatabaseBloc, DatabaseState>(
//     //     listener: (context, dState) {
          
//     //      _dbState = dState;
//     //       print("_dbStdStateate: ${dState}");
//     //     },
//     //     child: MaterialApp.router(
//     //         //How to treanslate location: /smth to build stack of pages
//     //         routeInformationParser: routerR.getRouter.routeInformationParser ,
//     //         //Gives righ stack of pages
//     //         routerDelegate: routerR.getRouter.routerDelegate),
//     //   ),
//     // );

    
//     return BlocBuilder<AuthStatusBloc, AuthStatusState>(
//               builder: (dbContext, aState) {
    
//     return  BlocBuilder<DatabaseBloc, DatabaseState>(
//               builder: (dbContext, dState) {

//           final routerR = RouterMy(authState: aState, dbState: dState);
//                 return  MaterialApp.router(
//                 //How to treanslate location: /smth to build stack of pages
//                 routeInformationParser: routerR.getRouter.routeInformationParser ,
//                 //Gives righ stack of pages
//                 routerDelegate: routerR.getRouter.routerDelegate);
//               }
//           );
//         }
//       );
// }
// }
// class RouterMy {
//    AuthStatusState authState;
//    DatabaseState dbState;
//   // var authState;
//   // var dbState;
  

//   RouterMy({required this.authState, required this.dbState});


  
//   final  router = GoRouter(
//     redirect: (state) {
//       final isLogging = state.location == '/login';
//       final loggedIn = authState.status;
//       // AuthStatusState aState = authState;
//       // DatabaseState dState;
//      if(isLogging && authState.status.name == ''){}
       
//     },
//     routes: 
//     [
//       GoRoute(
//         name: 'home',
//         path: '/', 
//         pageBuilder: (context, state) => MaterialPage(
//           child: Scaffold(
//             body: Center(
//               child: Text('Home Page')
//             ),
//           )
//         )
//       ),
//       GoRoute(
//         name: 'splash',
//         path: '/splash', 
//         pageBuilder: (context, state) => MaterialPage(
//           child: SplashScreen() ,
//         )
//       ),
//       GoRoute(
//         name: 'login',
//         path: '/login', 
//         pageBuilder: (context, state) => MaterialPage(
//           child: LoginScreen() ,
//         )
//       ),
//     ],
//     //Return error on: no maching, multiple maching routes
//     errorPageBuilder: (context, state) {
//       return MaterialPage(
//       //uniq id for page, to not rebuild same page
//       key: state.pageKey,
//         child: Scaffold(
//           body: Center(
//             child: Text(state.error.toString()),
//           )
//         ),
//       );      
//     }
//   );





//   GoRouter get getRouter  {
//       return router; 
//   }

  
   
// }
// // return GoRouter(
// //     routes: [
// //       GoRoute(
// //         path: '/',
// //         name: 'home',
// //         builder: (context, state) => const HomePage(),
// //       ),
// //       GoRoute(
// //         path: '/login',
// //         name: 'login',
// //         builder: (context, state) => const LoginPage(),
// //       ),
// //     ],
// //     redirect: (state) {
// //       final isLoggedIn =
// //           bloc.state.status == AuthenticationStatus.authenticated;
// //       final isLoggingIn = state.location == '/login';
// //       print(isLoggedIn);

// //       if (!isLoggedIn && !isLoggingIn) return '/login';
// //       if (isLoggedIn && isLoggingIn) return '/';

// //       return null;
// //     },
// //     refreshListenable: bloc);
