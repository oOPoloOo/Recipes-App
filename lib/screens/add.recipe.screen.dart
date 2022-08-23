import 'package:flutter/material.dart';
import 'package:recipes_app/services/services.dart';
import 'package:get/get.dart';


class RecipeDetails extends StatelessWidget { 
  
final DatabaseServices database = DatabaseServices();
final StorageServices storage = StorageServices();
 final _text = TextEditingController();
 bool _validate = false;

  @override
  Widget build(BuildContext context) {
    var  media = MediaQuery.of(context).size;
    return Scaffold(      
      body: Container(
              height: media.height,
               width: media.width,
               child: Stack(
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
                            child: 
                              LayoutBuilder(
                                builder: (context, constraint) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        flex: 1,                                
                                          child:                               
                                            Container(
                                              width: constraint.biggest.width * 0.85,
                                              height: constraint.biggest.height * 0.2,
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                      controller: _text,
                                                      decoration: InputDecoration(
                                                      labelText: 'Enter the Value',
                                                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                                  ),                     
                                              ),
                                            ),  
                                          ),
                                        Expanded(
                                          flex: 3,                                         
                                          child: Container(
                                            color: Colors.grey,
                                          ),                                         
                                        ),
                                        Expanded(
                                          flex: 2,                                          
                                          child: Container(
                                            color: Colors.pink,
                                          ),                                         
                                        ),                                       
                                        Expanded(
                                        flex:1,                                            
                                        child: GestureDetector(
                                                  onTap: () {
                                                  //_text.text.isEmpty ? _validate = true : _validate = false;   
                                                  print('Start cooking4');   
                                                // print('Validate: ${_validate}');      
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                //height: MediaQuery.of(context).size.height * 0.1,
                                                // width: constraint.biggest.width,
                                                color: Colors.yellow[700],
                                                // ignore: prefer_const_constructors
                                                child: 
                                                const Text(
                                                  'Start Cooking',  
                                                  // ignore: prefer_const_constructors
                                                    style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.w600
                                                    )                                    
                                                )
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
                ] 
               ),
             ),
           );
          }
        }
