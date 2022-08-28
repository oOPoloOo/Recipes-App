import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.export.dart';

part 'category_data_mover_event.dart';
part 'category_data_mover_state.dart';

class CategoryDataMoverBloc extends Bloc<CategoryDataMoverEvent, CategoryDataMoverState> {
  
  CategoryDataMoverBloc() : super(CategoryDataMoverState(
      categories: 
      [
      Category(category: "", imageURL: ""),
      ]
  )) 
  {
    on<CategoryDataMoverEvent>((event, emit) {
     emit(CategoryDataMoverState(categories: event.allCategories));
    });
  }
}
