import 'package:movie_app/data/repositories/transaction_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/transaction.dart';
import 'package:movie_app/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetTransactions
    implements UseCase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionsResult = await _transactionRepository
        .getTransactionsByUserId(userId: params.uid);

    return switch (transactionsResult) {
      Success(value: final transactions) => Result.success(transactions),
      Failure(:final message) => Result.failure(message),
    };
  }
}
