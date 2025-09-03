import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/movies/usecase/mp_popular_movies_usecase.dart';
import 'package:movies_planet/utils/enums.dart';
part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(this._moviesUseCase) : super(PopularMoviesState()) {
    on<FetchPopularMoviesEvent>(_fetchPopularMovies);
    on<FetchMorePopularMoviesEvent>(_fetchMoreMovies);
  }
  final MpPopularMoviesUseCase _moviesUseCase;
  int page = 1;

  FutureOr<void> _fetchMovies(Emitter<PopularMoviesState> emit) async {
    final result = await _moviesUseCase(page);

    result.fold(
        (l) => emit(
              state.copyWith(
                  requestStatus: FetchRequestStatus.error, message: l.message),
            ), (r) {
      page++;
      emit(state.copyWith(
        requestStatus: FetchRequestStatus.loaded,
        movies: state.movies + r,
      ));
    });
  }

  FutureOr<void> _fetchMoreMovies(FetchMorePopularMoviesEvent event,
      Emitter<PopularMoviesState> emit) async {
    final result = await _moviesUseCase(page);

    result.fold(
        (l) => emit(state.copyWith(
              requestStatus: FetchRequestStatus.fetchMoreError,
            )), (r) {
      page++;

      emit(state.copyWith(
        requestStatus: FetchRequestStatus.loaded,
        movies: state.movies + r,
      ));
    });
  }

  FutureOr<void> _fetchPopularMovies(
      FetchPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    await _fetchMovies(emit);
  }
}
