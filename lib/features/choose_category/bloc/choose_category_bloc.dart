import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipes_app/model/models.export.dart';

part 'choose_category_event.dart';
part 'choose_category_state.dart';

class ChooseCategoryBloc extends Bloc<ChooseCategoryEvent, ChooseCategoryState> {
  ChooseCategoryBloc() : super(ChooseCategoryRefreshed()) {    
     on<CategoryPick>(_pickCategory); 
        on<ChooseCategoryReset>(_resetCategoryPickField); 
  }
}

  _pickCategory(CategoryPick event, Emitter<ChooseCategoryState> emit) async {
    
      emit(CategoryPicked(category: event.pickedCat)); 
   
  }
  _resetCategoryPickField(ChooseCategoryReset event, Emitter<ChooseCategoryState> emit) async {
    
      emit(ChooseCategoryRefreshed()); 
   
  }