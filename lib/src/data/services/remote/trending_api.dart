import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/data/services/utils/handle_failure.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';

class TrendingApi {
  final Http _http;

  TrendingApi(this._http);

  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
      TimeWindow timeWindow) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSucces: (json) {
        final list = List<Map<String, dynamic>>.from(json['results']);
        print('🧨${list}');
        return list
            .where(
              (e) => e['media_type'] != 'person',
            )
            .map(
              (e) => Media.fromJson(e),
            )
            .toList();
      },
    );
    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
