import 'package:bankenstein/data/user_static_data_source.dart';
import 'package:bankenstein/models/user_model.dart';

abstract class UserService {
  // static Future<List<UserModel>> getUsers() async {
  //   final usersAsJson = await UserStaticDataSource.getUsers();
  //   return usersAsJson.map((e) => UserModel.fromJson(e)).toList();
  // }

  static Future<UserModel?> getOneUser(String email) async {
    final usersAsJson = await UserStaticDataSource.getUsers();

    final userList = usersAsJson
        .map((e) => UserModel.fromJson(e))
        .where((element) => element.email == email)
        .toList();

    return userList.isNotEmpty ? userList[0] : null;
  }
}
