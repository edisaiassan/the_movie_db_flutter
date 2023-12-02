class SignInState {
  final String username;
  final String password;
  final bool fetching;

  SignInState({
    required this.username,
    required this.password,
    required this.fetching,
  });

  SignInState copyWith({
    String? username,
    String? password,
    bool? fetching,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      fetching: fetching ?? this.fetching,
    );
  }
}
