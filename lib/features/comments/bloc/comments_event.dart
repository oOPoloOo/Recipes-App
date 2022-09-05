part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}
class CommentsLoad extends CommentsEvent
{
  final String mealName;

  const CommentsLoad({required this.mealName});

  @override
  List<Object> get props => [mealName];
}

class CommentUpload extends CommentsEvent
{
  final String mealName;
  final Comment comment;

  const CommentUpload({required this.mealName, required this.comment});

  @override
  List<Object> get props => [comment, mealName];
}