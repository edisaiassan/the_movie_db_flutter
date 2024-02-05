import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingTile extends StatelessWidget {
  final String image;
  final String? score;
  final IconData? type;
  final double height;
  final double width; 
  const TrendingTile({
    super.key,
    required this.image,
     this.score,
     this.type, required this.height, required this.width,
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
            height: height,
            width: width,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error_rounded)),
          ),
        ),
        if(type != null || score != null)
        Positioned(
          top: positionedAndPadding,
          right: positionedAndPadding,
          child: Wrap(
            spacing: positionedAndPadding,
            runSpacing: positionedAndPadding,
            crossAxisAlignment: WrapCrossAlignment.end,
            direction: Axis.vertical,
            children: [
              if(score != null)
              Material(
                color: colorScheme.primaryContainer,
                borderRadius: borderRadius24,
                child: Padding(
                  padding: const EdgeInsets.all(positionedAndPadding),
                  child: Text(
                    score!,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
              if(type != null)
              CircleAvatar(
                child: Icon(type!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
