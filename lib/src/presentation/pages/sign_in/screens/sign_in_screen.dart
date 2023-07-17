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
  bool _fetching = false; //Para podre bloquear el formulario y mostrar carga

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          child: AbsorbPointer(
            absorbing: _fetching,
            child: ListView(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(64.0),
              children: [
                Builder(builder: (context) {
                  if (_fetching) {
                    return const Center(
                        child: CircularProgressIndicator()); //Lógica de carga
                  }
                  return FilledButton.icon(
                    onPressed: () {
                      final isValid = Form.of(context).validate();
                      if (isValid) {
                        _submit(context);
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: const Text('Sign in'),
                  );
                }),
                const SizedBox(height: 16.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  onChanged: (text) {
                    setState(() {
                      _password = text.replaceAll(' ', '').toLowerCase();
                    });
                  },
                  validator: (text) {
                    text = text?.replaceAll(' ', '').toLowerCase() ?? '';
                    if (text.length < 5) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(labelText: 'Nombre de usuario'),
                  onChanged: (text) {
                    setState(() {
                      _username = text.trim().toLowerCase();
                    });
                  },
                  validator: (text) {
                    text = text?.trim().toLowerCase() ?? '';
                    if (text.isEmpty) {
                      return 'Invalid username';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    setState(() {
      _fetching = true;
    });
    //Nuestro Injector escucha
    final result = await Injector.of(context).authenticationRepository.signIn(
          _username,
          _password,
        );

    if (!mounted) {
      //Comporbando si la vista está renderizada, si no lo está nos detenemos
      return; //hasta que se renderize y podamos comporbar si el usuario se puede logear
    }
    //Función del Either
    result.when(
      (failure) {
        _fetching = false;
        setState(() {});
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
      //Si es correcto, pasamos a Navegar
      (user) {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
