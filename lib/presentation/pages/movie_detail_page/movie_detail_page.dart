import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/presentation/misc/constants.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import '../../providers/movie/movie_detail_provider.dart';
import '../../widgets/adaptive_back_button.dart';
import 'methods/book_button.dart';
import 'methods/list_of_actor.dart';
import 'methods/tag_category.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    var movieDetail = ref.watch(movieDetailProvider(movie: widget.movie));
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 550,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  movieDetail.when(
                    data: (data) => data != null
                        ? _HeaderImage(movie: data)
                        : Container(
                            color: Colors.grey[300],
                            width: MediaQuery.of(context).size.width,
                          ),
                    error: (error, stack) => Container(
                      color: Colors.grey[300],
                      width: MediaQuery.of(context).size.width,
                    ),
                    loading: () => LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.grey[300],
                      minHeight: 550,
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: _Gradient(),
                  ),
                  movieDetail.when(
                    data: (data) => data != null
                        ? Positioned(
                            bottom: 75,
                            left: 0,
                            right: 0,
                            child: _Headline(movieDetail: data),
                          )
                        : const SizedBox.shrink(),
                    error: (error, stack) => const SizedBox.shrink(),
                    loading: () => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 450,
                left: 24.0,
                right: 24.0,
              ),
              child: ListView(
                children: [
                  Text(
                    'Synopsis',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  verticalSpace(12.0),
                  Text(movieDetail.value?.overview ?? 'No overview available.'),
                  verticalSpace(40.0),
                  ListOfActors(movie: widget.movie),
                  verticalSpace(70.0),
                ],
              ),
            ),
          ),

          Positioned(
            top: 55,
            left: 24,
            child: AdaptiveBackButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookButton(
              onPressed: () {
                // Handle booking action
                print('Book button pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({required this.movie});

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        ...movie.genres.map(
          (tag) => TagCategory(
            tag: tag.name,
            fontSize: 16,
            height: 32,
            chipColor: Colors.grey.withAlpha(30),
            onChipColor: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({required this.movie});

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      fadeInDuration: Duration(milliseconds: 200),
      fit: BoxFit.fitWidth,
      width: MediaQuery.of(context).size.width,
      placeholder: (context, url) {
        return Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 0.7),
          stops: const [0.4, 1.0],
          colors: [
            Colors.transparent,
            onSurfaceColor.withAlpha((0.99 * 255).toInt()),
          ],
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.movieDetail});

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieDetail.title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              movieDetail.voteAverage != null
                  ? 'Rating: ${movieDetail.voteAverage!.toStringAsFixed(1)}'
                  : 'Rating: N/A',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.pink[400],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            verticalSpace(12.0),
            _Tags(movie: movieDetail),
          ],
        ),
      ),
    );
  }
}
