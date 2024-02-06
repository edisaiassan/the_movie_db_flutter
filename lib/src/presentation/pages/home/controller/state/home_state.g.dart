// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      loading: json['loading'] as bool,
      moviesAndSeries: (json['moviesAndSeries'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeWindow:
          $enumDecodeNullable(_$TimeWindowEnumMap, json['timeWindow']) ??
              TimeWindow.day,
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'moviesAndSeries': instance.moviesAndSeries,
      'timeWindow': _$TimeWindowEnumMap[instance.timeWindow],
    };

const _$TimeWindowEnumMap = {
  TimeWindow.day: 'day',
  TimeWindow.week: 'week',
};
