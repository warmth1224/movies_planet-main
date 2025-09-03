import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business/popular_tv_bloc/popular_tv_bloc.dart';
import '../../../data/model/mp_media.dart';
import '../../../data/services/service_locator.dart';
import '../../../resources/mp_strings.dart';
import '../../../utils/enums.dart';
import '../../widgets/mp_app_bar.dart';
import '../../widgets/mp_error_widget.dart';
import '../../widgets/mp_loader.dart';
import '../../widgets/mp_vertical_list_view.dart';
import '../../widgets/mp_vertical_list_view_separator.dart';

class PopularShowsView extends StatelessWidget {
  const PopularShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<PopularTvBloc>()..add(FetchPopularTvShowsEvent()),
      child: Scaffold(
        appBar: const MPAppBar(title: MPStrings.popularMovies),
        body: BlocBuilder<PopularTvBloc, PopularTvState>(
          builder: (context, state) {
            switch (state.status) {
              case FetchRequestStatus.loading:
                return const MPLoader();
              case FetchRequestStatus.loaded:
                return _PopularMoviesWidget(
                  movies: state.tvShows,
                );
              case FetchRequestStatus.error:
                return MPErrorWidget(
                    onTryAgainTap: () => context
                        .read<PopularTvBloc>()
                        .add(FetchPopularTvShowsEvent()));
              case FetchRequestStatus.fetchMoreError:
                return _PopularMoviesWidget(movies: state.tvShows);
            }
          },
        ),
      ),
    );
  }
}

class _PopularMoviesWidget extends StatelessWidget {
  const _PopularMoviesWidget({required this.movies});
  final List<MpMedia> movies;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvBloc, PopularTvState>(builder: (_, state) {
      return MpVerticalListViewSeparator(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            return index < movies.length
                ? MPVerticalListView(mpMedia: movies[index])
                : const MPLoader();
          },
          addEvent: () {
            context.read<PopularTvBloc>().add(FetchMorePopularTvShowsEvent());
          });
    });
  }
}
