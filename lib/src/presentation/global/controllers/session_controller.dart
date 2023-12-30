import 'package:the_movie_db/src/domain/models/user.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
import 'package:the_movie_db/src/presentation/global/state_notifier.dart';

class SessionController extends StateNotifier<User?> {
  final AuthenticationRepository authenticationRepository;
  SessionController({
    required this.authenticationRepository,
  }) : super(null);

  void setUser(User user) {
    state = user;
  }

  Future<void> signOut() async {
    await authenticationRepository.signOut();
    onlyUpdate(null);
  }
}
