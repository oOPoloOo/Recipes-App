part of 'auth_status_bloc.dart';

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();

  @override
  List<Object> get props => [];
}

class AuthLogoutRequest extends AuthStatusEvent{}


class AuthUserChanged extends AuthStatusEvent{
  final User user;

  const AuthUserChanged(this.user);

  @override
  List<Object> get props => [user];
}