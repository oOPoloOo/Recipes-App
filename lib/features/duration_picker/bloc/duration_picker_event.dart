part of 'duration_picker_bloc.dart';

 class DurationPickerEvent extends Equatable {
  
   final int cookDuration;
  const DurationPickerEvent({required this.cookDuration});

  @override
  List<Object?> get props => [cookDuration];
}

