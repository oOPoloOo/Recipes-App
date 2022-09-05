import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/category.model.dart';
import 'package:recipes_app/model/comment.model.dart';
import 'package:recipes_app/repositories/recipes.repository.dart';
import 'package:recipes_app/services/firebase.database.service.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {

  final RecipesRepository _recipeRepository;
  
  CommentsBloc(this._recipeRepository) : super(CommentsInitial()) {
    on<CommentsLoad>(_LoadComments);
    on<CommentUpload>(_UploadComments);
  } 


 Future _UploadComments(CommentUpload event, Emitter<CommentsState> emit) async {
    
    await _recipeRepository.writeComment(event.comment, event.mealName);

    add(CommentsLoad(mealName: event.mealName));
 }  

  Future _LoadComments(CommentsLoad event, Emitter<CommentsState> emit) async {
    
     final List<Comment> allComments;
     bool commExists = false;
    
     commExists =  await _recipeRepository.commentsExist(event.mealName);
   
     if(commExists)
     {         
        allComments = await _recipeRepository.readComments(event.mealName);
        emit(CommentsLoaded(allComments: allComments));
     }
     else 
     {
      emit(CommentsInitial());
     }
  }  
}
