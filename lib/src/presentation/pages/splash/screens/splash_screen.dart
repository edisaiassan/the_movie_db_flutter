import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/repositories/account_repository.dart';
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
    final routeName = await () async {
      final ConnectivityRepository connectivityRepository = context.read();
      final AuthenticationRepository authenticationRepository = context.read();
      final AccountRepository accountRepository = context.read();
      final hasInternet = await connectivityRepository.hasInternet;


      if (!hasInternet) {
        return Routes.offline;
      }

      final isSignedIn = await authenticationRepository.isSignedIn;

      if (!isSignedIn) {
        return Routes.signIn;
      }
      final user = await accountRepository.getUserData();
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
