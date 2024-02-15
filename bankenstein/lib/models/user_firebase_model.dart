import 'package:firebase_auth/firebase_auth.dart';

class UserFirebaseModel {
  final String? email;

  UserFirebaseModel({required this.email});

  factory UserFirebaseModel.fromFirebaseUser(User user) {
    return UserFirebaseModel(email: user?.email);
  }
}
