// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:recipes_app/model/models.export.dart';

// part 'auth_status_event.dart';
// part 'auth_status_state.dart';

// class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {

//   final AuthRepository _authRepository;
//   StreamSubscription<User?> _userSubscription;

//   AuthStatusBloc({required AuthRepository authRepository}) 
//   : _authRepository = authRepository,
//     super(const AuthStatusState.unauthenticated()) {
//     on<AuthUserChanged>(_onUserChanged);
//     on<AuthLogoutRequest>(_onLogoutRequested);
//   }

//   void _onUserChanged(AuthUserChanged event, Emitter<AuthStatusState> emit)
//   {

//   }

//   void _onLogoutRequested(AuthLogoutRequest event, Emitter<AuthStatusState> emit)
//   {
    
//   }
// }
