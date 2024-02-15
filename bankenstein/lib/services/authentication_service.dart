import 'package:bankenstein/data/authentication_data_source.dart';
import 'package:bankenstein/models/user_model.dart';

abstract class AuthenticationService {
  static Future<void> signIn(String email, String password) async {
    return await AuthenticationDataSource.signIn(email, password);
  }

  static Future<void> signUp(String email, String password) async {
    return await AuthenticationDataSource.signUp(email, password);
  }

  static Future<void> logOut() async {
    return await AuthenticationDataSource.logOut();
  }

  static Stream<UserModel?> status() {
    return AuthenticationDataSource.status();
  }
}
