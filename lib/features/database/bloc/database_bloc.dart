import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/repositories/recipes.repository.dart';

part 'database_event.dart';
part 'database_state.dart';


class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final RecipesRepository _recipesRepo;
  
  DatabaseBloc(this._recipesRepo) : super(DatabaseInitial()) {
    on<DatabaseLoad>(_fetchRecipeData);    
    on<DatabaseUpload>(_uploadRecipeData);
  }

  _fetchRecipeData(DatabaseLoad event, Emitter<DatabaseState> emit) async {
    try
    {
      emit(DatabaseLoading());
      List<Recipe> listofUserData = await _recipesRepo.readRecipes();
      // String meatball = await _recipesRepo.downloadImgURL('meatbals.jpg');      
      emit(DatabaseLoaded(listofUserData));
    }
    on Exception 
    {
      emit(DatabaseError());
    }     
  }

   _uploadRecipeData(DatabaseUpload event, Emitter<DatabaseState> emit) async {
    try
    {
      emit(DatabaseUploading(newRecipe: event.newRecipe)); 
      await _recipesRepo.writeRecipe(event.newRecipe);          
    }
    on Exception 
    {
      emit(DatabaseError());
    }     
  }
}
