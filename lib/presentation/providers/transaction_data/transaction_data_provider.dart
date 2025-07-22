import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/usecases/get_transactions/get_transactions.dart';
import 'package:movie_app/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/providers/usercases/get_transaction_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/result.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/user.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);

      var result = getTransactions(GetTransactionsParam(uid: user.uid));

      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }

    return const [];
  }

  Future<void> refreshTransactiondata() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);

      var result = await getTransactions(GetTransactionsParam(uid: user.uid));

      switch (result) {
        case Success(value: final transactions):
          state = AsyncData(transactions);
        case Failure(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
