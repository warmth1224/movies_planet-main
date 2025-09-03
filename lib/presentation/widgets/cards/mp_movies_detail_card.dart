import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';

import '../mp_circle.dot.dart';


class MPMoviesDetailCard extends StatelessWidget {
  const MPMoviesDetailCard({
    super.key,
    required this.mediaDetails,
  });

  final MpMediaDetails mediaDetails;


  @override
  Widget build(BuildContext context) {
    
    final textTheme = Theme.of(context).textTheme;
    if (mediaDetails.releaseDate.isNotEmpty &&
        mediaDetails.genres.isNotEmpty &&
        mediaDetails.runtime!.isNotEmpty) {
      return Row(
        children: [
          if (mediaDetails.releaseDate.isNotEmpty) ...[
            Text(
              mediaDetails.releaseDate.split(',')[1],
              style: textTheme.bodyLarge,
            ),
            const MPCircleDot(),
          ],
          if (mediaDetails.genres.isNotEmpty) ...[
            Text(
              mediaDetails.genres,
              style: textTheme.bodyLarge,
            ),
            const MPCircleDot(),
          ] else ...[
            if (mediaDetails.runtime!.isNotEmpty) ...[const MPCircleDot()],
          ],
          Text(
            mediaDetails.runtime!,
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
