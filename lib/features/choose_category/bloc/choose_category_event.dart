part of 'choose_category_bloc.dart';

abstract class ChooseCategoryEvent extends Equatable {
  const ChooseCategoryEvent();

  @override
  List<Object> get props => [];
}

// class CategorySave extends ChooseCategoryEvent {
 
//   final List<Category> allCategories;
  
//   const CategorySave({required this.allCategories});
  
//   @override
//   List<Object> get props => [allCategories];
// }

class CategoryPick extends ChooseCategoryEvent {
 
  final Category pickedCat;
  
  const CategoryPick({required this.pickedCat});
  
  @override
  List<Object> get props => [pickedCat];
}