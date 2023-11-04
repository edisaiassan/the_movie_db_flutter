import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:the_movie_db/src/domain/either.dart';
import 'dart:developer';

class Http {
  final Client _client;
  final String _baseUrl;
  final String _apiKey;

  Http({
    required Client client,
    required String baseUrl,
    required String apiKey,
  })  : _client = client,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  Future<Either<HttpFailure, R>> request<R>(
    String path, {
    required Function(String responseBody) onSucces,
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool useApiKey = true,
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;

    try {
      if (useApiKey) {
        queryParameters = {...queryParameters, 'api_key': _apiKey};
      }

      Uri url = Uri.parse(path.startsWith('http') ? path : '$_baseUrl$path');
      if (queryParameters.isNotEmpty) {
        url = url.replace(
          queryParameters: queryParameters,
        );
      }

      headers = {
        'Content-Type': 'application/json',
        ...headers,
      };

      late final Response response;
      final bodyString = jsonEncode(body);

      logs = {
        'url': url.toString(),
        'method': logs['method'] = method.name,
        'body': logs['body'] = body,
      };

      switch (method) {
        case HttpMethod.get:
          response = await _client.get(url);
          break;
        case HttpMethod.post:
          response = await _client.post(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.patch:
          response = await _client.patch(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.delete:
          response = await _client.delete(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.put:
          response = await _client.put(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
      }

      final statusCode = response.statusCode;

      logs = {
        ...logs,
        'start_time': DateTime.now().toString(),
        'status_code': statusCode,
        'response_body': response.body,
      };
      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(onSucces(response.body));
      }
      return Either.left(
        HttpFailure(
          statusCode: statusCode,
        ),
      );
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'exception': e.runtimeType,
      };
      if (e is SocketException || e is ClientException) {
        logs = {
          ...logs,
          'exception': 'NetworkException',
        };
        return Either.left(
          HttpFailure(
            exception: NetworkException(),
          ),
        );
      }

      return Either.left(
        HttpFailure(
          exception: e,
        ),
      );
    } finally {
      logs = {...logs, 'end_time': DateTime.now().toString()};
      if (kDebugMode) {
        log('''
😊
------------------------
${const JsonEncoder.withIndent(' ').convert(logs)}
--------------------
😊
''',
stackTrace: stackTrace,
);
      }
    }
  }
}

class HttpFailure {
  final int? statusCode;
  final Object? exception;

  HttpFailure({this.statusCode, this.exception});
}

class NetworkException {}

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}
