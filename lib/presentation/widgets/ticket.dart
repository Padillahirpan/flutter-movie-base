import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/entities/transaction.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/widgets/network_image_card.dart';

class Ticket extends StatelessWidget {
  final Transaction transaction;

  const Ticket({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NetworkImageCard(
              imageUrl:
                  "https://image.tmdb.org/t/p/w500${transaction.transactionImage}",
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text('${transaction.title} Ticket'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.theatherName ?? 'Unknown Theater'),
                  Text(
                    DateFormat('EEE, d MMMM y | HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        transaction.watchingTime!,
                      ),
                    ),
                  ),
                  verticalSpace(8.0),
                  Text(
                    '${transaction.ticketAmount} ${transaction.ticketAmount == 1 ? 'Ticket' : 'Tickets'} (${transaction.seats.join(', ')})',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Enjoy your movie experience!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
