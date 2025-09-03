import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_season.dart';
import 'package:movies_planet/resources/mp_values.dart';

import 'cards/mp_season_card.dart';

class MpSeasonsSection extends StatelessWidget {
  const MpSeasonsSection({
    super.key,
    required this.seasons,
    required this.tvShowId,
  });

  final List<MPSeason> seasons;
  final int tvShowId;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: MPSize.size400),
      child: ListView.separated(
          itemBuilder: (_, index) =>
              MpSeasonCard(season: seasons[index], tvShowId: tvShowId),
          separatorBuilder: (_, index) => const SizedBox(
                height: MPSize.size24,
              ),
          itemCount: seasons.length),
    );
  }
}
