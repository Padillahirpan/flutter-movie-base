import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/entities/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlayingMovies({int page = 1});

  Future<Result<List<Movie>>> getPopularMovies({int page = 1});

  Future<Result<List<Movie>>> getTopRatedMovies({int page = 1});

  Future<Result<List<Movie>>> getUpcomingMovies({int page = 1});

  Future<Result<MovieDetail>> getMovieDetails({required int movieId});

  Future<Result<List<Actor>>> getActors({required int movieId});

  Future<Result<List<Movie>>> searchMovies({
    required String query,
    int page = 1,
  });
}
