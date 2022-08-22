part of 'database_bloc.dart';


abstract class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  final List<Recipe> listOfRecipeData;
  //final String? displayName;
  const DatabaseLoaded(this.listOfRecipeData);

  @override
  List<Object?> get props => [listOfRecipeData];
}

class DatabaseRefreshing extends DatabaseState {}

class DatabaseError extends DatabaseState {
    @override
    List<Object?> get props => [];
}