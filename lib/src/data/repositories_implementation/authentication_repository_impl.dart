import 'package:the_movie_db/src/domain/models/user.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<User?> getUserData() {
    return Future.value(User());
  }

  @override
  Future<bool> get isSignendIn {
    return Future.value(true);
  }
}
