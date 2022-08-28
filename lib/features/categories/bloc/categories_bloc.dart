import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/category.filter.model.dart';
import 'package:recipes_app/model/models.export.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {    
    final allRecip;
    
    on<CategoriesChange>( allRecip =  _filterByCategory); 
    on<CategoriesReset>(
     (event, emit) {
          emit(CategoriesChanged(recipes: allRecip));   
      }   
    );    
  }

 Future _filterByCategory(CategoriesChange event, Emitter<CategoriesState> emit) async {
    
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

      return  event.allRecipes;
  }  
}

