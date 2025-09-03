import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/business/movies_bloc/movies_bloc.dart';
import 'package:movies_planet/business/movies_bloc/movies_event.dart';
import 'package:movies_planet/business/movies_bloc/movies_state.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_section_header.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_slider.dart';
import 'package:movies_planet/resources/mp_routes.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/enums.dart';

import '../../widgets/cards/mp_slider_card.dart';
import '../../widgets/mp_error_widget.dart';
import '../../widgets/mp_section_list_view_card.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MoviesBloc>()..add(GetMoviesEvent()),
      child: Scaffold(
        body:
            BlocBuilder<MoviesBloc, MoviesState>(builder: (blocContext, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const MPLoader();
            case RequestStatus.loaded:
              return MoviesWidget(
                nowPlaying: state.movies[0],
                popular: state.movies[1],
                topRated: state.movies[2],
              );
            case RequestStatus.error:
              return MPErrorWidget(
                onTryAgainTap: () =>
                    context.read<MoviesBloc>().add(GetMoviesEvent()),
              );
          }
        }),
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  const MoviesWidget(
      {super.key,
      required this.nowPlaying,
      required this.popular,
      required this.topRated});
  final List<MpMedia> nowPlaying;
  final List<MpMedia> popular;
  final List<MpMedia> topRated;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MPSlider(
            itemBuilder: (context, index, _) {
              return MPSliderCard(media: nowPlaying[index], itemIndex: index);
            },
          ),
          MPSectionHeader(
              onSeeAllTap: () => context.goNamed(MPRoutes.popularMoviesRoute),
              title: MPStrings.popularMovies),
              const SizedBox(height: MPPadding.padding8,),
          MPSectionListView(
              itemCount: popular.length,
              height: MPSize.size240,
              itemBuilder: (_, index) =>
                  MPSectionListViewCard(mpMedia: popular[index])),
          MPSectionHeader(
            title: MPStrings.topRatedMovies,
            onSeeAllTap: () {
              context.goNamed(MPRoutes.topRatedMoviesRoute);
            },
          ),
          const SizedBox(height: MPPadding.padding8,),
          MPSectionListView(
              itemCount: popular.length,
              height: MPSize.size240,
              itemBuilder: (_, index) =>
                  MPSectionListViewCard(mpMedia: topRated[index])),
        ],
      ),
    );
  }
}
