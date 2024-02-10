import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/data/http/http.dart';
import 'package:the_movie_db/src/data/repositories_implementation/trending_repository_impl.dart';
import 'package:the_movie_db/src/data/services/remote/trending_api.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';
import 'package:the_movie_db/src/presentation/global/state_notifier.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/state/home_state.dart';

/* class HomeController with ChangeNotifier {
  bool loading = false;
  HomeState state = HomeState(
    loading: false,
    timeWindow: TimeWindow.day,
  );
  TrendingRepositoryImpl repository = TrendingRepositoryImpl(
    TrendingApi(
      Http(
        client: Client(),
        apiKey: '8d73e98a010d08d6e272fe2d16cca561',
        baseUrl: 'https://api.themoviedb.org/3',
      ),
    ),
  );

  Future<void> init() async {
    if (state.moviesAndSeries != null) return;
    print('Iniciando');

    state = state.copyWith(loading: true);
    final result = await repository.getMoviesAndSeries(state.timeWindow!);

    print('Conseguido');

    result.when(
      left: (_) {
        state = state.copyWith(
          loading: false,
          moviesAndSeries: null,
        );
      },
      right: (list) {
        state = state.copyWith(
          loading: false,
          moviesAndSeries: list,
        );
      },
    );
    notifyListeners();
  }
}
 */

class HomeController extends StateNotifier<HomeState> {
  final TrendingRepository trendingRepository;
  HomeController(
    super.state, {
    required this.trendingRepository,
  });

  Future<void> init() async {
    if (state.moviesAndSeries != null) return;
    print('Iniciando');

    state = state.copyWith(loading: true);
    final result =
        await trendingRepository.getMoviesAndSeries(state.timeWindow!);

    result.when(
      left: (_) {
        state = state.copyWith(
          loading: false,
          moviesAndSeries: null,
        );
      },
      right: (list) {
        state = state.copyWith(
          loading: false,
          moviesAndSeries: list,
        );
      },
    );
  }
}
