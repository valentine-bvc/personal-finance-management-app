import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  int? accountId;

  @ignore
  String? accountName;

  @Enumerated(EnumType.name)
  TransactionType? transactionType;

  @ignore
  String? accountCurrency;

  double? amount;

  int? categoryId;

  @ignore
  String? categoryName;

  @ignore
  String? categoryColor;

  DateTime? date;

  String? notes;

  Transaction({
    required this.accountId,
    required this.transactionType,
    required this.amount,
    required this.categoryId,
    required this.date,
    required this.notes,
  });

  @override
  String toString() => 'Transaction('
      'id: $id, '
      'accountId: $accountId, '
      'accountName: $accountName, '
      'transactionType: ${EnumToString.convertToString(transactionType)}, '
      'accountCurrency: $accountCurrency, '
      'amount: $amount, '
      'categoryId: $categoryId, '
      'categoryName: $categoryName, '
      'categoryColor: $categoryColor, '
      'date: $date, '
      'notes: $notes'
      ')';
}
