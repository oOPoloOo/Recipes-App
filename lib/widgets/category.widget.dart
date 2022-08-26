import 'package:flutter/material.dart';

class CategoryWidget {

   Widget buildCategory() {
    return  
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
      );

   }
}