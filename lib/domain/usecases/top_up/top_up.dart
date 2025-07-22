import 'package:movie_app/data/repositories/transaction_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/create_transaction/create_transaction.dart';
import 'package:movie_app/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:movie_app/domain/usecases/top_up/top_up_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';
import 'package:movie_app/domain/entities/transaction.dart';

class TopUp implements UseCase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction = CreateTransaction(
      transactionRepository: _transactionRepository,
    );

    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var createTransactionResult = await createTransaction(
      CreateTransactionParam(
        transaction: Transaction(
          uid: params.userId,
          title: 'Top Up',
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
          id: 'flxtp-$transactionTime-${params.userId}',
        ),
      ),
    );

    return switch (createTransactionResult) {
      Success(value: _) => Result.success(null),
      Failure(:final message) => Result.failure('Failed to top up: $message'),
    };
  }
}
