import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';
import 'package:recipes_app/widgets/styles/styles.dart';
import 'choose.cat.popup.dart';
  
final CustomStyles style = CustomStyles();

Widget chooseCatField(BuildContext context, TextEditingController _categoryController) => Row(
        children: [
          Expanded(
            child: BlocBuilder<ChooseCategoryBloc, ChooseCategoryState>(
              builder: (context, state) {
                if (state is CategoryPicked) {
                  _categoryController.text = state.category.category;

                  return TextFormField(
                    readOnly: true,
                    controller: _categoryController,
                    style: style.descriptionButton(),
                    decoration: InputDecoration(
                      border: InputBorder.none,                      
                    ),
                    
                  );                               
                } else {                  
                    return Text(
                        'Category',
                        style: style.descriptionButton(),
                    );
                }
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: 125,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Expanded(               
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: GestureDetector(
                    onTap: () => showAlertDialog(context),
                    child: BlocBuilder<ChooseCategoryBloc, ChooseCategoryState>(
                      builder: (context, state) {
                        
                        if (state is CategoryPicked) {
                            return Container(
                          alignment: Alignment.center,
                          color: const Color(0xFFA0A0A0).withOpacity(0.35),                        
                            child:                            
                                 Expanded(
                                   child:                                  
                                    Image(                                           
                                            fit: BoxFit.cover,
                                            image: NetworkImage(state.category.imageURL),
                                            height: 100,
                                            width: 100,
                                          ),
                                 ),
                              );
                        } 
                        else
                        {
                           return Expanded(
                                  child: Icon(
                                Icons.photo,
                                size: 80,
                              ));
                        }                        
                      },
                    ),
                  ),
                ),            
              ),
            ),
          )
        ],
      );