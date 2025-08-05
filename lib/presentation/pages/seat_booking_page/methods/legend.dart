import 'package:flutter/material.dart';
import 'package:movie_app/presentation/misc/methods.dart';

Widget legend() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _legendItem(Colors.green, 'Available'),
    _legendItem(Colors.red, 'Reserved'),
    _legendItem(Colors.blue, 'Selected'),
  ],
);

Widget _legendItem(Color color, String label) => Row(
  children: [
    Container(width: 16, height: 16, color: color),
    horizontalSpace(4),
    Text(label),
    horizontalSpace(12),
  ],
);
