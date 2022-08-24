part of 'database_bloc.dart';


abstract class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseRefreshing extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  final List<Recipe> listOfRecipeData;

  const DatabaseLoaded(this.listOfRecipeData);

  @override
  List<Object?> get props => [listOfRecipeData];
}

class DatabaseUploading extends DatabaseState {
  final Recipe newRecipe;

  const DatabaseUploading({required this.newRecipe});

  @override
  List<Object?> get props => [newRecipe];
}

class DatabaseUploaded extends DatabaseState {}

class DatabaseError extends DatabaseState {
    @override
    List<Object?> get props => [];
}