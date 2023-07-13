import 'package:flutter/material.dart';
import 'package:the_movie_db/main.dart';
import 'package:the_movie_db/src/data/repositories_implementation/connectivity_repositories_impl.dart';
import 'package:the_movie_db/src/domain/repositories/authentication_repository.dart';
import 'package:the_movie_db/src/domain/repositories/connectivity_repository.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    final injector = Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    final hasInternet = await connectivityRepository.hasInternet;

    print('hasInternet $hasInternet');

    if (hasInternet!) {
      final authenticationRepository = injector.authenticationRepository;
      final isSignedIn = await authenticationRepository.isSignendIn;
      if (isSignedIn) {
        final user = await authenticationRepository.getUserData();
        if(user != null) {
          if(mounted) {
            Navigator.pushReplacementNamed(
          context,
          Routes.home,
        );
          }
        } else {
          print('No hay datos del usuario');
        }
        print('get data');
      } else if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          Routes.signin,
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
