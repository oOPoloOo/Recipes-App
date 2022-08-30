import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:recipes_app/repositories/auth.repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
 

   final AuthRepository _authenticationRepository;

    LoginCubit(this._authenticationRepository) : super( LoginState.initial());

   //Updating value from form
   void emailChanged(String value) {    
    emit(
      state.copyWith(
        email: value,
        status: LoginStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    
    //Check if not already submitting
    if(state.status == LoginStatus.submitting) return;

    //Start submitting
     emit(
      state.copyWith(       
        status: LoginStatus.submitting,
      ),
    );

    try{

      await _authenticationRepository.loginWithEmailAndPassword(
        email: state.email, 
        password: state.password);

      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }  
}
