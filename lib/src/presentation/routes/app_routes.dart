import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/home_screen.dart';
import 'package:the_movie_db/src/presentation/pages/offline/screens/offline_screen.dart';
import 'package:the_movie_db/src/presentation/pages/sign_in/screens/sign_in_screen.dart';
import 'package:the_movie_db/src/presentation/pages/splash/screens/splash_screen.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.splash: (context) => const SplashScreen(),
  Routes.offline: (context) => const OfflineScreen(),
  Routes.signin: (context) => const SignInScreen(),
  Routes.home: (context) => const HomeScreen(),
};