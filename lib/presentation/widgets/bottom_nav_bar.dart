import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final void Function(int index) onTap;
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.black.withAlpha((0.9 * 255).toInt()).withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final isSelected = item.index == selectedIndex;
            return GestureDetector(
              onTap: () => {
                log('Tapped on ${item.label} at index ${item.index}'),
                onTap(item.index),
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withAlpha((0.1 * 255).toInt())
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
