import 'package:bankenstein/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///////
/// Class qui permettent d'appeler le service qui gère l'authentification,
///  et qui seront instancier grâce au Bloc Provider et bloc Builder dans les vues
//////
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationStateUnknown()) {
    AuthenticationService.status().listen((event) {
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
      debugPrint(email);
      debugPrint(e.toString());
      emit(AuthenticationStateError(message: e.toString()));
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
