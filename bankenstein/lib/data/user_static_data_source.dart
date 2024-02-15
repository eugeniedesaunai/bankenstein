abstract class VehiculesStaticDataSource {
  static Future<List<Map<String, dynamic>>> getVehicules() async => _vehicules;

  static final _vehicules = [
    {
      'lastName': 'Alexis',
      'firstName': 'Vandepitte',
      'email': 'student@oclock.io',
    },
    {
      'lastName': 'John',
      'firstName': 'Doe',
      'email': 'test@gmail.com ',
    }
  ];
}
