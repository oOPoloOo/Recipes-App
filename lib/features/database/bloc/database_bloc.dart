import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.dart';
import 'package:recipes_app/services/services.dart';

part 'database_event.dart';
part 'database_state.dart';


class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseServices _databaseServices;
  
  DatabaseBloc(this._databaseServices) : super(DatabaseInitial()) {
    on<DatabaseFetched>(_fetchRecipeData);
  }

  _fetchRecipeData(DatabaseFetched event, Emitter<DatabaseState> emit) async {
    try
    {
      List<Recipe> listofUserData = await _databaseServices.readRecipesQuery();
      emit(DatabaseSuccess(listofUserData));
    }
    on Exception 
    {
      emit(DatabaseError());
    }     
  }
}
