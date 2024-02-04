import 'package:the_movie_db/src/domain/models/user/user.dart';

abstract class AccountRepository {
  Future<User?> getUserData();
}
