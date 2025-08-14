import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:movie_app/presentation/widgets/transaction_card.dart';

List<Widget> recentTransactions(WidgetRef ref) => [
  const Text('Recent Transactions'),
  verticalSpace(18.0),
  ...ref
      .watch(transactionDataProvider)
      .when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 400,
                width: double.infinity,
                child: Center(
                  child: const Text(
                    'No recent transactions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ];
          }
          return (transactions..sort(
                (a, b) => b.transactionTime!.compareTo(a.transactionTime!),
              ))
              .map((transaction) => TransactionCard(transaction: transaction));
        },
        error: (error, stackTrace) => [Text('Error: $error')],
        loading: () => [const CircularProgressIndicator()],
      ),
];
