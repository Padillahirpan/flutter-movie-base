import 'package:flutter/material.dart';

class SelectableCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onTap;

  const SelectableCard({
    super.key,
    required this.text,
    this.isSelected = false,
    this.isEnabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
