import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
import 'package:the_movie_db/src/presentation/global/controllers/session_controller.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SessionController sessionController = context.watch();
    final state = sessionController.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(state!.username.toString()),
            FilledButton(
              onPressed: () {
                context.read<AuthenticationRepository>().signOut();
                sessionController.signOut();
                Navigator.pushReplacementNamed(context, Routes.splash);
              },
              child: const Text('SignOut'),
            ),
          ],
        ),
      ),
    );
  }
}
