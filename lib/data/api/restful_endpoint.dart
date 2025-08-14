import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/data/api/endpoint.dart';

class Restfulendpoints {
  Restfulendpoints._();

  static String baseUrl = dotenv.env['BASE_URL'] ?? "";

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
