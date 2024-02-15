import 'package:bankenstein/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationStateUnknown()) {
    AuthenticationService.status().listen((event) {
      debugPrint('----------------------');
      debugPrint('NEW AUTH EVENT FROM FIREBASE AUTH');
      debugPrint('----------------------');

      if (event != null) {
        emit(AuthenticationStateAuthenticated());
      } else {
        emit(AuthenticationStateUnauthenticated());
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    try {
      await AuthenticationService.signIn(email, password);
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthenticationStateError(message: e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await AuthenticationService.signUp(email, password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await AuthenticationService.logOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

abstract class AuthenticationState {}

class AuthenticationStateUnknown extends AuthenticationState {}

class AuthenticationStateAuthenticated extends AuthenticationState {}

class AuthenticationStateUnauthenticated extends AuthenticationState {}

class AuthenticationStateError extends AuthenticationState {
  AuthenticationStateError({required this.message});

  final String message;
}
