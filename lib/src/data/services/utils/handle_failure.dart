import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';

Either<HttpRequestFailure, R> handleHttpFailure<R>(HttpFailure httpFailure) {
    print('🎈🎈 ${httpFailure.exception}');

  final failure = () {
    final statusCode = httpFailure.statusCode;
    switch (statusCode) {
      case 404:
        return HttpRequestFailure.notFound();
      case 401:
        return HttpRequestFailure.unauthorized();
    }
    if (httpFailure.exception is NetworkException) {
      return HttpRequestFailure.network();
    }
    return HttpRequestFailure.unknown();
  }();

  return Either.left(failure);
}
