import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/pages/login_page/login_page.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';
import 'package:movie_app/presentation/pages/movie_detail_page/movie_detail_page.dart';
import 'package:movie_app/presentation/pages/profile/profile_page.dart';
import 'package:movie_app/presentation/pages/register_page/register_page.dart';
import 'package:movie_app/presentation/pages/time_booking_page/time_booking_page.dart';
import 'package:movie_app/presentation/pages/welcome_page/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/transaction.dart';
import '../../pages/booking_confirmation/booking_confirmation.dart';
import '../../pages/seat_booking_page/seat_booking_page.dart';
import '../../pages/theme/theme_setting.dart';
import '../../pages/wallet_page/wallet_page.dart';

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
    ),
    GoRoute(
      path: '/time-booking',
      name: 'time-booking',
      builder: (context, state) {
        // final movie = state.extra as MovieDetail;
        return TimeBookingPage(state.extra as MovieDetail);
      },
    ),
    GoRoute(
      path: '/seat-booking',
      name: 'seat-booking',
      builder: (context, state) {
        return SeatBookingPage(
          transactionDetail: state.extra as (MovieDetail, Transaction),
        );
      },
    ),
    GoRoute(
      path: '/booking-confirmation',
      name: 'booking-confirmation',
      builder: (context, state) {
        return BookingConfirmationPage(
          transactionDetail: state.extra as (MovieDetail, Transaction),
        );
      },
    ),
    GoRoute(
      path: '/wallet',
      name: 'wallet',
      builder: (context, state) {
        return WalletPage();
      },
    ),
    GoRoute(
      path: '/theme-setting',
      name: 'theme-setting',
      builder: (context, state) {
        return ThemeSettingPage();
      },
    ),
  ],
  initialLocation: '/splashscreen',
  debugLogDiagnostics: false,
);
