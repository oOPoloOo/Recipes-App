part of 'category_data_mover_bloc.dart';

 class CategoryDataMoverEvent extends Equatable {
  
  final List<Category> allCategories;
  const CategoryDataMoverEvent({required this.allCategories});

  @override
  List<Object> get props => [allCategories];
}
