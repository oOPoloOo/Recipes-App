import 'package:flutter/material.dart';
import 'package:recipes_app/model/models.dart';

class CategoryWidget {

   Widget buildCategory(Category category, BuildContext context) {
    return  
     Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),          
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
                             image: NetworkImage(category.imageURL),                              
                          ), 
                        ),
                    ),
                  ),                                               
                Container(
                 
                  child: Text(category.category))
              ],
            ),
      );

   }
}