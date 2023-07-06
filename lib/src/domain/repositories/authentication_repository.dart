import 'package:the_movie_db/src/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<bool>? get isSignendIn;
  Future<User> getUserData();
}