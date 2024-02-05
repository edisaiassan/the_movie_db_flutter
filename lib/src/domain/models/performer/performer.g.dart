// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformerImpl _$$PerformerImplFromJson(Map<String, dynamic> json) =>
    _$PerformerImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      originalName: json['original_name'] as String,
      profilePath: json['profile_path'] as String,
      knownFor: getMediaList(json['known_for'] as List),
    );

Map<String, dynamic> _$$PerformerImplToJson(_$PerformerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor,
    };
