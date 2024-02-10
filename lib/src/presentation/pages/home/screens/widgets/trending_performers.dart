import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/src/presentation/global/utils/get_image_url.dart';
import 'package:the_movie_db/src/presentation/global/widgets/request_failed.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/home_controller.dart';
import 'package:the_movie_db/src/presentation/pages/home/controller/state/home_state.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/widgets/trending_tile.dart';

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final HomeController controller = context.watch();
    final performers = controller.state.performers;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Actores',
            style: textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 512.0,
          child: Center(
            child: performers.when(
              loading: () => const CircularProgressIndicator(),
              failed: () => RequestFailed(
                text: 'Ha ocurrido un error',
                onPressed: () {
                  controller.loadPerformer(performersState: const PerformersState.loading());
                },
              ),
              loaded: (listPerformer) => ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      padEnds: false,
                      key: const PageStorageKey<int>(2),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listPerformer.length,
                      itemBuilder: (_, index) {
                        final performer = listPerformer[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedNetworkImage(
                                imageUrl: getImageUrl(performer.profilePath),
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 8.0, 16.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        colorScheme.primaryContainer,
                                        colorScheme.primaryContainer
                                            .withOpacity(0.875),
                                        colorScheme.primaryContainer
                                            .withOpacity(0.75),
                                        colorScheme.primaryContainer
                                            .withOpacity(0.625),
                                        colorScheme.primaryContainer
                                            .withOpacity(0.5),
                                        colorScheme.primaryContainer
                                            .withOpacity(0.125),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    performer.name,
                                    style: textTheme.labelLarge?.copyWith(
                                        color: colorScheme.onPrimaryContainer),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 24.0, 8.0, 32.0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 128.0,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (_, index) {
                                                final media =
                                                    performer.knownFor[index];
                                                return TrendingTile(
                                                  image: getImageUrl(
                                                      media.posterPath),
                                                  height: 128.0,
                                                  width: 86.0,
                                                );
                                              },
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(width: 8.0),
                                              itemCount:
                                                  performer.knownFor.length,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (_, __) {
                        final int currentCard =
                            _pageController.page?.toInt() ?? 0;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            key: const PageStorageKey<int>(3),
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              listPerformer.length,
                              (index) => Icon(
                                Icons.circle,
                                size: 16.0,
                                color: currentCard == index
                                    ? colorScheme.primary
                                    : colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
