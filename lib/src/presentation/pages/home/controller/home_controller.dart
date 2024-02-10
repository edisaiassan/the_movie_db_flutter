import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';
import 'package:the_movie_db/src/presentation/global/state_notifier.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final TrendingRepository trendingRepository;
  HomeController(
    super.state, {
    required this.trendingRepository,
  });

  Future<void> init() async {
    await loadMoviesAndSeries();
    await loadPerformer();
  }

  void onTimeWindowChanged(TimeWindow timeWindow) {
    if (state.moviesAndSeries.timeWindow != timeWindow) {
      state = state.copyWith(
        moviesAndSeries: MoviesAndSeriesState.loading(timeWindow),
      );
      loadMoviesAndSeries();
    }
  }

  Future<void> loadMoviesAndSeries(
      {MoviesAndSeriesState? moviesAndSeries}) async {
        if(moviesAndSeries != null) {
          state = state.copyWith(moviesAndSeries: moviesAndSeries);
        } //se usa para verificar si falló, si falló se vuelve a cargar
    final result = await trendingRepository
        .getMoviesAndSeries(state.moviesAndSeries.timeWindow);
    result.when(
      left: (_) => state = state.copyWith(
          moviesAndSeries:
              MoviesAndSeriesState.failed(state.moviesAndSeries.timeWindow)),
      right: (list) => state = state.copyWith(
        moviesAndSeries: MoviesAndSeriesState.loaded(
          list: list,
          timeWindow: state.moviesAndSeries.timeWindow,
        ),
      ),
    );
  }

  Future<void> loadPerformer({ PerformersState? performersState}) async {
    if(performersState != null) {
      state = state.copyWith(performers: performersState);
    }  //se usa para verificar si falló, si falló se vuelve a cargar
    final performerResult = await trendingRepository.getPerformers();
    performerResult.when(
      left: (_) =>
          state = state.copyWith(performers: const PerformersState.failed()),
      right: (list) =>
          state = state.copyWith(performers: PerformersState.loaded(list)),
    );
  }
}
