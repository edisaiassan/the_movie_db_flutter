import 'package:the_movie_db/src/data/services/remote/trending_api.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';
import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingApi _trendingApi;

  TrendingRepositoryImpl(this._trendingApi);

  @override
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  ) {
    return _trendingApi.getMoviesAndSeries(timeWindow);
  }
}
