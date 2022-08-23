import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';


class RecipeDetails extends StatelessWidget { 
  
final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();

  @override
  Widget build(BuildContext context) {
    var  media = MediaQuery.of(context).size;
    return Scaffold(
      
      body:       
          Stack(
            clipBehavior: Clip.none,
            children: [
              ShaderMask(
              shaderCallback: (rect) {
                // ignore: prefer_const_constructors
                return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'images/plateBlack.jpg',
                )         
            ),
            Positioned(
              top: media.height * 0.26,
              left: (media.width - media.width* 0.85) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0), //clipping the whole widget
                child: Container(     
                    height: MediaQuery.of(context).size.height * 0.7, //I adjusted here for responsiveness problems on my device
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraint) {
                        return Stack(
                          children: [                            
                            Positioned(
                              bottom: 0.0,
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: constraint.biggest.width,
                                color: Colors.yellow[700],
                                // ignore: prefer_const_constructors
                                child: Text(
                                  'Add Recipe',                                 
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
              
              ),
            ),
            // Positioned(
            //   top: 200,
            //   left: 18,
            //   child: 
            //   Card(
            //     color: Colors.white70,
                
            //       shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30),
            //           ),
            //           child: Container(
            //             height: 550,
            //             width: 350,
                         
            //             padding: EdgeInsets.only(top: 450),
            //             child: Container(
                           
            //               color: Colors.yellow,
            //               child: Text('Add Recipe'),
            //             ),
            //           )
                     
            //   ),
            // ),
            ] 
          ),
          
       
    );
  }
}
