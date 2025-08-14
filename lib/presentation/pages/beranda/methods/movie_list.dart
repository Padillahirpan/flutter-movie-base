import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/widgets/network_image_card.dart';

import '../../../../domain/entities/movie.dart';

List<Widget> movieList({
  required String title,
  required Function(Movie movie)? onTap,
  required AsyncValue<List<Movie>> movie,
}) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    SizedBox(
      height: 228,
      child: movie.when(
        data: (movies) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movies
                  .map(
                    (movieItem) => Padding(
                      padding: EdgeInsets.only(
                        left: movieItem == movies.first ? 24.0 : 12.0,
                        right: movieItem == movies.last ? 24.0 : 0,
                      ),
                      child: NetworkImageCard(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${movieItem.posterPath}',
                        onTap: () => onTap?.call(movieItem),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    ),
  ];
}
