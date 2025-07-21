import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
abstract class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    String? posterPath,
    required String overview,
    String? backdropPath,
    required int runtime,
    double? voteAverage,
    required List<String> genres,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
    id: json['id'],
    title: json['title'],
    posterPath: json['poster_path'] as String?,
    overview: json['overview'],
    backdropPath: json['backdrop_path'] as String?,
    runtime: json['runtime'],
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    genres: List<String>.from(json['genres'].map((e) => e['name'])),
  );
}
