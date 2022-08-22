
// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:recipes_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'screens.export.dart';
import 'package:recipes_app/widgets/widgets.export.dart';
import 'package:recipes_app/helpers/curved.background.line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/database/bloc/database_bloc.dart';




class HomeScreen extends StatelessWidget{

final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();
final RecipeTile rTile = RecipeTile();
var backColor = Colors.amber[400];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       // backgroundColor: Colors.amber[400],       
                appBar:  PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: AppBar(
                       backgroundColor: backColor,
                       elevation: 0.0,       
                       title: Text('Cook Book'),
                       actions: [
                        IconButton(
                          //Why not working with /details !!
                          onPressed: (){Get.to(RecipeDetails());},
                          icon: Icon(Icons.add)
                          ),
                          IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.search)
                          ),
                        ],                        
                      ),
                ),
        body: SafeArea(
          child: Stack(

            children: <Widget> [
              ClipPath(
                clipper: CurvedClipPath(),
                child: Container(
                  color: backColor,
                ),
              ),
              Container(                  
                  padding: EdgeInsets.all(20),
                  child: BlocBuilder<DatabaseBloc,DatabaseState>(
                    builder: (context, state) {

                      if (state is DatabaseInitial) {
                        context.read<DatabaseBloc>().add(DatabaseFetched());
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if (state is DatabaseSuccess) {
                        if (state.listOfRecipeData.isEmpty) {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                        else 
                        {
                          //display list
                          final recipes = state.listOfRecipeData;                    
                           return ListView( children: recipes.map(rTile.buildRecipeCard).toList());
                        }
                      }
                      else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )


                  // StreamBuilder<List<Recipe>>(
                  // stream: database.readRecipesStream(),
                  // builder: (context, snapshot) {
                  //       if(snapshot.hasError){      
                         
                  //           return Text('error');
                
                  //       } else if(snapshot.hasData){
                
                  //         final users = snapshot.data!;                    
                  //         return ListView( children: users.map(rTile.buildRecipeCard).toList());   
                
                  //       }
                  //       else
                  //       {                     
                  //         return Center(child: CircularProgressIndicator());
                  //       }
                
                  //       //Think of a way how to remove this!!
                  //       return Text('keistas atvejis');
                  //     },
                  //   ),
                  ),
              ] 
              ),
            )        
        );   
        }
      }