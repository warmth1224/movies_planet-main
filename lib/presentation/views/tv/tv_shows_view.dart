import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/business/tv_bloc/tv_bloc_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_section_header.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view_card.dart';
import 'package:movies_planet/presentation/widgets/mp_slider.dart';
import 'package:movies_planet/resources/mp_routes.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/enums.dart';

import '../../widgets/cards/mp_slider_card.dart';

class TvShowsView extends StatelessWidget {
  const TvShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<TvBloc>()..add(GetTvBlocEvent()),
      child: Scaffold(body: BlocBuilder<TvBloc, TvBlocState>(
        builder: (_, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const MPLoader();
            case RequestStatus.loaded:
              return TvWidget(
                tvShows: state.tvShows[0],
                popularTvShows: state.tvShows[1],
                topRatedTvShows: state.tvShows[2],
              );
            case RequestStatus.error:
              return MPErrorWidget(
                  onTryAgainTap: () =>
                      context.read<TvBloc>().add(GetTvBlocEvent()));
          }
        },
      )),
    );
  }
}

class TvWidget extends StatelessWidget {
  const TvWidget(
      {super.key,
      required this.tvShows,
      required this.popularTvShows,
      required this.topRatedTvShows});
  final List<MpMedia> tvShows;
  final List<MpMedia> popularTvShows;
  final List<MpMedia> topRatedTvShows;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          MPSlider(itemBuilder: (context, index, _) {
            return MPSliderCard(media: tvShows[index], itemIndex: index);
          }),
          MPSectionHeader(
              onSeeAllTap: () => context.goNamed(MPRoutes.popularTvShowsRoute),
              title: MPStrings.popularShows),
          MPSectionListView(
              itemCount: popularTvShows.length,
              height: MPSize.size240,
              itemBuilder: (context, index) =>
                  MPSectionListViewCard(mpMedia: popularTvShows[index])),
          MPSectionHeader(
              onSeeAllTap: () => context.goNamed(MPRoutes.topRatedTvShowsRoute),
              title: MPStrings.topRatedShows),
          MPSectionListView(
              itemCount: topRatedTvShows.length,
              height: MPSize.size240,
              itemBuilder: (context, index) =>
                  MPSectionListViewCard(mpMedia: topRatedTvShows[index])),
        ],
      ),
    );
  }
}
