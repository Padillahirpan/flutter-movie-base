import 'package:flutter/material.dart';

import '../../../../theme.dart';

Widget movieScreen() => Container(
  width: double.infinity,
  height: 50,
  margin: const EdgeInsets.only(top: 24, bottom: 10, left: 24, right: 24),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [AppColors.grey3.withAlpha(90), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
);
