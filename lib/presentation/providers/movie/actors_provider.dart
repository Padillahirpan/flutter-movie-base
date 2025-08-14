import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/get_actors/get_actors.dart';
import 'package:movie_app/domain/usecases/get_actors/get_actors_param.dart';
import 'package:movie_app/presentation/providers/usercases/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  // Assuming there's a use case to fetch actors by movie ID
  GetActors getActors = ref.read(getActorsProvider);

  var actorsResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorsResult) {
    Success(value: final actors) => actors,
    Failure(message: _) => [],
  };
}
