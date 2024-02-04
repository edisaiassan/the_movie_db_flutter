// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      id: json['id'] as int,
      title: readTitleValue(json, 'title') as String,
      overview: json['overview'] as String,
      originalTitle: readOriginalTitleValue(json, 'original_title') as String,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdrop_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      type: $enumDecode(_$MediaTypeEnumMap, json['media_type']),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'media_type': _$MediaTypeEnumMap[instance.type]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'movie',
  MediaType.tv: 'tv',
};
