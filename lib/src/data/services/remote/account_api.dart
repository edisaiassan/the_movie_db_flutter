import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/domain/models/user/user.dart';

class AccountAPI {
  final Http _http;

  AccountAPI(this._http);

  Future<User?> getAccount(String sessionId) async {
    final result = await _http.request(
      '/account',
      queryParameters: {
        'session_id': sessionId,
      },
      onSucces: (json) {
        return User.fromJson(json);
      },
    );
    return result.when(
     left: (_) => null,
      right: (user) => user,
    );
  }
}
