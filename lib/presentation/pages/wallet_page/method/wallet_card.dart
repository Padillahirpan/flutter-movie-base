import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/pages/wallet_page/method/card_content.dart';
import 'package:movie_app/presentation/pages/wallet_page/method/card_pattern.dart';
import 'package:movie_app/presentation/pages/wallet_page/method/membership_banner.dart';

Widget walletCard(WidgetRef ref) => Container(
  width: double.infinity,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withAlpha(40),
        blurRadius: 4.0,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: Stack(children: [cardPattern(), membershipBanner(), cardContent(ref)]),
);
