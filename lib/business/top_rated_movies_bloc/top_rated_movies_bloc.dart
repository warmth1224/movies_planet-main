import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/movies/usecase/mp_top_rated_movies_usecase.dart';
import 'package:movies_planet/utils/enums.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  TopRatedMoviesBloc(this._moviesUseCase) : super(const TopRatedMoviesState()) {
    on<TopRatedMoviesEvent>(_fetchTopRatedMovies);
    on<FetchMoreTopRatedMoviesEvent>(_fetchMoreTopRatedMovies);
  }
  final MpTopRatedMoviesUseCase _moviesUseCase;
  int page = 1;

  FutureOr<void> _fetchTopRatedMovies(
      TopRatedMoviesEvent event, Emitter<TopRatedMoviesState> emit) async {
    await _fetchMovies(emit);
  }

  FutureOr<void> _fetchMoreTopRatedMovies(FetchMoreTopRatedMoviesEvent event,
      Emitter<TopRatedMoviesState> emit) async {
    final result = await _moviesUseCase(page);
    result.fold(
        (l) => emit(
              state.copyWith(
                  status: FetchRequestStatus.fetchMoreError,
                  message: l.message),
            ), (r) {
      page++;
      emit(
        state.copyWith(
            status: FetchRequestStatus.loaded, movies: state.movies + r),
      );
    });
  }

  Future<void> _fetchMovies(Emitter<TopRatedMoviesState> emit) async {
    final result = await _moviesUseCase(page);

    result.fold(
        (l) => emit(
              state.copyWith(
                  status: FetchRequestStatus.error, message: l.message),
            ), (r) {
      page++;
      emit(
        state.copyWith(
            status: FetchRequestStatus.loaded, movies: state.movies + r),
      );
    });
  }
}
