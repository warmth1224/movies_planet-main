import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_popular_tv_shows_usecase.dart';
import '../../data/model/mp_media.dart';
import '../../utils/enums.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  PopularTvBloc(this._useCase) : super(const PopularTvState()) {
    on<FetchPopularTvShowsEvent>(_fetchPopularTvShows);
    on<FetchMorePopularTvShowsEvent>(_fetchMorePopularTvShows);
  }

  final GetPopularTVShowsUseCase _useCase;
  int page = 1;

  Future<void> _fetchTvShows(Emitter<PopularTvState> emit) async {
    final result = await _useCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: FetchRequestStatus.error,
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

  FutureOr<void> _fetchPopularTvShows(
      FetchPopularTvShowsEvent event, Emitter<PopularTvState> emit) async {
    await _fetchTvShows(emit);
  }

  FutureOr<void> _fetchMorePopularTvShows(
      FetchMorePopularTvShowsEvent event, Emitter<PopularTvState> emit) async {
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
