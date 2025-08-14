// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Actor _$ActorFromJson(Map<String, dynamic> json) => _Actor(
  name: json['name'] as String,
  profilePath: json['profile_path'] as String?,
  character: json['character'] as String,
);

Map<String, dynamic> _$ActorToJson(_Actor instance) => <String, dynamic>{
  'name': instance.name,
  'profile_path': instance.profilePath,
  'character': instance.character,
};
