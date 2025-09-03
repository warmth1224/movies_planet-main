import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_episode.dart';
import 'package:movies_planet/resources/mp_values.dart';

import '../../resources/mp_strings.dart';
import 'cards/mp_episode_card.dart';

class MpEpisodeWidget extends StatelessWidget {
  const MpEpisodeWidget({super.key, required this.episodes});
  final List<MPEpisode> episodes;
  @override
  Widget build(BuildContext context) {
     final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MPSize.size400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: MPPadding.padding10,
              top: MPPadding.padding10
            ),
            child: Text(
              MPStrings.episodes,
              style: textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: MPPadding.padding10),
              physics: const BouncingScrollPhysics(),
              itemCount: episodes.length,
              itemBuilder: (context, index) =>
                  MpEpisodeCard(episode: episodes[index]),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: MPSize.size10),
            ),
          ),
        ],
      ),
    );
  }
}
