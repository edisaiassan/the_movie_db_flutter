import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/pages/splash/screens/splash_screen.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.splash: (context) => const SplashScreen(),
};