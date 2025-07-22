import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // factory Movie.fromJson(Map<String, dynamic> json) => Movie(
  //   id: json['id'],
  //   title: json['title'],
  //   posterPath: json['poster_path'] as String?,
  // );
}
