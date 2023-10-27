import 'dart:convert';
import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/domain/either.dart';
import 'package:the_movie_db/src/domain/enum.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._http);

  final Http _http;

  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      switch (failure.statusCode!) {
        case 401:
          return Either.left(SignInFailure.unauthorized);
        case 404:
          return Either.left(SignInFailure.notFound);
        default:
          return Either.left(SignInFailure.unknown);
      }
    }
    if (failure.exception is NetworkException) {
      return Either.left(SignInFailure.network);
    }
    return Either.left(SignInFailure.unknown);
  }

  Future<Either<SignInFailure, String>> createRequestToken() async {
    final result = await _http.request('/authentication/token/new',
        onSucces: (responseBody) {
      final json = Map<String, dynamic>.from(
        jsonDecode(responseBody),
      );
      return json['request_token'] as String;
    });

    return result.when(
      _handleFailure,
      (requestToken) => Either.right(requestToken),
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
        final json = Map<String, dynamic>.from(
          jsonDecode(responseBody),
        );

        final newRequestToken = json['request_token'] as String;
        return Either.right(newRequestToken);
      },
    );

    return result.when(
      _handleFailure,
      (newRequestToken) => Either.right(newRequestToken),
    );
  }

  Future<Either<SignInFailure, String>> createSession(
      String requestToken) async {
    final result = await _http.request('/authentication/session/',
        method: HttpMethod.post,
        body: {'request_token': requestToken}, onSucces: (responseBody) {
      final json = Map<String, dynamic>.from(jsonDecode(responseBody));
      final sessionId = json['session_id'] as String;
      return Either.right(sessionId);
    });

    return result.when(
      _handleFailure,
      (newRequestToken) => Either.left(newRequestToken),
    );
  }
}
