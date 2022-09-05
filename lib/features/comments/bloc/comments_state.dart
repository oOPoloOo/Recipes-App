part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
  
  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState 
{
   final List<Comment> allComments;
  const CommentsLoaded({required this.allComments});
  
  @override
  List<Object> get props => [allComments];
}
