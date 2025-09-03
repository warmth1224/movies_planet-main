import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_episode_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_error_text.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/mp_functions.dart';

import '../../../data/model/mp_season.dart';
import '../../../resources/mp_colors.dart';
import '../../../resources/mp_strings.dart';
import '../../../utils/enums.dart';
import '../mp_loader.dart';

class MpSeasonCard extends StatelessWidget {
  const MpSeasonCard({super.key, required this.season, required this.tvShowId});
  final MPSeason season;
  final int tvShowId;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => _seasonBottomSheet(context, tvShowId, season.seasonNumber),
      child: SizedBox(
        width: double.infinity,
        height: MPSize.size150,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: MPPadding.padding12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MPImageWithPlaceHolder(
                    imageUrl: season.posterUrl,
                    height: double.infinity,
                    width: MPSize.size100),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    season.name,
                    style: textTheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: MPPadding.padding8),
                    child: Text(
                      '${season.episodeCount} ${MPStrings.episodes.toLowerCase()}',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  if (season.airDate.isNotEmpty) ...[
                    Text(
                      '${MPStrings.airDate} ${season.airDate}',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                  if (season.overview.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: MPPadding.padding6),
                      child: Text(
                        season.overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: MPColors.primaryText, size: MPSize.size20)
          ],
        ),
      ),
    );
  }

  _seasonBottomSheet(context, id, season) {
    mpBottomSheet(
      context,
      BlocProvider.value(
        value: serviceLocator<TvDetailBloc>()
          ..add(
            SeasonDetailEvent(id: id, season: season),
          ),
        child: BlocBuilder<TvDetailBloc, TvDetailState>(
          builder: (context, state) {
            switch (state.seasonRequestStatus) {
              case RequestStatus.loading:
                return const MPLoader();
              case RequestStatus.loaded:
                return MpEpisodeWidget(
                  episodes: state.seasonDetail!.mpEpisodes,
                );

              case RequestStatus.error:
                return const MpErrorText();
            }
          },
        ),
      ),
    );
  }
}
