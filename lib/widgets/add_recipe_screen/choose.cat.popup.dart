
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/category_data_mover/bloc/category_data_mover_bloc.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';
import 'choose.cat.card.dart';

void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocListener<ChooseCategoryBloc, ChooseCategoryState>(
            bloc: BlocProvider.of<ChooseCategoryBloc>(context),
            listener: (context, state) {
              if (state is CategoryPicked) {
                Navigator.pop(context);
              }
            },
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: BlocBuilder<CategoryDataMoverBloc, CategoryDataMoverState>(
                builder: (moverContext, moverState) {
                  return Container(                      
                      height: 200,
                      width: double.infinity,                      
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: new ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: moverState.categories
                                .map((cat) => chooseCategoryCard(cat, context))
                                .toList()),
                      ));                 
                },
              ),
            ),
          );
        });
  }