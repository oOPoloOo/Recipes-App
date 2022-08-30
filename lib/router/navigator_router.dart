import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/database/bloc/database_bloc.dart';
import 'package:recipes_app/features/navigation/bloc/navigation_bloc.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/profile.screen.dart';
import 'package:recipes_app/screens/screens.export.dart';

import '../features/auth/bloc/auth_status_bloc.dart';

class NavigatorRouter extends StatelessWidget{

  @override 
  Widget build(BuildContext context) {

  //  return BlocBuilder<NavigationBloc, NavigationState>(
  //        builder: (navContext, navState) {
   return BlocBuilder<DatabaseBloc, DatabaseState>(
         builder: (dbContext, dbState) {
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
         builder: (aContext, aState) {
          return Navigator(
            pages: 
            // ignore: prefer_const_literals_to_create_immutables
            [

                  //else || else if  stackina 
                  // ...[nesisstackina]
              // ...[
              // splash 
              // login
              // register 
              // ]

              //Implementation
              if (aState.status.name == "authenticated"  
                  && dbState is DatabaseLoading) ...[
                       MaterialPage(child: SplashScreen())
                  ]
                  else if(aState.status.name == "unauthenticated") ...[
                    MaterialPage(child: LoginScreen())
                  ] 
                  else  MaterialPage(child: HomeScreen())
                        
                  //]
                  
               
               
                


            //   ///
             
            //   if (aState.status.name == "authenticated" )...[
            //          if (dbState is DatabaseLoading) 
            //          MaterialPage(child: SplashScreen())
                  
            //       //Tarp splash it home nera back button 
            //      else     if (dbState is DatabaseLoaded) 
            //               MaterialPage(child: HomeScreen()), ...[
            //                   if(navState is NavigatedToAdd)
            //             MaterialPage(child: AddRecipeScreen()),                    

            //           if(navState is NavigateToDetais)
            //             MaterialPage(child: RecipeDetailsScreen()),

            //           if(navState is NavigateToProfile)
            //             MaterialPage(child: ProfileScreen())
            //        ] 
            //   ]                    
            
            //  else  ...[  
            //      MaterialPage(child: LoginScreen())   //ateina 
            //   ]
                  
                  
                    
             
                
                     
              


           
              
            //  if(aState.status.name == "unauthenticated" )
            //   MaterialPage(child: LoginScreen())     

            //      else  if (aState.status.name == "authenticated" && dbState is DatabaseLoading)
            //         MaterialPage(child: SplashScreen())                    
            //       else  ...[
            //            // is cia back button to logingScreen
            //            MaterialPage(child: HomeScreen()), 

            //            //if bloc navigator
            //            if(navState is NavigatedToAdd)
            //             MaterialPage(child: AddRecipeScreen()),                      

            //           if(navState is NavigateToDetais)
            //             MaterialPage(child: RecipeDetailsScreen()),

            //           if(navState is NavigateToProfile)
            //             MaterialPage(child: ProfileScreen())
            //       ]
                       
                    
                      
                 
              //
           
            ],
            onPopPage: (route, result) {
              return route.didPop(result);
            },
            
            //transitionDelegate: ,
          );
        });
      });
    // });
  }
}

MaterialPage<dynamic> innerRoutes (NavigationState navState) 
{
    if(navState is NavigatedToAdd)
    {
      return  MaterialPage(child: AddRecipeScreen());
    }
      else if(navState is NavigateToDetais)
      {
        return MaterialPage(child: RecipeDetailsScreen());
      }
      else if(navState is NavigateToProfile)
      {
          return MaterialPage(child: ProfileScreen());
      }
      else 
      {
        return  MaterialPage(child: HomeScreen());
      }                  
  
} 