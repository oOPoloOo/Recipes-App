import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';


class RecipeDetails extends StatelessWidget { 
  
final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        actions: [
             IconButton(
            onPressed:  () async{

             //Choose photo 
             final data = await storage.pickRecipeImg();
             final imgPath = data[0];
             final imgName = data[1];

             //Upload to cloud storage
             storage
             .uploadFile(imgPath,imgName);
             
            },
             icon: Icon(Icons.upload)
             ),
        ],
      ),
      body: Column(
        children: [          
          FutureBuilder(
            future: storage.downloadImgURL('lasagna.jpg'),
            builder: (BuildContext context,
            AsyncSnapshot<String> snapshot) 
            {
               if(snapshot.connectionState == ConnectionState.done &&
               snapshot.hasData)
               {
                return Container(
                  width: 300,
                  height: 250,
                  child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                );
               }  
               return Text("Kazkas blogai");  
            },
          ),
        ],
      ),
    );
  }
}
