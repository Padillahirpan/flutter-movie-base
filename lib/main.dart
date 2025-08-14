import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/widgets/connectivity/connectivity_wrapper.dart';
import 'package:movie_app/theme.dart';

import 'presentation/providers/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return ConnectivityWrapper(
      child: MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        routeInformationParser: ref
            .watch(routerProvider)
            .routeInformationParser,
        routeInformationProvider: ref
            .watch(routerProvider)
            .routeInformationProvider,
        routerDelegate: ref.watch(routerProvider).routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
