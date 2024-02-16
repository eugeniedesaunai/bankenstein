class RecipientModel {
  final int? id;
  final String? name;
  final String? iban;
  final int userId;

  RecipientModel({
    required this.id,
    required this.name,
    required this.iban,
    required this.userId,
  });
}
