import 'package:bankenstein/models/transaction_model.dart';
import 'package:bankenstein/models/user_model.dart';

class AccountModel {
  AccountModel({
    required this.id,
    required this.label,
    required this.balance,
    required this.iban,
    required this.userId,
    required this.transactions,
  });

  final int? id;
  final String? label;
  final double? balance;
  final String? iban;
  final UserModel? userId;
  final List<TransactionModel>? transactions;
}
