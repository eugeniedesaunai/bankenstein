import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationDataSource {
  static Future<void> signIn(String email, String password) async {
    debugPrint('Try to sign In with $email - $password');
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signUp(String email, String password) async {
    debugPrint('Try to sign Up with $email - $password');
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Stream<UserFirebaseModel?> status() {
    return FirebaseAuth.instance.authStateChanges().map((event) =>
        event != null ? UserFirebaseModel.fromFirebaseUser(event) : null);
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
