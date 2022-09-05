// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/features/comments/bloc/comments_bloc.dart';
import 'package:recipes_app/widgets/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/services/services.dart';
import 'package:recipes_app/features/data_mover/bloc/data_mover_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/details/recipe.comment.popup.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final DatabaseServices database = DatabaseServices();
  final StorageServices storage = StorageServices();
  final CustomStyles style = CustomStyles();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<DataMoverBloc, DataMoverState>(
      builder: (context, state) {
        return Container(
          height: media.height,
          width: media.width,
          child: Stack(clipBehavior: Clip.none, children: [
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
              child: AspectRatio(
                aspectRatio: 3 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(state.recipe.imgURL),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: media.height * 0.40,
              left: (media.width - media.width * 0.85) / 2,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(30.0), //clipping the whole widget
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.55, //I adjusted here for responsiveness problems on my device
                  width: MediaQuery.of(context).size.width * 0.85,
                  color: Colors.white,
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                width: constraint.biggest.width * 0.85,
                                height: constraint.biggest.height * 0.2,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.recipe.name,
                                  style: style.mealNameButton(),
                                )),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: constraint.biggest.width * 0.85,
                              height: constraint.biggest.height * 0.2,
                              child: Text(
                                state.recipe.recipeDesc,
                                style: style.descriptionButton(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: constraint.biggest.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    '${state.recipe.cookTime}',
                                    style: style.time(),
                                  ),
                                  Text(
                                    'minutes',
                                    style: style.time(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: BlocBuilder<AuthStatusBloc, AuthStatusState>(
                              builder: (context, authState) {
                                return GestureDetector(
                                  onTap: () { 
                                     BlocProvider.of<CommentsBloc>(context)
                                      .add(CommentsLoad(mealName: state.recipe.name));
                                    
                                      showRecipeComments(
                                      state.recipe.name, authState.user.name!, context
                                      );
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.yellow[700],
                                      // ignore: prefer_const_constructors
                                      child: Text('Comment',
                                          // ignore: prefer_const_constructors
                                          style: style.yellowButton())),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    ));
  }
}
