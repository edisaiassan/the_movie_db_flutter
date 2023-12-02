import 'package:the_movie_db/src/presentation/global/state_notifier.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/controller/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(super.state);

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

  void onFetchingChanged(bool value) {
    state = state.copyWith(
      fetching: value,
    );
  }
}