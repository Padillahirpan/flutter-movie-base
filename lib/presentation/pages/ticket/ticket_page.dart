import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/transaction_data/transaction_data_provider.dart';

import '../../widgets/ticket.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref
        .watch(transactionDataProvider)
        .when(
          data: (transactions) {
            final filtered = transactions
                .where(
                  (element) =>
                      element.title != 'Top Up' &&
                      element.watchingTime != null &&
                      element.watchingTime! >=
                          DateTime.now().millisecondsSinceEpoch,
                )
                .toList();

            if (filtered.isEmpty) {
              log('Filtered transactions are empty');
            } else {
              log('Filtered transactions count: ${filtered.length}');
            }

            filtered.sort((a, b) => a.watchingTime!.compareTo(b.watchingTime!));

            return filtered
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
          : ListView(children: data),
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
