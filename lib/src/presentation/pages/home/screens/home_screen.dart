import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
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
            context.read<AuthenticationRepository>().signOut();
            Navigator.pushReplacementNamed(context, Routes.splash);
          },
          child: const Text('SignOut'),
        ),
      ),
    );
  }
}
