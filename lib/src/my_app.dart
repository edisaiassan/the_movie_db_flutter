import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/routes/app_routes.dart';
import 'package:the_movie_db/src/presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      routes: appRoutes,
    );
  }
}
