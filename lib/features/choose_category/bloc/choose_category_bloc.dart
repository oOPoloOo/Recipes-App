import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipes_app/model/models.dart';

part 'choose_category_event.dart';
part 'choose_category_state.dart';

class ChooseCategoryBloc extends Bloc<ChooseCategoryEvent, ChooseCategoryState> {
  ChooseCategoryBloc() : super(ChooseCategoryInitial()) {
    on<ChooseCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
    //  on<CategorySave>(_saveCategories);    
     on<CategoryPick>(_pickCategory); 
  }
}

  // _saveCategories(CategorySave event, Emitter<ChooseCategoryState> emit) async {
      
  //       emit(CategorySaved(categories: event.allCategories));   
  //   }

  _pickCategory(CategoryPick event, Emitter<ChooseCategoryState> emit) async {
    
      emit(CategoryPicked(category: event.pickedCat)); 
   
  }