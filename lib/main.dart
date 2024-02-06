import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/data/repositories_implementation/account_repository_impl.dart';
import 'package:the_movie_db/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:the_movie_db/src/data/repositories_implementation/connectivity_repository_impl.dart';
import 'package:the_movie_db/src/data/repositories_implementation/trending_repository_impl.dart';
import 'package:the_movie_db/src/data/services/local/session_service.dart';
import 'package:the_movie_db/src/data/services/remote/account_api.dart';
import 'package:the_movie_db/src/data/services/remote/authentication_api.dart';
import 'package:the_movie_db/src/data/services/remote/internet_checker.dart';
import 'package:the_movie_db/src/data/services/remote/trending_api.dart';
import 'package:the_movie_db/src/domain/repositories/account_repository.dart';
import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';
import 'package:the_movie_db/src/my_app.dart';
import 'package:the_movie_db/src/presentation/global/controllers/session_controller.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/home_controller.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/state/home_state.dart';
import 'src/domain/repositories/authentication_repository.dart';
import 'src/domain/repositories/connectivity_repository.dart';

void main() {
  final sessionService = SessionService(const FlutterSecureStorage());
  final http = Http(
    client: Client(),
    apiKey: '8d73e98a010d08d6e272fe2d16cca561',
    baseUrl: 'https://api.themoviedb.org/3',
  );
  final accountAPI = AccountAPI(http);
  runApp(
    MultiProvider(
      providers: [
        Provider<AccountRepository>(
          create: (_) => AccountRepositoryImpl(
            sessionService: sessionService,
            accountAPI: accountAPI,
          ),
        ),
        Provider<ConnectivityRepository>(
          create: (_) => ConnectivityRepositoryImpl(
            Connectivity(),
            InternetChecker(),
          ),
        ),
        Provider<AuthenticationRepository>(
          create: (_) => AuthenticationRepositoryImpl(
            AuthenticationAPI(http),
            sessionService,
            accountAPI,
          ),
        ),
        Provider<TrendingRepository>(
          create: (_) => TrendingRepositoryImpl(TrendingApi(http)),
        ),
        ChangeNotifierProvider<SessionController>(
          create: (context) => SessionController(
            authenticationRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(
            HomeState(loading: true),
            trendingRepository: context.read(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
