import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
}
class AuthService {
  final FirebaseAuth authx = FirebaseAuth.instance;

  Future signOut() async {
    try {
      return await authx.signOut();
    }catch (e) {
      print(e.toString());
      return null;
    }
  }
}