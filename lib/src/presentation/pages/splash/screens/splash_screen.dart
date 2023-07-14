import 'package:flutter/material.dart';
import 'package:the_movie_db/main.dart';
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
    final routeName = await () async {
      final injector = Injector.of(context);
      final connectivityRepository = injector.connectivityRepository;
      final hasInternet = await connectivityRepository.hasInternet;

      if (!hasInternet) {
        return Routes.offline;
      }

      final authenticationRepository = injector.authenticationRepository;
      final isSignedIn = await authenticationRepository.isSignedIn;

      if (!isSignedIn) {
        return Routes.signIn;
      }
      final user = await authenticationRepository.getUserData();
      return user == null ? Routes.signIn : Routes.home;
    }();

    if (mounted) {
      _goTo(routeName);
    }
  }

  void _goTo(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
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
