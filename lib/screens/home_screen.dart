import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipes_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            //Issiaiskint kodel neveikia su /route tekstu
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
                  print('fine'); // cia ateina
                 return ListView( children: users.map(rTile.buildRecipe).toList());   
                
              }
              else
              {        
                 print('else');        
                return Center(child: CircularProgressIndicator(),);
              }

              //Pataisyt sita
             return Text('keistas atvejis');
            },

        ),
    );
  }
}