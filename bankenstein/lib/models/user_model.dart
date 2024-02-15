import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? email;

  UserModel({required this.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(email: user?.email);
  }
}
