import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/transaction_data/transaction_data_provider.dart';

import '../../widgets/ticket.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  bool _isNotTopUp(dynamic transaction) {
    return transaction.title != 'Top Up';
  }

  bool _hasValidWatchingTime(dynamic transaction) {
    return transaction.watchingTime != null;
  }

  bool _isFutureOrCurrentTicket(dynamic transaction) {
    return transaction.watchingTime != null &&
        transaction.watchingTime! >= DateTime.now().millisecondsSinceEpoch;
  }

  List<dynamic> _filterTickets(List<dynamic> transactions) {
    return transactions
        .where(
          (transaction) =>
              _isNotTopUp(transaction) &&
              _hasValidWatchingTime(transaction) &&
              _isFutureOrCurrentTicket(transaction),
        )
        .toList();
  }

  List<dynamic> _sortTickets(List<dynamic> transactions) {
    return transactions
      ..sort((a, b) => a.watchingTime!.compareTo(b.watchingTime!));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref
        .watch(transactionDataProvider)
        .when(
          data: (transactions) {
            final filtered = _filterTickets(transactions);

            if (filtered.isEmpty) {
              log('Filtered transactions are empty');
            } else {
              log('Filtered transactions count: ${filtered.length}');
            }

            final sorted = _sortTickets(filtered);

            return sorted
                .map((transaction) => Ticket(transaction: transaction))
                .toList();
          },
          error: (error, stackTrace) {
            log('Error loading transactions: $error');
            return [Text('Error: $error')];
          },
          loading: () {
            log('Loading transactions...');
            return [Center(child: LinearProgressIndicator())];
          },
        );

    log('this is data transaction: ${data.toString()}');

    return Center(
      child: data.isEmpty
          ? const Text(
              'No tickets available',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: data),
            ),
    );
  }
}

class SearchPageContent extends StatelessWidget {
  const SearchPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Center(
        child: Text(
          'This is the Search Page',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
