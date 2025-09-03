import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_seasons_section.dart';
import 'package:movies_planet/presentation/widgets/mp_section_title.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/utils/enums.dart';
import 'package:movies_planet/utils/mp_functions.dart';
import '../../widgets/cards/mp_detail_card.dart';
import '../../widgets/cards/mp_episode_card.dart';
import '../../widgets/cards/mp_tv_show_card_details.dart';



class TVDetailsView extends StatelessWidget {
  const TVDetailsView({super.key, required this.tvShowID});
  final int tvShowID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<TvDetailBloc>()
        ..add(
          ShowDetailEvent(id: tvShowID),
        ),
      child: Scaffold(
        body: BlocBuilder<TvDetailBloc, TvDetailState>(
          builder: (context, state) {
            switch (state.showRequestStatus) {
              case RequestStatus.loading:
                return const MPLoader();
              case RequestStatus.loaded:
                return _ShowDetailsWidget(
                  mediaDetails: state.showDetail!,
                );

              case RequestStatus.error:
                return MPErrorWidget(
                    onTryAgainTap: () => context
                        .read<TvDetailBloc>()
                        .add(ShowDetailEvent(id: tvShowID)));
            }
          },
        ),
      ),
    );
  }
}

class _ShowDetailsWidget extends StatelessWidget {
  const _ShowDetailsWidget({required this.mediaDetails});
  final MpMediaDetails mediaDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MPDetailCard(
              mediaDetails: mediaDetails,
              detailWidget: MpTVShowCardDetails(
                genres: mediaDetails.genres,
                lastEpisode: mediaDetails.lastEpisodeToAir!,
                seasons: mediaDetails.seasons!,
              )),
          overViewSection(mediaDetails.overview),
          const MPSectionTitle(title: MPStrings.lastEpisode),
          MpEpisodeCard(episode: mediaDetails.lastEpisodeToAir!),
          const MPSectionTitle(title: MPStrings.season),
          MpSeasonsSection(
              seasons: mediaDetails.seasons!, tvShowId: mediaDetails.tmdbID)
        ],
      ),
      
    );
  }
}
