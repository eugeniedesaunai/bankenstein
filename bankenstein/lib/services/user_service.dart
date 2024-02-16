import 'package:bankenstein/data/user_static_data_source.dart';
import 'package:bankenstein/models/user_model.dart';

///////
/// Class qui permet d'appeler la dataSource correspondant à l'utilisateur - UserStaticDataSource
//////
abstract class UserService {
  static Future<UserModel?> getOneUser(String email) async {
    final usersAsJson = await UserStaticDataSource.getUsers();

    final userList = usersAsJson
        .map((e) => UserModel.fromJson(e))
        .where((element) => element.email == email)
        .toList();

    return userList.isNotEmpty ? userList[0] : null;
  }
}
