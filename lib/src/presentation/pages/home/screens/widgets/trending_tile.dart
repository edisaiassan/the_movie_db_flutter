import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingTile extends StatelessWidget {
  final String image;
  final String score;
  final IconData type;
  const TrendingTile({
    super.key,
    required this.image,
    required this.score,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final borderRadius24 = BorderRadius.circular(24.0);
    const positionedAndPadding = 8.0;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius24,
          child: CachedNetworkImage(
            imageUrl: image,
            height: 256.0,
            width: 171.0,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error_rounded)),
          ),
        ),
        Positioned(
          top: positionedAndPadding,
          right: positionedAndPadding,
          child: Wrap(
            spacing: positionedAndPadding,
            runSpacing: positionedAndPadding,
            direction: Axis.vertical,
            children: [
              Material(
                color: colorScheme.primaryContainer,
                borderRadius: borderRadius24,
                child: Padding(
                  padding: const EdgeInsets.all(positionedAndPadding),
                  child: Text(
                    score,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                child: Icon(type),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
