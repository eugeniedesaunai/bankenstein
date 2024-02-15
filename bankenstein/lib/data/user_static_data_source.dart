abstract class UserStaticDataSource {
  static Future<List<Map<String, dynamic>>> getUsers() async => _vehicules;

  static final _vehicules = [
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
