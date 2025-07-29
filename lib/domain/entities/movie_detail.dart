import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/domain/entities/genre.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
abstract class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
    required String overview,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required int runtime,
    @JsonKey(name: 'vote_average') double? voteAverage,
    required List<Genre> genres,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}
