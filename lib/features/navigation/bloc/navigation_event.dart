part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToAdd extends NavigationEvent {}

class NavigateToProfile extends NavigationEvent {}

class NavigateToDetais extends NavigationEvent {}
