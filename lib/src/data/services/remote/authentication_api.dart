import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/domain/either.dart';
import 'package:the_movie_db/src/domain/failures/sign_in_failure.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._http);

  final Http _http;

  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      switch (failure.statusCode!) {
        case 401:
          return Either.left(Unauthorized());
        case 404:
          return Either.left(NotFound());
        default:
          return Either.left(Unknown());
      }
    }
    if (failure.exception is NetworkException) {
      return Either.left(Network());
    }
    return Either.left(Unknown());
  }

  Future<Either<SignInFailure, String>> createRequestToken() async {
    final result = await _http.request('/authentication/token/new',
        onSucces: (responseBody) {
      final json = responseBody as Map;
      return json['request_token'] as String;
    });

    return result.when(
      left: _handleFailure,
      right: (requestToken) => Either.right(requestToken),
    );
  }

  Future<Either<SignInFailure, String>> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final result = await _http.request(
      '/authentication/token/validate_with_login',
      method: HttpMethod.post,
      body: {
        'username': username,
        'password': password,
        'request_token': requestToken,
      },
      onSucces: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
    );

    return result.when(
      left: _handleFailure,
      right: (newRequestToken) => Either.right(newRequestToken),
    );
  }

  Future<Either<SignInFailure, String>> createSession(
      String requestToken) async {
    final result = await _http.request(
      '/authentication/session/new', //<---Aquí falta el new
      method: HttpMethod.post,
      body: {
        'request_token': requestToken,
      },
      onSucces: (responseBody) {
        final json = responseBody as Map;
        return json['session_id'] as String;
      },
    );

    return result.when(
      left: _handleFailure,
      right: (sessionId) => Either.right(sessionId),
    );
  }
}
