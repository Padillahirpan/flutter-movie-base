// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/data/firebase/firebase_user_repository.dart';
import 'package:movie_app/data/repositories/transaction_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/transaction.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepository implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepository({
    firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
           firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  }) async {
    firestore.CollectionReference<Map<String, dynamic>> transactionsCollection =
        _firebaseFirestore.collection('transactions');

    try {
      var balanceResult = await FirebaseUserRepository().getUserBalance(
        uid: transaction.uid,
      );
      if (balanceResult.isFailure) {
        return Result.failure(balanceResult.errorMessage!);
      }

      int previousBalance = balanceResult.resultValue!;

      if (previousBalance < transaction.total) {
        return Result.failure('Insufficient balance');
      }
      await transactionsCollection
          .doc(transaction.id)
          .set(transaction.toJson());
      // check if the transaction was created successfully
      var result = await transactionsCollection.doc(transaction.id).get();

      if (result.exists) {
        await FirebaseUserRepository().updateUserBalance(
          uid: transaction.uid,
          balance: previousBalance - transaction.total,
        );
        return Result.success(Transaction.fromJson(result.data()!));
      } else {
        return Result.failure(
          'Transaction creation failed: Transaction not found',
        );
      }
    } catch (e) {
      return Result.failure('Transaction creation failed: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<Transaction>>> getTransactionsByUserId({
    required String userId,
  }) async {
    firestore.CollectionReference<Map<String, dynamic>> transactionsCollection =
        _firebaseFirestore.collection('transactions');

    try {
      var result = await transactionsCollection
          .where('uid', isEqualTo: userId)
          .get();

      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs.map((doc) => Transaction.fromJson(doc.data())).toList(),
        );
      } else {
        return Result.success([]);
      }
    } catch (e) {
      return Result.failure('Failed to fetch transactions: ${e.toString()}');
    }
  }
}
