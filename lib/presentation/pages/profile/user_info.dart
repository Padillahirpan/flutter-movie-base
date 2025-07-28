import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';

List<Widget> userInfo(WidgetRef ref) => [
  Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[300],
      image: DecorationImage(
        image: NetworkImage(
          ref.watch(userDataProvider).valueOrNull?.photoUrl ??
              'https://api.dicebear.com/9.x/adventurer-neutral/png?seed=${ref.watch(userDataProvider).valueOrNull?.email ?? 'Guest'}&size=64',
        ),
        fit: BoxFit.cover,
      ),
    ),
  ),
  verticalSpace(20),
  Text(
    ref.watch(userDataProvider).valueOrNull?.name ?? 'No Name',
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  Text(ref.watch(userDataProvider).valueOrNull?.email ?? 'No Email'),
];
