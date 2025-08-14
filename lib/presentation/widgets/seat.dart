import 'package:flutter/material.dart';

enum SeatStatus { available, reserved, selected }

class Seat extends StatelessWidget {
  final int? number;
  final SeatStatus status;
  final double size;
  final VoidCallback? onTap;

  const Seat({
    super.key,
    this.number,
    required this.status,
    this.size = 40.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _getSeatColor(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            number?.toString() ?? '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Color _getSeatColor() {
    switch (status) {
      case SeatStatus.available:
        return Colors.green;
      case SeatStatus.reserved:
        return Colors.red;
      case SeatStatus.selected:
        return Colors.blue;
    }
  }
}
