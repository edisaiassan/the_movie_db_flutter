import 'dart:convert';

import 'package:http/http.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._client);
  final Client _client;
  final _baseUrl = 'https://api.themoviedb.org/3';
  final _apiKey = '8d73e98a010d08d6e272fe2d16cca561';

  Future<String?> createRequestToken() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/authentication/token/new?api_key=$_apiKey'),
    );

    print('body😀: ${response.body}');
    print('statusCode: ${response.statusCode}');
    print('statusCode: ${response.body.runtimeType}');

    if(response.statusCode == 200) { //recuperamos el statusCode que nos devuelve TMDB
      final json = Map<String, dynamic>.from(jsonDecode(response.body));
      return json['request_token'];
      print('♉requestoken ${json['request_token']}');
      print('🔝json type ${json.runtimeType}');
    }
    return null;
  }
}
