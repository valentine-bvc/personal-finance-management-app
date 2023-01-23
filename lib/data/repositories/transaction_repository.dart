import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionRepository {
  final _logger = getLogger('CategoryRepository');
  final TransactionDao transactionDao;

  TransactionRepository({required this.transactionDao});

  Future<Transaction> createTransaction(Transaction transaction) {
    _logger.i('argument: $transaction');
    return transactionDao.createTransaction(transaction);
  }

  Future<List<Transaction>> createTransactions(List<Transaction> transactions) {
    _logger.i('argument: $transactions');
    return transactionDao.createTransactions(transactions);
  }

  Future<Transaction> updateTransaction(Transaction transaction) {
    _logger.i('argument: $transaction');
    return transactionDao.updateTransaction(transaction);
  }

  Future<Id> deleteTransaction(Id id) {
    _logger.i('argument: $id');
    return transactionDao.deleteTransaction(id);
  }

  Future<int> deleteTransactionsByTransferId(String transferId) {
    _logger.i('argument: $transferId');
    return transactionDao.deleteTransactionsByTransferId(transferId);
  }

  Future<List<Transaction>> getTransactions() {
    _logger.i('argument: NONE');
    return transactionDao.getTransactions();
  }

  Stream<List<Transaction>> transactionCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* transactionDao.transactionCollectionStream();
  }
}