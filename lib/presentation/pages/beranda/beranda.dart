import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/pages/beranda/methods/movie_list.dart';
import 'package:movie_app/presentation/pages/beranda/methods/search_bar.dart';
import 'package:movie_app/presentation/pages/beranda/methods/user_info.dart';
import 'package:movie_app/presentation/providers/movie/now_playing_provider.dart';
import 'package:movie_app/presentation/providers/movie/upcoming_provider.dart';

import 'methods/promotion_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff550080),
            Color(0xff001980),
            Colors.transparent,
            Colors.transparent,
          ],
          center: Alignment.topRight,
          radius: 2.0, // Increase this value to spread the gradient more
          stops: [
            0.1,
            0.3,
            0.7,
            1.0,
          ], // Optional: control color transition points
        ),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24.0),
              userInfo(ref),
              verticalSpace(24.0),
              searchBar(context),
              verticalSpace(24.0),
              ...movieList(
                title: 'Now Playing',
                onTap: (movie) {},
                movie: ref.watch(nowPlayingProvider),
              ),
              verticalSpace(24.0),
              ...promotionList(
                title: 'Promotions',
                onTap: (promotion) {},
                promotions: ['Promotion 1', 'Promotion 2', 'Promotion 3'],
              ),
              verticalSpace(24.0),
              ...movieList(
                title: 'Upcoming Movies',
                onTap: (movie) {},
                movie: ref.watch(upcomingProvider),
              ),
              verticalSpace(100.0),
            ],
          ),
        ],
      ),
    );
  }
}
