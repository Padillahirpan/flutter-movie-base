import 'package:flutter/material.dart';
import 'package:movie_app/presentation/misc/methods.dart';

Widget transactionRow({
  required String title,
  required String value,
  required double width,
}) => Padding(
  padding: const EdgeInsets.only(
    left: 24.0,
    right: 24.0,
    top: 14.0,
    bottom: 14.0,
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 110,
        child: Text(title, style: TextStyle(color: Colors.grey)),
      ),
      horizontalSpace(20.0),
      SizedBox(width: width - 110 - 20, child: Text(value)),
    ],
  ),
);
