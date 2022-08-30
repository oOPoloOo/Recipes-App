import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    

    on<NavigateToAdd>(_toAddPage);    
    on<NavigateToProfile>(_toDetailsPage);  
    on<NavigateToDetais>(_toProfilePage);  
  }

    _toAddPage(NavigateToAdd event, Emitter<NavigationState> emit)  {
        emit(NavigatedToAdd());
    }
    _toDetailsPage(NavigateToProfile event, Emitter<NavigationState> emit)  {
        emit(NavigatedToProfile());
    }
    _toProfilePage(NavigateToDetais event, Emitter<NavigationState> emit)  {
        emit(NavigatedToDetais());
    }
}
