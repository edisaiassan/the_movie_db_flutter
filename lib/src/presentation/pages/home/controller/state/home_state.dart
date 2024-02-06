import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {

  factory HomeState({
    required bool loading,
    List<Media>? moviesAndSeries,
    @Default(TimeWindow.day) TimeWindow? timeWindow,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}