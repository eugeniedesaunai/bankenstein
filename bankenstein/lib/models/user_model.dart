class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String email;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String,
      );

  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, email: $email}';
  }
}
