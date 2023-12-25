import 'package:the_movie_db/src/domain/models/user.dart';

abstract class AccountRepository {
  Future<User?> getUserData();
}
