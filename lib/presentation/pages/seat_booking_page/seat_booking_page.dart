import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/pages/seat_booking_page/methods/legend.dart';
import 'package:movie_app/presentation/pages/seat_booking_page/methods/movie_screen.dart';
import 'package:movie_app/presentation/pages/seat_booking_page/methods/seat_section.dart';
import 'package:movie_app/presentation/widgets/seat.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/transaction.dart';
import '../../misc/methods.dart';
import '../../providers/router/router_provider.dart';
import '../../widgets/adaptive_back_button.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const SeatBookingPage({super.key, required this.transactionDetail});

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];

  @override
  void initState() {
    super.initState();

    Random random = Random();
    int reservedNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(reservedNumber)) {
        reservedSeats.add(reservedNumber);
      }
      reservedNumber = random.nextInt(36) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;

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
                  movieDetail.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              verticalSpace(8.0),
            ],
          ),

          Center(
            child: Column(
              children: [
                movieScreen(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seatSection(
                      seatNumbers: List.generate(14, (index) => index + 1),
                      onTap: (seatNumber) {
                        if (!selectedSeats.contains(seatNumber)) {
                          setState(() {
                            selectedSeats.add(seatNumber);
                          });
                        } else {
                          setState(() {
                            selectedSeats.remove(seatNumber);
                          });
                        }
                      },
                      seatStatusChecker: (seatNumber) {
                        return reservedSeats.contains(seatNumber)
                            ? SeatStatus.reserved
                            : selectedSeats.contains(seatNumber)
                            ? SeatStatus.selected
                            : SeatStatus.available;
                      },
                    ),
                    horizontalSpace(30),
                    seatSection(
                      seatNumbers: List.generate(14, (index) => index + 15),
                      onTap: (seatNumber) {
                        // Handle seat selection
                        print('Seat $seatNumber tapped');
                        if (!selectedSeats.contains(seatNumber)) {
                          setState(() {
                            selectedSeats.add(seatNumber);
                          });
                        } else {
                          setState(() {
                            selectedSeats.remove(seatNumber);
                          });
                        }
                      },
                      seatStatusChecker: (seatNumber) {
                        return reservedSeats.contains(seatNumber)
                            ? SeatStatus.reserved
                            : selectedSeats.contains(seatNumber)
                            ? SeatStatus.selected
                            : SeatStatus.available;
                      },
                    ),
                    verticalSpace(12),
                  ],
                ),
                verticalSpace(24.0),
                legend(),
                verticalSpace(40.0),
                Text(
                  'Selected Seats: ${selectedSeats.length}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedSeats.isEmpty) {
                          context.showSnackBar(
                            'Please select at least one seat',
                          );
                          return;
                        }
                        context.showSnackBar(
                          'Booking confirmed for seats: ${selectedSeats.join(', ')}',
                        );
                        var updatedTransaction = transaction.copyWith(
                          seats: (selectedSeats..sort())
                              .map((e) => e.toString())
                              .toList(),
                          ticketAmount: selectedSeats.length,
                          ticketPrice: 25000,
                          total:
                              selectedSeats.length * 25000 +
                              transaction.adminFee,
                        );

                        ref
                            .read(routerProvider)
                            .pushNamed(
                              'booking-confirmation',
                              extra: (movieDetail, updatedTransaction),
                            );
                      },
                      child: Text('Confirm Booking'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
