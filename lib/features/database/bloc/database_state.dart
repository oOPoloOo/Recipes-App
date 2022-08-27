part of 'database_bloc.dart';


 class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}


class DatabaseLoaded extends DatabaseState {
  // final List<Recipe?> listOfRecipeData;
  final CategoryRecipe categoriesRecipes;

  const DatabaseLoaded(this.categoriesRecipes);
   

  @override
  List<Object> get props => [categoriesRecipes];
}

class DatabaseUploading extends DatabaseState {
  final Recipe newRecipe;

  const DatabaseUploading({required this.newRecipe});

  @override
  List<Object?> get props => [newRecipe];
}


class DatabaseError extends DatabaseState {
    @override
    List<Object?> get props => [];
}