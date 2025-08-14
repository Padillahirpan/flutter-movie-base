import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/connectivity/connectivity_notifier.dart';
import 'package:movie_app/presentation/widgets/connectivity/internet_dialog.dart';

class ConnectivityWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  ConsumerState<ConnectivityWrapper> createState() =>
      _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends ConsumerState<ConnectivityWrapper> {
  bool? _previousConnectionState;
  bool _dialogShown = false;

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityNotifierProvider);

    // Show dialog when connection changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleConnectivityChange(isConnected);
    });

    return widget.child;
  }

  void _handleConnectivityChange(bool isConnected) {
    if (_previousConnectionState == null) {
      _previousConnectionState = isConnected;
      return;
    }

    // Only show dialog if state actually changed and dialog isn't already shown
    if (_previousConnectionState != isConnected && !_dialogShown) {
      _showConnectivityDialog(isConnected);
      _previousConnectionState = isConnected;
    }
  }

  void _showConnectivityDialog(bool isConnected) {
    if (!mounted) return;

    _dialogShown = true;

    showDialog(
      context: context,
      barrierDismissible: isConnected,
      builder: (context) => InternetDialog(
        isConnected: isConnected,
        onRetry: !isConnected
            ? () {
                Navigator.of(context).pop();
                // Force check connectivity again
                ref
                    .read(connectivityNotifierProvider.notifier)
                    .refreshConnection();
              }
            : null,
      ),
    ).then((_) {
      _dialogShown = false;
      if (isConnected) {
        // Auto-close success dialog after 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted && Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }
}
