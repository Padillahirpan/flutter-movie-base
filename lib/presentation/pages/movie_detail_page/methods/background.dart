import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> background() => [
  Container(
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [
          Color(0xff550080),
          Color(0xff001980),
          Colors.transparent,
          Colors.transparent,
        ],
        center: Alignment.topRight,
        radius: 2.0, // Increase this value to spread the gradient more
        stops: [
          0.1,
          0.3,
          0.7,
          1.0,
        ], // Optional: control color transition points
      ),
    ),
  ),
];
