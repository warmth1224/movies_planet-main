import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_app_bar.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_vertical_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_vertical_list_view_separator.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/utils/enums.dart';

import '../../../data/model/mp_media.dart';

class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<TopRatedMoviesBloc>()
        ..add(
          FetchTopRatedMoviesEvent(),
        ),
      child: Scaffold(
        appBar: const MPAppBar(title: MPStrings.topRatedMovies),
        body: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case FetchRequestStatus.loading:
                return const MPLoader();
              case FetchRequestStatus.loaded:
                return _TopRatedMoviesWidget(movies: state.movies);
              case FetchRequestStatus.error:
                return MPErrorWidget(
                  onTryAgainTap: () {
                    context
                        .read<TopRatedMoviesBloc>()
                        .add(FetchTopRatedMoviesEvent());
                  },
                );
              case FetchRequestStatus.fetchMoreError:
                return _TopRatedMoviesWidget(movies: state.movies);
            }
          },
        ),
      ),
    );
  }
}

class _TopRatedMoviesWidget extends StatelessWidget {
  const _TopRatedMoviesWidget({required this.movies});
  final List<MpMedia> movies;
  @override
  Widget build(BuildContext context) {
    return MpVerticalListViewSeparator(
        itemCount: movies.length + 1,
        itemBuilder: (_, index) => index < movies.length
            ? MPVerticalListView(mpMedia: movies[index])
            : const MPLoader(),
        addEvent: () => context
            .read<TopRatedMoviesBloc>()
            .add(FetchMoreTopRatedMoviesEvent()));
  }
}
