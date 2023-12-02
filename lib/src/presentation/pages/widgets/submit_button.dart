import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/enum.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/controller/sign_in_controller.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInController>(context);
    return controller.state.fetching
        ? const Center(child: CircularProgressIndicator())
        : FilledButton.icon(
            onPressed: () {
              final isValid = Form.of(context).validate();
              if (isValid) {
                _submit(context);
              }
            },
            icon: const Icon(Icons.login),
            label: const Text('Sign in'),
          );
  }

  Future<void> _submit(BuildContext context) async {
    final SignInController controller = context.read();
    controller.onFetchingChanged(true);

    final result = await context.read<AuthenticationRepository>().signIn(
          controller.state.username,
          controller.state.password,
        );

    if (!controller.mounted) {
      return;
    }

    result.when(
      (failure) {
        controller.onFetchingChanged(false);
        final message = {
          SignInFailure.notFound: 'Not Found',
          SignInFailure.unauthorized: 'Invalid Password',
          SignInFailure.unknown: 'Error',
          SignInFailure.network: 'Red',
        }[failure];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message!)),
        );
      },
      (user) {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
