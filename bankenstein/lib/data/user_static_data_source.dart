///////
/// Class static avec de la data d'utilisateur
//////

abstract class UserStaticDataSource {
  static Future<List<Map<String, dynamic>>> getUsers() async => _users;

  static final _users = [
    {
      'id': 1,
      'firstName': 'Alexis',
      'lastName': 'Vandepitte',
      'email': 'student@oclock.io',
    },
    {
      'id': 2,
      'firstName': 'John',
      'lastName': 'Doe',
      'email': 'test@gmail.com',
    }
  ];
}
