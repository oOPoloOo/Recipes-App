part of 'choose_category_bloc.dart';

abstract class ChooseCategoryState extends Equatable {
  const ChooseCategoryState();
  
  @override
  List<Object> get props => [];
}

class ChooseCategoryRefreshed extends ChooseCategoryState {}

class CategoryPicked extends ChooseCategoryState {
 
  final Category category;

  const CategoryPicked({required this.category});
  
  @override
  List<Object> get props => [category];
}