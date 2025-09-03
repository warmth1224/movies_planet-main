import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/movies_detail_bloc/movies_detail_event.dart';
import 'package:movies_planet/business/movies_detail_bloc/movies_detail_state.dart';
import 'package:movies_planet/data/movies/usecase/mp_movie_details_usecase.dart';
import 'package:movies_planet/utils/enums.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MPMoviesDetailUseCase _moviesDetailUseCase;

  MovieDetailBloc(this._moviesDetailUseCase) : super(MovieDetailState()) {
    on<GetMovieDetailEvent>(_movieDetail);
  }

  FutureOr<void> _movieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final movieDetail = await _moviesDetailUseCase(event.movieID);
    movieDetail.fold(
        (failureCode) => emit(state.copyWith(status: RequestStatus.error)),
        (getMediaDetail) => emit(state.copyWith(
            status: RequestStatus.loaded, mediaDetails: getMediaDetail)));
  }
}
