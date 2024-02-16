import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

///////
/// Class qui permet de s'authentifier avec Firebase et de se déconnecter
//////
abstract class AuthenticationDataSource {
  static Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
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
