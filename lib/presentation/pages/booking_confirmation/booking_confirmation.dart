import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/create_transaction/create_transaction.dart';
import 'package:movie_app/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/misc/extensions/integer_extension.dart';
import 'package:movie_app/presentation/pages/booking_confirmation/methods/transaction_row.dart';
import 'package:movie_app/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/providers/usercases/create_transaction_provider.dart';
import 'package:movie_app/presentation/widgets/network_image_card.dart';

import '../../../domain/entities/transaction.dart';
import '../../misc/methods.dart';
import '../../providers/router/router_provider.dart';
import '../../widgets/adaptive_back_button.dart';

class BookingConfirmationPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const BookingConfirmationPage({super.key, required this.transactionDetail});

  @override
  ConsumerState<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState
    extends ConsumerState<BookingConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    var (movieDetail, transaction) = widget.transactionDetail;

    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: AdaptiveBackButton(
                  onPressed: () {
                    ref.read(routerProvider).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Booking Confirmation",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              verticalSpace(16.0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
            child: NetworkImageCard(
              width: MediaQuery.of(context).size.width - 48,
              height: (MediaQuery.of(context).size.width - 48) * 0.6,
              borderRadius: 15,
              imageUrl:
                  "https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(8.0),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: const Divider(color: Colors.lightGreen),
          ),
          transactionRow(
            title: 'Showing Date',
            value: DateFormat('EEEE, d MMMM y').format(
              DateTime.fromMillisecondsSinceEpoch(
                transaction.watchingTime ?? 0,
              ),
            ),
            width: MediaQuery.of(context).size.width - 48,
          ),
          transactionRow(
            title: 'Theater',
            value: transaction.theatherName ?? '-',
            width: MediaQuery.of(context).size.width - 48,
          ),
          transactionRow(
            title: 'Seat Number',
            value: transaction.seats.join(', ').isNotEmpty
                ? transaction.seats.join(', ')
                : '-',
            width: MediaQuery.of(context).size.width - 48,
          ),
          transactionRow(
            title: '# of Tickets',
            value: '${transaction.ticketAmount.toString()} ticket(s)',
            width: MediaQuery.of(context).size.width - 48,
          ),
          transactionRow(
            title: 'Ticket Price',
            value: '${transaction.ticketPrice?.toIDRCurrencyFormat() ?? '0'}',
            width: MediaQuery.of(context).size.width - 48,
          ),
          transactionRow(
            title: 'Admin Fee',
            value: '${transaction.adminFee.toIDRCurrencyFormat() ?? '0'}',
            width: MediaQuery.of(context).size.width - 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: const Divider(color: Colors.lightGreen),
          ),
          transactionRow(
            title: 'Total',
            value: '${transaction.total.toIDRCurrencyFormat()}',
            width: MediaQuery.of(context).size.width - 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: ElevatedButton(
              onPressed: () async {
                int transactionTime = DateTime.now().millisecondsSinceEpoch;

                transaction = transaction.copyWith(
                  transactionTime: transactionTime,
                  id: 'flx-$transactionTime-${transaction.uid}',
                );

                CreateTransaction createTransaction = ref.read(
                  createTransactionProvider,
                );

                await createTransaction(
                  CreateTransactionParam(transaction: transaction),
                ).then((result) {
                  switch (result) {
                    case Success(value: _):
                      ref
                          .read(transactionDataProvider.notifier)
                          .refreshTransactiondata();
                      ref.read(userDataProvider.notifier).refreshUserData();
                      ref.read(routerProvider).goNamed('main');
                      break;
                    case Failure(message: var message):
                      context.showSnackBar(
                        'Failed to create transaction: $message',
                      );
                      break;
                    default:
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Pay Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
