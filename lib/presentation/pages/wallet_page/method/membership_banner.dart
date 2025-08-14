import 'dart:math';

import 'package:flutter/material.dart';

Widget membershipBanner() => Align(
  alignment: Alignment.centerRight,
  child: Transform.rotate(
    angle: pi / 2,
    origin: const Offset(17.5, 17.5),
    child: Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellowAccent, Colors.yellow.withOpacity(0.8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
          'Priority',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ),
);
