import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/category.filter.model.dart';
import 'package:recipes_app/model/models.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {    
    on<CategoriesChange>(_filterByCategory);    
  }

  _filterByCategory(CategoriesChange event, Emitter<CategoriesState> emit) async {
    
     final filterRecipes;
     
     if(event.category == 'All')
     {
      filterRecipes = event.allRecipes;
     }else 
     {
        filterRecipes = event.allRecipes.where((recipe) 
        {           
          return recipe.category.contains(event.category);
        }
        ).toList(); 
     }         
     
      emit(CategoriesChanged(recipes: filterRecipes));   
  }

}

