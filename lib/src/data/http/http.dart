import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:the_movie_db/src/domain/either.dart';

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

    try {
      if (useApiKey) {
        queryParameters = {
          ...queryParameters,
          'api_key': _apiKey
        };
      }

      Uri url = Uri.parse(path.startsWith('http') ? path : '$_baseUrl$path');
      if (queryParameters.isNotEmpty) {
        url = url.replace(
          //lo que hace replace es hacer una copia de la variable url
          //y agregarle, en este caso, queryParameters
          queryParameters: queryParameters,
        );
      }

      headers = {
        'Content-Type':
            'application/json', //Todas las colicitudes contienen esto
        ...headers,
      };

      late final Response response;
      final bodyString = jsonEncode(body);

      //Parte de métodos
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
      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(onSucces(response.body));
      }
      return Either.left(
        //Condición de solicitud fallida
        HttpFailure(
          statusCode: statusCode,
        ),
      );
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(
          HttpFailure(
            exception: NetworkException(),
          ),
        );
      }
      return Either.left(HttpFailure(exception: e));
    }
  }
}

class HttpFailure {
  final int? statusCode; //Para recibir el statusCode de la conexión
  final Object? exception; //Para recibir errores de conexión

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
