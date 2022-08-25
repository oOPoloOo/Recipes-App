part of 'data_mover_bloc.dart';

 class DataMoverEvent extends Equatable {
  final Recipe recipe;
  const DataMoverEvent({required this.recipe});
  @override
  List<Object> get props => [recipe];
}
