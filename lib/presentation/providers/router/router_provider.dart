import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/presentation/pages/login_page/login_page.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';
import 'package:movie_app/presentation/pages/movie_detail_page/movie_detail_page.dart';
import 'package:movie_app/presentation/pages/profile/profile_page.dart';
import 'package:movie_app/presentation/pages/register_page/register_page.dart';
import 'package:movie_app/presentation/pages/welcome_page/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/movie.dart';

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
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/moviedetail',
      name: 'moviedetail',
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDetailPage(movie: movie);
      },
      // builder: (context, state) {
      //   final id = state.params['id'];
      //   return MovieDetailPage(id: id);
      // },
    ),
  ],
  initialLocation: '/splashscreen',
  debugLogDiagnostics: false,
);
