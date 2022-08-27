part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesChanged extends CategoriesState {
 
  final List<Recipe> recipes;
  const CategoriesChanged({required this.recipes});
  
  @override
  List<Object> get props => [recipes];
}
