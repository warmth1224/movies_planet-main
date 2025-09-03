import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_top_rated_tv_shows_usecase.dart';
import 'package:movies_planet/utils/enums.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTopRatedTVShowsUseCase _useCase;
  int page = 1;
  TopRatedTvBloc(this._useCase) : super(const TopRatedTvState()) {
    on<FetchTopRatedTvShowsEvent>(_fetchTopRatedTvShows);
    on<FetchMoreTopRatedTvShowsEvent>(_fetchMoreTopRatedTvShows);
  }

  Future<void> _fetchTvShows(Emitter<TopRatedTvState> emitter) async {
    final result = await _useCase(page);
    result.fold(
      (l) => emitter(
        state.copyWith(
          status: FetchRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) {
        page++;
        emitter(
          state.copyWith(
            status: FetchRequestStatus.loaded,
            tvShows: state.tvShows + r,
          ),
        );
      },
    );
  }

  FutureOr<void> _fetchTopRatedTvShows(
      FetchTopRatedTvShowsEvent event, Emitter<TopRatedTvState> emit) async {
    await _fetchTvShows(emit);
  }

  FutureOr<void> _fetchMoreTopRatedTvShows(FetchMoreTopRatedTvShowsEvent event,
      Emitter<TopRatedTvState> emit) async {
    final result = await _useCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: FetchRequestStatus.fetchMoreError,
          message: l.message,
        ),
      ),
      (r) {
        page++;
        emit(
          state.copyWith(
            status: FetchRequestStatus.loaded,
            tvShows: state.tvShows + r,
          ),
        );
      },
    );
  }
}
