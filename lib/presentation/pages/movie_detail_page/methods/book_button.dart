import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

import '../../../../theme.dart';
import '../../../widgets/adaptive/widgets.dart' as adaptive;

class BookButton extends StatelessWidget {
  final VoidCallback onPressed;
  const BookButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final button = adaptive.Button(
      onPressed: onPressed,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Text(
        'Book',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
    return ClipRect(
      child: Platform.isIOS
          ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Theme.of(
                  context,
                ).scaffoldBackgroundColor.withValues(alpha: 0.6),
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 48,
                  left: 16,
                  right: 16,
                ),
                child: SizedBox(width: double.infinity, child: button),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.9),
                    Colors.black87.withValues(alpha: 0.9),
                  ],
                ).withOpacity(0.9),
              ),
              // color: Colors.black.withValues(alpha: 0.9),
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 24,
                left: 16,
                right: 16,
              ),
              child: SizedBox(width: double.infinity, child: button),
            ),
    );
  }
}
