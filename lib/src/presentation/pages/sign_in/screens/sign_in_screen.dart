import 'package:flutter/material.dart';
import 'package:the_movie_db/main.dart';
import 'package:the_movie_db/src/domain/enum.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _username = '', _password = '';
  bool _fetching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignInScreen'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          physics: const BouncingScrollPhysics(),
          children: [
            TextFormField(
              enabled: !_fetching,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (text) {
                setState(() => _username = text.trim().toLowerCase());
              },
              validator: (text) {
                text = text?.trim().toLowerCase() ?? '';
                if (text.isEmpty) {
                  return 'Invalid username';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(width: 16.0),
            TextFormField(
              enabled: !_fetching,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (text) {
                setState(
                    () => _password = text.replaceAll(' ', '').toLowerCase());
              },
              validator: (text) {
                text = text?.replaceAll(' ', '').toLowerCase() ?? '';
                if (text.length < 4) {
                  return 'Invalid username';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 32.0),
            Builder(builder: (context) {
              return _fetching
                  ? const Center(child: CircularProgressIndicator())
                  : FilledButton(
                      onPressed: () {
                        final isValid = Form.of(context).validate();
                        if (isValid) {
                          _submit(context);
                        }
                      },
                      child: const Text('Sign in'),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    _fetching = true;
    setState(() {});
    final result = await Injector.of(context).authenticationRepository.signIn(
          _username,
          _password,
        );
    if (!mounted) {
      return;
    }
    result.when(
      (failure) {
        setState(() {
          _fetching = false;
        });
        final message = {
          SignInFailure.notFound: 'Not Found',
          SignInFailure.unauthorized: 'Invalid password',
          SignInFailure.unknown: 'error',
        }[failure];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message!)));
      },
      (user) {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
