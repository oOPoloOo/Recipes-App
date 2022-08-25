
// ignore_for_file: unnecessary_new, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'screens.export.dart';
import 'package:recipes_app/widgets/widgets.export.dart';
import 'package:recipes_app/helpers/curved.background.line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/database/bloc/database_bloc.dart';
import 'package:recipes_app/widgets/styles/styles.dart';




class HomeScreen extends StatelessWidget{

final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();
final RecipeTile rTile = RecipeTile();
final CustomStyles style = CustomStyles();

var backColor = Colors.amber[400];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(            
                appBar:  PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: AppBar(
                       backgroundColor: backColor,
                       elevation: 0.0,       
                       title: Text(
                        'Cook Book',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                        
                        ),
                       actions: [
                        IconButton(
                          //Why not working with /details !!
                          onPressed: (){Get.to(AddRecipeScreen());},
                          icon: Icon(Icons.add, size: 35,)
                          ),
                          IconButton(
                          onPressed: (){},
                          icon:  
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 22 
                              ),
                          ) 
                          
                          
                              // TextButton(
                              //     style: TextButton.styleFrom(
                              //       backgroundColor: Colors.white,
                              //       shape: CircleBorder(),
                              //     ),
                              //     child: Center(
                              //       child: Icon(
                              //         Icons.search,
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     onPressed: () {},
                              //   ),
                          // CircleAvatar(
                          //       radius: 40,
                          //       backgroundColor: Colors.white,
                          //       child: IconButton(
                          //         icon: Icon(
                          //           Icons.search,
                          //           color: Colors.black,
                          //         ),
                          //         onPressed: () {
                          //           //Implement
                          //         },
                          //       ),
                          //     ),
                          ),
                        ],                        
                      ),
                ),
        body: Stack(
            children: <Widget> [
              ClipPath(
                clipper: CurvedClipPath(),
                child: Container(
                  color: backColor,
                ),
              ),
              Container(                  
                  padding: EdgeInsets.all(20),
                  child: 
                  RefreshIndicator(
                    onRefresh: () async  {

                      BlocProvider.of<DatabaseBloc>(context).add(DatabaseLoad()); 
                       
                      //Added bacause requires future
                      await Future.delayed(const Duration(milliseconds: 50));           
                     
                    },
                    child: 
                    BlocBuilder<DatabaseBloc,DatabaseState>(
                      buildWhen: (previous, current) => current is DatabaseLoaded,
                      builder: (context, state) {
                  
                        if (state is DatabaseInitial) {
                          context.read<DatabaseBloc>().add(DatabaseLoad());
                          return const Center(child: CircularProgressIndicator());
                        }
                        else if (state is DatabaseLoaded) {
                          if (state.listOfRecipeData.isEmpty) {
                            return  Center(
                              child: Text(
                                "No available recipes",
                                style: style.noAvailable(),
                                ),
                            );
                          }
                          else 
                          {
                            //Display list
                            final recipes = state.listOfRecipeData;                    
                             return ListView( 
                                 // ENABLE REFRESH INDICATOR
                                 physics: AlwaysScrollableScrollPhysics(),
                                 children: recipes.map((recipe) => rTile.buildRecipeCard(recipe!, context)).toList()
                              );
                          }
                        }
                        else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                   )                 
                  ),
              ] 
            ),
        );   
      }
    }