import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.dart';

part 'data_mover_event.dart';
part 'data_mover_state.dart';

class DataMoverBloc extends Bloc<DataMoverEvent, DataMoverState> {
  DataMoverBloc() : super(DataMoverState(recipe: 
  Recipe(
    cookTime: 0,
    name: '',
    recipeDesc: '',
    imgURL: ''
  ))) {
    on<DataMoverEvent>((event, emit) {
     emit(DataMoverState(recipe: event.recipe));
    });
  }
}
