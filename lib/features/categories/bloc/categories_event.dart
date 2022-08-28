part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  
   
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategoriesChange extends CategoriesEvent {
 
  final List<Recipe> allRecipes;
  final String category;
  const CategoriesChange({required this.allRecipes, required this.category});
  
  @override
  List<Object> get props => [CategoryFilter(allRecipes, category)];
}

class CategoriesReset extends CategoriesEvent { 
  
  const CategoriesReset();

  @override
  List<Object> get props => [];
}