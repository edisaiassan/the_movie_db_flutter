import 'package:the_movie_db/src/data/services/local/session_service.dart';
import 'package:the_movie_db/src/data/services/remote/account_api.dart';
import 'package:the_movie_db/src/domain/models/user.dart';
import 'package:the_movie_db/src/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountAPI accountAPI;
  final SessionService sessionService;

  AccountRepositoryImpl(
      {required this.sessionService, required this.accountAPI});
  @override
  Future<User?> getUserData() async {
   return accountAPI.getAccount(await sessionService.sessionId ?? '');
  }
}
