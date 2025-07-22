import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  });

  Future<Result<List<Transaction>>> getTransactionsByUserId({
    required String userId,
  });
}
