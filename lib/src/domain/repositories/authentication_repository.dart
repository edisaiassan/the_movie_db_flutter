import 'package:the_movie_db/src/domain/either.dart';
import 'package:the_movie_db/src/domain/enum.dart';
import 'package:the_movie_db/src/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
  Future<void> signOut();
  Future<Either<SignInFailure, User>> signIn(String username, String password);
}