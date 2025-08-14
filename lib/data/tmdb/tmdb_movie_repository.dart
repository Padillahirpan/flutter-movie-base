import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/data/api/restful_endpoint.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_detail.dart';
import 'package:movie_app/domain/entities/result.dart';

import '../api/endpoint.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken = dotenv.env['TMDB_ACCESS_TOKEN']!;

  late final Options _options = Options(
    headers: {
      'Authorization': 'Bearer $_accessToken',
      'Content-Type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
    },
  );

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int movieId}) async {
    try {
      final Endpoint endpoint = Restfulendpoints.actors(movieId: movieId);
      final response = await _dio!.get(endpoint.url, options: _options);

      final result = List<Map<String, dynamic>>.from(
        response.data['cast'],
      ).map((json) => Actor.fromJson(json)).toList();

      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<MovieDetail>> getMovieDetails({required int movieId}) async {
    try {
      final Endpoint endpoint = Restfulendpoints.movieDetail(movieId: movieId);
      final response = await _dio!.get(endpoint.url, options: _options);

      return Result.success(MovieDetail.fromJson(response.data));
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({int page = 1}) async {
    return _getMovies(_MovieCategory.nowPlaying.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getPopularMovies({int page = 1}) async {
    return _getMovies(_MovieCategory.popular.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({int page = 1}) async {
    return _getMovies(_MovieCategory.topRated.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({int page = 1}) async {
    return _getMovies(_MovieCategory.upcoming.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> searchMovies({
    required String query,
    int page = 1,
  }) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

  Future<Result<List<Movie>>> _getMovies(
    String category, {
    int page = 1,
  }) async {
    try {
      final Endpoint endpoint = Restfulendpoints.movieByCategory(
        category: category,
        page: page,
      );
      final response = await _dio!.get(endpoint.url, options: _options);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];

        final movies = data.map((json) => Movie.fromJson(json)).toList();
        return Result.success(movies);
      } else {
        return Result.failure("Failed to fetch movies: ${response.statusCode}");
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming'),
  topRated('top_rated'),
  popular('popular');

  final String _instring;

  const _MovieCategory(String instring) : _instring = instring;

  @override
  String toString() => _instring;
}
