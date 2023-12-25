import 'package:the_movie_db/src/data/services/local/session_service.dart';
import 'package:the_movie_db/src/data/services/remote/account_api.dart';
import 'package:the_movie_db/src/data/services/remote/authentication_api.dart';
import 'package:the_movie_db/src/domain/either.dart';
import 'package:the_movie_db/src/domain/enum.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';


class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _authenticationAPI;
  final AccountAPI _accountAPI;
  final SessionService _sessionService;

  AuthenticationRepositoryImpl(
    this._authenticationAPI,
    this._sessionService,
    this._accountAPI,
  );

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _sessionService.sessionId;
    return sessionId != null;
  }

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    final requestTokenResult = await _authenticationAPI.createRequestToken();

    return requestTokenResult.when(
      (failure) => Either.left(failure),
      (requestToken) async {
        final loginResult = await _authenticationAPI.createSessionWithLogin(
          username: username,
          password: password,
          requestToken: requestToken,
        );

        return loginResult.when(
          (failure) async => Either.left(failure),
          (newRequestToken) async {
            final sessionResult =
                await _authenticationAPI.createSession(newRequestToken);

            return sessionResult.when(
              (failure) async => Either.left(failure),
              (sessionId) async {
                await _sessionService.saveSessionid(sessionId);
               final user = await _accountAPI.getAccount(sessionId);

               if(user == null) {
                return Either.left(SignInFailure.unknown);
               }

                return Either.right(user);
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> signOut() {
    return _sessionService.signOut();
  }
}
