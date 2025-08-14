import 'dart:developer';

import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/get_actors/get_actors_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorsResult = await _movieRepository.getActors(
      movieId: params.movieId,
    );

    log(
      'GetActors called with movieId: ${params.movieId} and result: $actorsResult',
    );

    return switch (actorsResult) {
      Success(value: final actors) => Result.success(actors),
      Failure(:final message) => Result.failure(message),
    };
  }
}
