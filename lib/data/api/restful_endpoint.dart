import 'package:movie_app/data/api/endpoint.dart';

class Restfulendpoints {
  const Restfulendpoints._();

  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String language = 'language=en-US';

  static Endpoint actors({required int movieId}) {
    return Endpoint.get(url: '$baseUrl/$movieId/credits?$language');
  }

  static Endpoint movieDetail({required int movieId}) {
    return Endpoint.get(url: '$baseUrl/$movieId?$language');
  }

  static Endpoint movieByCategory({
    required String category,
    required int page,
  }) {
    return Endpoint.get(url: '$baseUrl/$category?$language');
  }
}
