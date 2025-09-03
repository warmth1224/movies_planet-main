import 'package:flutter/material.dart';

import '../../../data/model/mp_episode.dart';
import '../../../data/model/mp_season.dart';
import '../../../resources/mp_strings.dart';
import '../mp_circle.dot.dart';


class MpTVShowCardDetails extends StatelessWidget {
  const MpTVShowCardDetails({
    super.key,
    required this.lastEpisode,
    required this.genres,
    required this.seasons,
  });

  final MPEpisode lastEpisode;
  final String genres;
  final List<MPSeason> seasons;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (lastEpisode.number != 0 &&
        lastEpisode.season != 0 &&
        genres.isNotEmpty &&
        seasons.isNotEmpty) {
      return Row(
        children: [
          Text(
            'S${lastEpisode.season}E${lastEpisode.number}',
            style: textTheme.bodyLarge,
          ),
          const  MPCircleDot(),
          if (genres.isNotEmpty) ...[
            Text(
              genres,
              style: textTheme.bodyLarge,
            ),
            const  MPCircleDot(),
          ] else ...[
            if (seasons.isNotEmpty) ...[
              const MPCircleDot(),
            ]
          ],
          Text(
            _getNbOfSeasons(seasons.length),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

String _getNbOfSeasons(int seasons) {
  return '$seasons ${seasons == 1 ? MPStrings.season : MPStrings.seasons}';
}
