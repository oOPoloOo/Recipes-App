
import 'package:recipes_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'screens.export.dart';
import 'package:recipes_app/widgets/widgets.export.dart';


class HomeScreen extends StatelessWidget {

final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();
final RecipeTile rTile = RecipeTile();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: StreamBuilder<List<Recipe>>(
        stream: database.readRecipes(),
        builder: (context, snapshot) {
              if(snapshot.hasError){               
                print('fine');
                  return Text('error');


              } else if(snapshot.hasData){

                 final users = snapshot.data!;                    
                 return ListView( children: users.map(rTile.buildRecipe).toList());   

              }
              else
              {                     
                return Center(child: CircularProgressIndicator());
              }

              //Think of a way how to remove this!!
              return Text('keistas atvejis');
            },
        ),
    );
  }
}