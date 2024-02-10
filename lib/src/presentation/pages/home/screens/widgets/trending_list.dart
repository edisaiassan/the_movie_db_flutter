import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';
import 'package:the_movie_db/src/presentation/global/utils/get_image_url.dart';
import 'package:the_movie_db/src/presentation/global/widgets/request_failed.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/home_controller.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/state/home_state.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_tile.dart';

typedef EitherLisMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Provider.of<HomeController>(context);
    final moviesAndSeries = controller.state.moviesAndSeries;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Trending',
                style: textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            DropdownButton<TimeWindow>(
              items: const [
                DropdownMenuItem(
                  value: TimeWindow.day,
                  child: Text('Last 24h'),
                ),
                DropdownMenuItem(
                  value: TimeWindow.week,
                  child: Text('Last week'),
                ),
              ],
              value: moviesAndSeries.timeWindow,
              onChanged: (timeWindow) {
                controller.onTimeWindowChanged(timeWindow!);
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: SizedBox(
              height: 256.0,
              child: Center(
                child: moviesAndSeries.when(
                  loading: (_) => const CircularProgressIndicator(),
                  failed: (_) => RequestFailed(
                    text: 'Error',
                    onPressed: () {
                      controller.loadMoviesAndSeries(
                        moviesAndSeries: MoviesAndSeriesState.loading(
                            moviesAndSeries.timeWindow),
                      );
                    },
                  ),
                  loaded: (_, list) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    key: const PageStorageKey<int>(1),
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                    itemBuilder: (_, index) {
                      final media = list[index];
                      return TrendingTile(
                        image: getImageUrl(media.posterPath),
                        score: media.voteAverage.toString(),
                        type: media.type == MediaType.movie
                            ? Icons.movie_rounded
                            : Icons.tv_rounded,
                        height: 256.0,
                        width: 171.0,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
