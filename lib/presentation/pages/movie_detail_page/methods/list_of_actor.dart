import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/movie/actors_provider.dart';

import '../../../../domain/entities/actor.dart';
import '../../../../domain/entities/movie.dart';
import 'cast_crew_card.dart';

class ListOfActors extends ConsumerWidget {
  final Movie movie;
  const ListOfActors({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var actors = ref.watch(actorsProvider(movieId: movie.id));

    return actors.when(
      data: (data) => _buildActorList(context, data),
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildActorList(BuildContext context, List<Actor> actors) {
    if (actors.isEmpty) {
      return Center(child: Text('No actors found.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          actors.length > 1 ? 'Cast & Crew' : 'Cast',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: Colors.white),
        ),
        verticalSpace(12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: actors
                .map(
                  (actor) => Padding(
                    padding: EdgeInsets.only(
                      left: actor == actors.first ? 0.0 : 8.0,
                      right: actor == actors.last ? 0.0 : 8.0,
                    ),
                    child: CastCrewCard(actor: actor),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
