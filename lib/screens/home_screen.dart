
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

    var media = MediaQuery.of(context).size;

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
                          ),
                        ],                        
                      ),
                ),
        body:  
        
 
//////////////////////////////////////////////////
 Container(
          child: Stack(
              children: <Widget> [
                ClipPath(
                  clipper: CurvedClipPath(),
                  child: Container(
                    color: backColor,
                  ),
                ),
                Container(                  
                   // padding: EdgeInsets.only(left: 20, right: 20),
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
                               return Container(
                                height: media.height,
                                child: Column(
                                  children: [
                                  Container(
                                    // height: media.height * 0.2,
                                    height: 100,
                                    width: double.infinity,
                                    child: new ListView(
                                      scrollDirection: Axis.horizontal,                                      
                                      shrinkWrap: true,
                                      children: <Widget>[       
                                         Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ), 

                                          Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),

                                          Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),

                                          Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),

                                              Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),

                                              Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),

                                          Padding(
                                           padding: const EdgeInsets.only(left: 8.0, right: 8),
                                           child: Column(
                                             children: [                                             
                                                  Expanded(
                                                    child: AspectRatio(
                                                    aspectRatio: 1/1,                                          
                                                        child: 
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(18.0),                                                          
                                                          child:  
                                                          Image(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage('images/breakfast.png'),
                                                              height: 25,
                                                              width: 25,
                                                              ), 
                                                        ),
                                                    ),
                                                  ),                                               
                                                Text('data')
                                             ],
                                           ),
                                         ),
                                      ],
                                    )
                                    
                                  ),
                                  
                                  Expanded(                                   
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: ListView( 
                                        shrinkWrap: true,
                                       // ENABLE REFRESH INDICATOR
                                       physics: AlwaysScrollableScrollPhysics(),
                                       children: recipes.map((recipe) => rTile.buildRecipeCard(recipe!, context)).toList()
                                      ),
                                    ),
                                  ),
                                  ]                                 
                                ),
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
           ),
        );   
      }
    }