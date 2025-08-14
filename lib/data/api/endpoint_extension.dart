import 'package:dio/dio.dart';
import 'package:movie_app/data/api/endpoint.dart';

extension ExpointX on Endpoint {
  RequestOptions toRequestOptions() {
    return RequestOptions(method: method, baseUrl: url, data: body);
  }
}
