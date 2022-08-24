part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object?> get props => [];
}

class DatabaseLoad extends DatabaseEvent {
  // final String? displayName;
  // const DatabaseFetched(this.displayName);
  // @override
  // List<Object?> get props => [displayName];
}

class DatabaseUpload extends DatabaseEvent {
  final Recipe newRecipe;

  const DatabaseUpload({required this.newRecipe});

  @override
  List<Object?> get props => [newRecipe];
}

class DatabaseRefresh extends DatabaseEvent {}