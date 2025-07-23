import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Add 3-second delay before checking user state
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _checkUserState();
      }
    });
  }

  void _checkUserState() {
    final userDataAsync = ref.read(userDataProvider);
    handleUserDataState(userDataAsync, ref, context);
  }

  void handleUserDataState(
    AsyncValue next,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (next is AsyncData) {
      if (next.value != null) {
        ref.read(routerProvider).goNamed('main');
      } else {
        ref.read(routerProvider).goNamed('login');
      }
    } else if (next is AsyncError) {
      context.showSnackBar('${next.error}');
      ref.read(routerProvider).goNamed('login');
    } else {
      ref.read(routerProvider).goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with enhanced styling
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.3),
                    theme.colorScheme.secondary.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Image.asset(
                'assets/videoboxd-logo.png',
                width: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.movie_outlined,
                    size: 120,
                    color: theme.colorScheme.primary,
                  );
                },
              ),
            ),

            const SizedBox(height: 48),

            // Modern loading indicator
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Loading text
            Text(
              'Loading...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
