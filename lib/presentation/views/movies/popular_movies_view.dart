import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_app_bar.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_vertical_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_vertical_list_view_separator.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/utils/enums.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<PopularMoviesBloc>()..add(FetchPopularMoviesEvent()),
      child: Scaffold(
        appBar: const MPAppBar(title: MPStrings.popularMovies),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            switch (state.requestStatus) {
              case FetchRequestStatus.loading:
                return const MPLoader();
              case FetchRequestStatus.loaded:
                return _PopularMoviesWidget(
                  movies: state.movies,
                );
              case FetchRequestStatus.error:
                return MPErrorWidget(
                    onTryAgainTap: () => context
                        .read<PopularMoviesBloc>()
                        .add(FetchPopularMoviesEvent()));
              case FetchRequestStatus.fetchMoreError:
                return _PopularMoviesWidget(movies: state.movies);
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
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (_, state) {
      return MpVerticalListViewSeparator(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            return index < movies.length
                ? MPVerticalListView(mpMedia: movies[index])
                : const MPLoader();
          },
          addEvent: () {
            context
                .read<PopularMoviesBloc>()
                .add(FetchMorePopularMoviesEvent());
          });
    });
  }
}
