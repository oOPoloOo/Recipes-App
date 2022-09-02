// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipes_app/features/category_data_mover/bloc/category_data_mover_bloc.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';
import 'package:recipes_app/router/route.names.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'package:recipes_app/widgets/category.widget.dart';
import 'screens.export.dart';
import 'package:recipes_app/widgets/widgets.export.dart';
import 'package:recipes_app/helpers/curved.background.line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/database/bloc/database_bloc.dart';
import 'package:recipes_app/features/categories/bloc/categories_bloc.dart';
import 'package:recipes_app/widgets/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  final DatabaseServices database = DatabaseServices();
  final StorageServices storage = StorageServices();
  final RecipeTile rTile = RecipeTile();
  final CategoryWidget catWidget = CategoryWidget();
  final CustomStyles style = CustomStyles();

  var backColor = Colors.amber[400];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: backColor,
          elevation: 0.0,
          title: Text(
            'Cook Book',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          actions: [
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (dbContext, dbState) {
                  if(dbState is DatabaseLoaded ) {
                      return  IconButton(                        
                        onPressed: () {                          
                          BlocProvider.of<CategoryDataMoverBloc>(dbContext)
                              .add(CategoryDataMoverEvent(allCategories: dbState.categoriesRecipes.getCategories));
                          Get.toNamed('/add');
                        },
                        icon: Icon(
                          Icons.add,
                          size: 35,
                        ));
                     } else {
                      return IconButton(
                       
                        onPressed: () {   
                         // Get.toNamed('/add');
                        },
                        icon: Icon(
                          Icons.add,
                          size: 35,
                        ));
                     }                
              },
            ),
             IconButton(
                onPressed: () {Get.toNamed(profileRouteName);},
                icon: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.person, color: Colors.black, size: 22),
                )),
            // IconButton(
            //     onPressed: () {},
            //     icon: Container(
            //       alignment: Alignment.center,
            //       height: 35,
            //       width: 35,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.white,
            //       ),
            //       child: Icon(Icons.search, color: Colors.black, size: 22),
            //     )),
          ],
        ),
      ),
      body: Container(
        child: Stack(children: <Widget>[
          ClipPath(
            clipper: CurvedClipPath(),
            child: Container(
              color: backColor,
            ),
          ),
          Container(
              child: RefreshIndicator(
              onRefresh: () async {
              BlocProvider.of<DatabaseBloc>(context).add(DatabaseLoad());

              //Added bacause requires future
              await Future.delayed(const Duration(milliseconds: 50));
            },
            child: BlocBuilder<DatabaseBloc, DatabaseState>(
              buildWhen: (previous, current) => current is DatabaseLoaded,
              builder: (dbContext, dbState) {
                if (dbState is DatabaseInitial) {
                  context.read<DatabaseBloc>().add(DatabaseLoad());
                  return const Center(child: CircularProgressIndicator());
                } else if (dbState is DatabaseLoaded) {
                  if (dbState.categoriesRecipes.getRecipes.isEmpty) {
                    return Center(
                      child: Text(
                        "No available recipes",
                        style: style.noAvailable(),
                      ),
                    );
                  } else {
                    //Display list
                    final recipes = dbState.categoriesRecipes.getRecipes;
                    final categories = dbState.categoriesRecipes.getCategories;
                    return Container(
                      height: media.height,
                      child: Column(children: [
                        Container(
                            height: 120,
                            width: double.infinity,
                            child: new ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: categories
                                    .map((cat) => catWidget.buildCategory(
                                        cat, context, recipes))
                                    .toList())),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: BlocBuilder<CategoriesBloc, CategoriesState>(
                              builder: (catContext, catState) {
                                if (catState is CategoriesChanged) {
                                  return ListView(
                                      shrinkWrap: true,
                                      // Enable refresh indicator
                                      physics: AlwaysScrollableScrollPhysics(),
                                      children: catState.recipes
                                          .map((recipe) =>
                                              rTile.buildRecipeCard(
                                                  recipe, catContext))
                                          .toList());
                                } else {
                                  return ListView(
                                      shrinkWrap: true,
                                      // Enable refresh indicator
                                      physics: AlwaysScrollableScrollPhysics(),
                                      children: recipes
                                          .map((recipe) =>
                                              rTile.buildRecipeCard(
                                                  recipe, catContext))
                                          .toList());
                                }
                              },
                            ),
                          ),
                        ),
                      ]),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
        ]),
      ),
    );
  }
}
