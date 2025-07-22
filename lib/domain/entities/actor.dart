import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({
    required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  // factory Actor.fromJson(Map<String, dynamic> json) => Actor(
  //   name: json['name'] as String,
  //   profilePath: json['profile_path'] as String?,
  // );
}
