import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/model/models.export.dart';
import 'package:recipes_app/repositories/auth.repository.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {

  
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AuthStatusBloc({required AuthRepository authRepository}) 
  : _authRepository = authRepository,
    super(
      //Check status of current user
      authRepository.currentUser.isNotEmpty
      ? AuthStatusState.authenticated(authRepository.currentUser)
      : const AuthStatusState.unauthenticated() ) {
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequest>(_onLogoutRequested);
     
     //Stream<AuthStatusState> get stateStream {return state;}
     
    _userSubscription = _authRepository.user.listen((user) => 
      add(AuthUserChanged(user)),
    );
  }

  AuthStatusState get authState  {
      return state; 
  }
  // Stream<AuthStatusState> get authStateStream  {
  //     return state; 
  // }


  //If event have user set state to authenticated
  void _onUserChanged(AuthUserChanged event, Emitter<AuthStatusState> emit)
  {
    emit(event.user.isNotEmpty 
     ? AuthStatusState.authenticated(event.user) 
     :  const AuthStatusState.unauthenticated());
  }

  void _onLogoutRequested(AuthLogoutRequest event, Emitter<AuthStatusState> emit)
  {
    unawaited(_authRepository.logout());
  }

  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
