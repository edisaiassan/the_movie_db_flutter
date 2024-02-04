import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/failures/sign_in/sign_in_failure.dart';
import 'package:the_movie_db/src/domain/models/user/user.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
import 'package:the_movie_db/src/presentation/global/state_notifier.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/controller/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository authenticationRepository;

  SignInController(
    super.state, {
    required this.authenticationRepository,
  });

  void onUsernameChanged(String text) {
    onlyUpdate(
      state.copyWith(
        username: text.trim().toLowerCase(),
      ),
    );
  }

  void onPasswordChanged(String text) {
    onlyUpdate(
      state.copyWith(
        password: text.replaceAll(' ', '').toLowerCase(),
      ),
    );
  }

  Future<Either<SignInFailure, User>> submit() async {
    state = state.copyWith(fetching: true);
    final result = await authenticationRepository.signIn(
      state.username,
      state.password,
    );

    result.when(
      left: (_) => state = state.copyWith(fetching: false),
      right: (_) => null,
    );
    return result;
  }
}
