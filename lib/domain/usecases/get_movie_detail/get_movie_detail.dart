import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetMovieDetail
    implements UseCase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam params) async {
    var movieDetailResult = await _movieRepository.getMovieDetails(
      movieId: params.movie.id,
    );
    return switch (movieDetailResult) {
      Success(value: final movieDetail) => Result.success(movieDetail),
      Failure(:final message) => Result.failure(message),
    };
  }
}
