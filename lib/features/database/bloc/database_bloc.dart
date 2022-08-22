import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/services/services.dart';

part 'database_event.dart';
part 'database_state.dart';


class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseServices _databaseServices;
  
  DatabaseBloc(this._databaseServices) : super(DatabaseInitial()) {
    on<DatabaseLoad>(_fetchRecipeData);
    on<DatabaseRefresh>(_refreshRecipeData);
  }

  _fetchRecipeData(DatabaseLoad event, Emitter<DatabaseState> emit) async {
    try
    {
      emit(DatabaseLoading());
      List<Recipe> listofUserData = await _databaseServices.readRecipesQuery();
      emit(DatabaseLoaded(listofUserData));
    }
    on Exception 
    {
      emit(DatabaseError());
    }     
  }

   _refreshRecipeData(DatabaseRefresh event, Emitter<DatabaseState> emit) async {
    try
    {
      emit(DatabaseRefreshing());
      List<Recipe> listofUserData = await _databaseServices.readRecipesQuery();
      emit(DatabaseLoaded(listofUserData));
    }
    on Exception 
    {
      emit(DatabaseError());
    }     
  }
}
