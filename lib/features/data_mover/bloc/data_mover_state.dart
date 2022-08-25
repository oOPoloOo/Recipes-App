part of 'data_mover_bloc.dart';

class DataMoverState extends Equatable {

  final Recipe  recipe;
  
  const DataMoverState({required this.recipe});

  @override
  List<Object> get props => [recipe];
}


