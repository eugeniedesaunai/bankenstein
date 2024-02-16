import 'package:bankenstein/data/authentication_data_source.dart';
import 'package:bankenstein/models/user_firebase_model.dart';

///////
/// Class qui permet d'appeler la dataSource correspondant à l'authentification - AuthenticationDataSource
//////
abstract class AuthenticationService {
  static Future<void> signIn(String email, String password) async {
    return await AuthenticationDataSource.signIn(email, password);
  }

  static Future<void> logOut() async {
    return await AuthenticationDataSource.logOut();
  }

  static Stream<UserFirebaseModel?> status() {
    return AuthenticationDataSource.status();
  }
}
