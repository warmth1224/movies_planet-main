import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_episode.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_values.dart';

import '../../../resources/mp_strings.dart';


class MpEpisodeCard extends StatelessWidget {
  const MpEpisodeCard({super.key, required this.episode});
  final MPEpisode episode;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: MPSize.size100,
      padding: const EdgeInsets.symmetric(horizontal: MPPadding.padding12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: MPPadding.padding10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MPImageWithPlaceHolder(
                  imageUrl: episode.stillPath,
                  height: double.infinity,
                  width: MPSize.size160),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${MPStrings.episode} ${episode.number}',
                style: textTheme.bodyMedium,
              ),
              Text(
                episode.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
              Text(
                episode.airDate,
                style: textTheme.bodyLarge,
              ),
              Text(
                episode.runtime,
                style: textTheme.bodyLarge,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
