import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_movie_db/src/domain/either.dart';
import 'package:the_movie_db/src/domain/enum.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';

const _key = 'sessionId';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;

  AuthenticationRepositoryImpl(this._secureStorage);

  @override
  Future<User?> getUserData() {
    return Future.value(null);
  }

  @override
  Future<bool> get isSignedIn async {
    //Utilizamos la instancia de FlutterSecureStorage par acceder a
    //nuestro keyStore, keyChange, localStorage (web)
    final sessionId = await _secureStorage.read(key: _key);
    //Cuando guardemos la sesion_id de forma segura,
    //debemos guardarlo en un 'key' que es un String que desees
    return sessionId != null;
  }

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    if(username != 'test') {
      return Either.left(SignInFailure.notFound);
    }
    if (password != '123456'){
      return Either.left(SignInFailure.unauthorized);
    } 
    return Either.right(User());
  }
}
