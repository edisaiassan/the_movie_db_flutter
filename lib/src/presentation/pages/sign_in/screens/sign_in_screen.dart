import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/controller/sign_in_controller.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/controller/sign_in_state.dart';
import 'package:the_movie_db/src/presentation/pages/widgets/submit_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => SignInController(
            const SignInState(),
          ),
          child: Form(
            child: Builder(builder: (context) {
              final controller =
                  Provider.of<SignInController>(context, listen: true);
              return AbsorbPointer(
                absorbing: controller.state.fetching,
                child: ListView(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(64.0),
                  children: [
                    const SubmitButton(),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      onChanged: (text) {
                        controller.onPasswordChanged(text);
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
                        controller.onUsernameChanged(text);
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
