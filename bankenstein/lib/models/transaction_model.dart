class TransactionModel {
  TransactionModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.fromAccount,
    required this.toAccount,
  });

  final int? id;
  final String? name;
  final double? amount;
  final DateTime? date;
  final int? fromAccount;
  final int? toAccount;
}
