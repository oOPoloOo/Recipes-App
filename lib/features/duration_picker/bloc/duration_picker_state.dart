part of 'duration_picker_bloc.dart';

class DurationPickerState extends Equatable {
  
   final int cookDuration;
   
  const DurationPickerState({required this.cookDuration});

  @override
  List<Object?> get props => [cookDuration];
}

