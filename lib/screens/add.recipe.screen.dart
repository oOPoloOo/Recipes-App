import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipes_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage; // isimt




class RecipeDetails extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  
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
             .uploadFile(imgPath,imgName)
             .then((value) => print('Done'));
            },
             icon: Icon(Icons.upload)
             ),
        ],
      ),
      //adaryt, kad nereiktu firebase_storage naudot
      body: Column(
        children: [
          FutureBuilder(
            future: storage.listFiles(),
            builder: (BuildContext context,
            AsyncSnapshot<firebase_storage.ListResult> snapshot) 
            {
               if(snapshot.connectionState == ConnectionState.done &&
               snapshot.hasData)
               {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.items.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                          onPressed: (){}, 
                          child: Text(snapshot.data!.items[index].name),),
                     );
                    } 
                  ),
                );
               }  
               return Text("Kazkas blogai");  
            },
          ),
          FutureBuilder(
            future: storage.downloadImgURL('Screenshot from 2022-08-20 09-58-19.png'),
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
