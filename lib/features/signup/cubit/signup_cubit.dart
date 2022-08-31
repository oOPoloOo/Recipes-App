import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/repositories/auth.repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {

  final AuthRepository _authenticationRepository;
  SignupCubit(this._authenticationRepository) : super(SignupState.initial());


  //Updating value from form
   void emailChanged(String value) {    
    emit(
      state.copyWith(
        email: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void nameChanged(String value) {
    emit(
      state.copyWith(
        name: value,
        status: SignupStatus.initial,
      ),
    );
  }
  
  Future<void> signupFormSubmitter() async {
    
    //Check if not already submitting
    if(state.status == SignupStatus.submitting) return;

    //Start submitting
     emit(
      state.copyWith(       
        status: SignupStatus.submitting,
      ),
    );

    try{

      await _authenticationRepository.signup(
        email: state.email, 
        password: state.password,
        name: state.name);

      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }  
}
