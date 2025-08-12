import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/integer_extension.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';

import '../../../misc/methods.dart';
import '../../../providers/user_data/user_data_provider.dart';

Widget userInfo(WidgetRef ref) {
  var userData = ref.watch(userDataProvider).value;

  return Padding(
    padding: const EdgeInsets.fromLTRB(24.0, 2.0, 24.0, 0),
    child: Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: NetworkImage(
                (userData?.photoUrl?.isNotEmpty ?? false)
                    ? userData!.photoUrl!
                    : 'https://api.dicebear.com/9.x/adventurer-neutral/png?seed=${userData?.email ?? 'Guest'}&size=64',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpace(16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${getGreeting()}, ${userData?.name.split(' ').first ?? ''}!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Let\'s explore the world of movies!',
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
            verticalSpace(8.0),
            GestureDetector(
              onTap: () {
                ref.read(routerProvider).pushNamed('wallet');
              },
              child: Row(
                children: [
                  Icon(Icons.wallet, size: 16, color: Colors.grey[400]),
                  horizontalSpace(4.0),
                  Text(
                    userData?.balance.toIDRCurrencyFormat() ?? '0 IDR',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.greenAccent[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
