import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/integer_extension.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';

Widget cardContent(WidgetRef ref) => Padding(
  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 70.0, 10.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            (ref.watch(userDataProvider).valueOrNull?.balance ?? 0)
                .toIDRCurrencyFormat(),
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(10),
          Text(ref.watch(userDataProvider).valueOrNull?.name ?? ''),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => ref.read(userDataProvider.notifier).topUp(10000),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.add, color: Colors.black, size: 20),
            ),
          ),
          verticalSpace(4),
          Text(
            'Top Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  ),
);
