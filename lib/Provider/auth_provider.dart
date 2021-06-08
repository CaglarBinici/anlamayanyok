import 'package:anlamayanyok/AnaSayfa/FirstNavigation.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

class AuthProvider extends ChangeNotifier {
  User user;
  AuthStatus status;

  FirebaseAuth _auth;

  static AuthProvider instance = AuthProvider();
  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _checkCurrentUserIsAuthenticated();
  }

  void _checkCurrentUserIsAuthenticated() async {
    user = await _auth.currentUser;

  }
}
