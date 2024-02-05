import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/domain/either/either.dart';
import 'package:the_movie_db/src/domain/either/enums.dart';
import 'package:the_movie_db/src/domain/failures/http_request/http_request_failure.dart';
import 'package:the_movie_db/src/domain/models/media/media.dart';
import 'package:the_movie_db/src/domain/repositories/trending_repository.dart';
import 'package:the_movie_db/src/presentation/global/utils/get_image_url.dart';
import 'package:the_movie_db/src/presentation/global/widgets/request_failed.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_tile.dart';

typedef EitherLisMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  TrendingRepository get _repository => context.read();
  late Future<EitherLisMedia> _future;
  TimeWindow _timeWindow = TimeWindow.day;

  @override
  void initState() {
    _future = _repository.getMoviesAndSeries(_timeWindow);
    super.initState();
  }

  void _updateFuture(TimeWindow timeWindow) {
    setState(() {
      _timeWindow = timeWindow;
      _future = _repository.getMoviesAndSeries(_timeWindow);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
              value: _timeWindow,
              onChanged: (timeWindow) {
                if (timeWindow != null && timeWindow != _timeWindow) {
                  _updateFuture(timeWindow);
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: SizedBox(
              height: 256.0,
              child: FutureBuilder<EitherLisMedia>(
                key: ValueKey(_future),
                future: _future,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return snapshot.data!.when(
                    left: (failure) => RequestFailed(
                      text: 'Ha ocurrido un error',
                      onPressed: () => _updateFuture(_timeWindow),
                    ),
                    right: (list) {
                      if (list.isEmpty) {
                        return RequestFailed(
                          text: 'No hay datos',
                          onPressed: () => _updateFuture(_timeWindow),
                        );
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 8.0),
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
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
