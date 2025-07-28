import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;

  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 24, height: 24, child: Icon(icon)),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}
