part of 'choose_category_bloc.dart';

abstract class ChooseCategoryState extends Equatable {
  const ChooseCategoryState();
  
  @override
  List<Object> get props => [];
}

class ChooseCategoryInitial extends ChooseCategoryState {}

// class CategorySaved extends ChooseCategoryState {
 
//   final List<Category> categories;
//   const CategorySaved({required this.categories});
  
//   @override
//   List<Object> get props => [categories];
// }

class CategoryPicked extends ChooseCategoryState {
 
  final Category category;

  const CategoryPicked({required this.category});
  
  @override
  List<Object> get props => [category];
}