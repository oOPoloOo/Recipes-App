

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/choose_category/bloc/choose_category_bloc.dart';

import '../../model/models.dart';

Widget chooseCategoryCard(Category category, BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ChooseCategoryBloc>(context)
                    .add(CategoryPick(pickedCat: category));
              },
              child: Container(
                height: 100,
                width: 100,
                child: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(category.imageURL),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(child: Text(category.category))
        ],
      );