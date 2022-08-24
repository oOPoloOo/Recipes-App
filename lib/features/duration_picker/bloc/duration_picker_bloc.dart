import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'duration_picker_event.dart';
part 'duration_picker_state.dart';

class DurationPickerBloc extends Bloc<DurationPickerEvent, DurationPickerState> {
  DurationPickerBloc() : super(DurationPickerState(cookDuration: 0)) {
    on<DurationPickerEvent>((event, emit) {
      emit(DurationPickerState(cookDuration: event.cookDuration));
    });
  }
}
