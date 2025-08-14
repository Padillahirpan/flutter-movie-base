import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/pages/wallet_page/method/wallet_card.dart';

import '../../widgets/adaptive_back_button.dart';
import 'method/recent_transactions.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdaptiveBackButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                verticalSpace(18),
                Text(
                  'My Wallet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpace(24.0),
                walletCard(ref),
                verticalSpace(24.0),
                ...recentTransactions(ref),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
