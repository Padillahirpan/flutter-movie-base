import 'package:flutter/material.dart';

class InternetDialog extends StatelessWidget {
  final bool isConnected;
  final VoidCallback? onRetry;

  const InternetDialog({super.key, required this.isConnected, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(
            isConnected ? Icons.wifi : Icons.wifi_off,
            color: isConnected ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            isConnected ? 'Connected!' : 'No Internet',
            style: TextStyle(
              color: isConnected ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        isConnected
            ? 'Internet connection has been restored.'
            : 'Please check your internet connection and try again.',
      ),
      actions: [
        if (!isConnected && onRetry != null)
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(isConnected ? 'OK' : 'Close'),
        ),
      ],
    );
  }
}
