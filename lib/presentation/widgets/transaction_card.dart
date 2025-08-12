import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/entities/transaction.dart';
import 'package:movie_app/presentation/misc/extensions/integer_extension.dart';

import '../misc/methods.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.lightGreenAccent.withAlpha(40),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: transaction.title != 'Top Up'
                    ? DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${transaction.transactionImage}',
                        ),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: const AssetImage('assets/top_up.png'),
                        fit: BoxFit.cover,
                      ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM y').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        transaction.transactionTime ?? 0,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  verticalSpace(8),
                  Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  verticalSpace(4),
                  Text(
                    transaction.title == 'Top Up'
                        ? '+ ${(-transaction.total).toIDRCurrencyFormat()}'
                        : '- ${transaction.total.toIDRCurrencyFormat()}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: transaction.title == 'Top Up'
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                  verticalSpace(4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
