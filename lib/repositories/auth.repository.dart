import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../model/models.export.dart';
c
class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  
  var currentUser = User.empty;

  //Gives data about authenticated user
  //Null if no user authenticated
  Stream<User> get user{
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }
  
  Future<void> signup({
    required String email,
    required String password
  }){}

//   Future<void> loginWithEmailAndPassword({
//     required String email,
//     required String password
//   }){}

// Future<void> logout() async {}
}

// Take user obj from firebase and converting into local user object
extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photoUrl:  photoURL);
  }
}