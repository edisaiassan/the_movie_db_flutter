import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/failures/sign_in/sign_in_failure.dart';
import 'package:the_movie_db/src/domain/models/user/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<void> signOut();
  Future<Either<SignInFailure, User>> signIn(String username, String password);
}