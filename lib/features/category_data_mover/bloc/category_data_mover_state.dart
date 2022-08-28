part of 'category_data_mover_bloc.dart';

class CategoryDataMoverState extends Equatable {
  
  final List<Category> categories;
  const CategoryDataMoverState({required this.categories});
  
  @override
  List<Object> get props => [categories];
}


