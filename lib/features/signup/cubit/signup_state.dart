part of 'signup_cubit.dart';

enum SignupStatus {initial, submitting, success, error }

 class SignupState extends Equatable {   
   
  final String email;
  final String password;
  final String name;
  final SignupStatus status;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,    
    required this.name, 
  });

  factory SignupState.initial(){
    return const SignupState(
      email: '', 
      password: '', 
      name: '', 
      status: SignupStatus.initial
      );
  }
  
 @override
  List<Object> get props => [email, password, status, name];

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    SignupStatus? status,
    
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,     
      name: name ?? this.name,
    );
  }
}


