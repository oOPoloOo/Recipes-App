import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/comments/bloc/comments_bloc.dart';

import '../../model/models.export.dart';

void showRecipeComments(String mealName, String userName, BuildContext context) {

  TextEditingController _commentController = TextEditingController();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(30.0), //clipping the whole widget
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.6, //I adjusted here for responsiveness problems on my device
                  width: MediaQuery.of(context).size.width * 0.8,
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
                                child: Text('Comments'
                                    // state.recipe.name,
                                    // style: style.mealNameButton(),
                                    )),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                                width: constraint.biggest.width * 0.85,
                                //height: constraint.biggest.height * 0.2,
                                alignment: Alignment.centerLeft,
                                child: _CommentsList()                               
                           ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                width: constraint.biggest.width * 0.85,
                                height: constraint.biggest.height * 0.2,
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: _commentController,
                                  decoration: InputDecoration(
                                      labelText: 'Enter comment',
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          if(_commentController.text.isNotEmpty)
                                             BlocProvider.of<CommentsBloc>(context)
                                            .add(CommentUpload(
                                              mealName: mealName, 
                                              comment: Comment(
                                                comment: _commentController.text, 
                                                userName: userName
                                                )
                                              )
                                            );
                                        },
                                        child: Icon(Icons.send)
                                        )
                                      ),
                                  //Icon( Icons.send)
                                ),
                              )),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

class _CommentsList extends StatelessWidget {

  _CommentTile tile = _CommentTile();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {

        if(state is CommentsLoaded)
        {
            return ListView(
            children: state.allComments
                      .map((com) =>
                          //Text(comment.comment)
                          // rTile.buildRecipeCard(
                          //     recipe, catContext
                          //     )
                              tile.buildTile(com.userName, com.comment)
                            )
                      .toList());
       
        } 
        else {
          return Text('No Comments');
        }
        
      },
    );
  }
}

class _CommentTile  {

  Widget buildTile( String userName, String comment) {
   
    return ListTile(
      title: Text(userName),
      subtitle: Text(comment),
    );
  }
}