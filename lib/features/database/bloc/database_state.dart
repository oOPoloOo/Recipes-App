part of 'database_bloc.dart';


abstract class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
  final List<Recipe> listOfRecipeData;
  //final String? displayName;
  const DatabaseSuccess(this.listOfRecipeData);

  @override
  List<Object?> get props => [listOfRecipeData];
}

class DatabaseError extends DatabaseState {
    @override
    List<Object?> get props => [];
}