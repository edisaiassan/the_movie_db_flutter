import 'package:flutter/material.dart';
import 'package:the_movie_db/main.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Injector.of(context).authenticationRepository.signOut();
            Navigator.pushReplacementNamed(context, Routes.splash);
          },
          child: const Text('SignOut'),
        ),
      ),
    );
  }
}
