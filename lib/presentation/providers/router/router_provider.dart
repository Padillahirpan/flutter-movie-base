import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/pages/login_page/login_page.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';
import 'package:movie_app/presentation/pages/register_page/register_page.dart';
import 'package:movie_app/presentation/pages/welcome_page/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/splashscreen',
      name: 'splashscreen',
      builder: (context, state) => const WelcomePage(),
    ),
  ],
  initialLocation: '/splashscreen',
  debugLogDiagnostics: false,
);
