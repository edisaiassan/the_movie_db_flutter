import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';
import 'package:the_movie_db/src/presentation/global/state_notifier.dart';

class HomeController extends StateNotifier {
  HomeController(
    super.state, {
    required this.trendingRepository,
  });

  final TrendingRepository
      trendingRepository; //Necesitamos esto porque la pantalla va a
  //gestionar varios valores que nos devuelven sus métodos

  Future<void> init() async {
    // Verificar si los datos ya están cargados
  if (state.moviesAndSeries != null) {
    return;
  }

  state = state.copyWith(loading: true);
    final result =
        await trendingRepository.getMoviesAndSeries(state.timeWindow);
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
