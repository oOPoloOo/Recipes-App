import 'package:flutter/material.dart';
import 'package:recipes_app/model/models.dart';

class RecipeTile  {  

  Widget buildRecipe(Recipe recipe) => ListTile(
  //leading: CircleAvatar(child:Text(recipe.name)), // paveiksliukas
  title: Text(recipe.name ), // didelis txt
  subtitle: Text( '${recipe.cookTime}') // mazas txt zemiau
  );
}
