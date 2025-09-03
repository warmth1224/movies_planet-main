import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/movies_detail_bloc/movies_detail_bloc.dart';
import 'package:movies_planet/business/movies_detail_bloc/movies_detail_event.dart';
import 'package:movies_planet/business/movies_detail_bloc/movies_detail_state.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/utils/enums.dart';

import '../../widgets/mp_movies_detail_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieID});
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => serviceLocator<MovieDetailBloc>()
        ..add(GetMovieDetailEvent(movieID: movieID)),
      child: Scaffold(body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (builderContext, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const MPLoader();
            case RequestStatus.loaded:
              return MPMoviesDetailWidget(
                mediaDetails: state.mediaDetails!,
              );

            case RequestStatus.error:
              return MPErrorWidget(
                  onTryAgainTap: () => builderContext
                      .read<MovieDetailBloc>()
                      .add(GetMovieDetailEvent(movieID: movieID)));
          }
        },
      )),
    );
  }
}
