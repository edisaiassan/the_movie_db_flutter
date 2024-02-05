import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/data/services/utils/handle_failure.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';
import 'package:the_movie_db/src/domain/models/performer/performer.dart';

class TrendingApi {
  final Http _http;

  TrendingApi(this._http);

  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
      TimeWindow timeWindow) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSucces: (json) {
        final list = List<Map<String, dynamic>>.from(json['results']);
        return getMediaList(list);
      },
    );
    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }

  Future<Either<HttpRequestFailure, List<Performer>>> getPerformes(
      TimeWindow timeWindow) async {
    final result = await _http.request(
      '/trending/person/${timeWindow.name}',
      onSucces: (json) {
        final list = List<Map<String, dynamic>>.from(json['results']);
        return list.where((e) => e['known_for_department'] == 'Acting' && e['profile_path'] != null)
        .map((e) => Performer.fromJson(e)).toList();
      },
    );
    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
