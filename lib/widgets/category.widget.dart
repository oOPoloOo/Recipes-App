import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/model/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../features/categories/bloc/categories_bloc.dart';

class CategoryWidget {

   Widget buildCategory(Category category, BuildContext context, List<Recipe> allRecipes) {
    return  
     Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),          
          child: GestureDetector(
            onTap: () {
             BlocProvider.of<CategoriesBloc>(context).
             add(CategoriesChange(category: category.category,allRecipes: allRecipes));
            },
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
                               image: CachedNetworkImageProvider(category.imageURL),                              
                            ), 
                          ),
                      ),
                    ),                                               
                  Container(                   
                    child: Text(category.category)
                  )
                ],
              ),
          ),
      );

   }
}