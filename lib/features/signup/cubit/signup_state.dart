part of 'signup_cubit.dart';

enum SignupStatus {initial, submitting, success, error }

 class SignupState extends Equatable {   
   
  final String email;
  final String password;
  final String name;
  final String photoLocalPath;
  final SignupStatus status;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,    
    required this.name, 
    required this.photoLocalPath, 
  });

  factory SignupState.initial(){
    return const SignupState(
      email: '', 
      password: '', 
      name: '', 
      photoLocalPath: '',
      status: SignupStatus.initial
      );
  }
  
 @override
  List<Object> get props => [email, password, status, name, photoLocalPath ];

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    String? photoLocalPath,
    SignupStatus? status,
    
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,     
      name: name ?? this.name,
      photoLocalPath: photoLocalPath ?? this.photoLocalPath,
    );
  }
}