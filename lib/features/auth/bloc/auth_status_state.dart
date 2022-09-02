part of 'auth_status_bloc.dart';

enum AppStatus {authenticated,unauthenticated, neverBuided}

 class AuthStatusState extends Equatable {
  final AppStatus status;
  final User user;
  
  const AuthStatusState._({
    required this.status,
    this.user = User.empty,
  });
  
  const AuthStatusState.neverBuilded() 
    : this._(
        status: AppStatus.neverBuided, 
        user: User.empty
      );

  const AuthStatusState.authenticated(User user ) 
  : this._(
      status: AppStatus.authenticated, 
      user: user
    );

  const AuthStatusState.unauthenticated() 
  : this._(
      status: AppStatus.unauthenticated      
    );

  @override
  List<Object> get props => [status, user];
}


