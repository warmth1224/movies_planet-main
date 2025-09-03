import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/movies/usecase/mp_movies_use_case.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';
import 'package:movies_planet/utils/enums.dart';

import 'movies_event.dart';
import 'movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase _moviesUseCase;
  MoviesBloc(this._moviesUseCase) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
  }

  Future<void> _getMovies(
      GetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _moviesUseCase(const NoParameters());
    result.fold((l) => emit(state.copyWith(status: RequestStatus.error)),
        (r) => emit(state.copyWith(status: RequestStatus.loaded, movies: r)));
  }
}
