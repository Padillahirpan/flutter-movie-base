// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => _MovieDetail(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  posterPath: json['poster_path'] as String?,
  overview: json['overview'] as String,
  backdropPath: json['backdrop_path'] as String?,
  runtime: (json['runtime'] as num).toInt(),
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$MovieDetailToJson(_MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'genres': instance.genres,
    };
