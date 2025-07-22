import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/get_movie_list/get_movie_list_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var movieListResult = switch (params.category) {
      MovieListCategories.popular => await _movieRepository.getPopularMovies(),
      MovieListCategories.topRated =>
        await _movieRepository.getTopRatedMovies(),
      MovieListCategories.upcoming =>
        await _movieRepository.getUpcomingMovies(),
      MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlayingMovies(),
    };

    return switch (movieListResult) {
      Success(value: final movies) => Result.success(movies),
      Failure(:final message) => Result.failure(message),
    };
  }
}
